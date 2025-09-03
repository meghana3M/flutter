import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
class MyInheritedWidget extends InheritedWidget{
  final int counter;
  const MyInheritedWidget({super.key,required this.counter, required super.child,});
  static MyInheritedWidget ? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget){
    return oldWidget.counter != counter;
  }
}
void main(){
  runApp(const AdvancedWidgetsDemo());
}
class AdvancedWidgetsDemo extends StatefulWidget{
  const AdvancedWidgetsDemo({super.key});
  @override
  State<AdvancedWidgetsDemo> createState() => _playgroundAppState();
}
class _playgroundAppState extends State<AdvancedWidgetsDemo>{
  int inheritedCounter = 0;
  final ValueNotifier<int> valueNotifier = ValueNotifier(0);
  final StreamController<int> streamController = StreamController<int>();
  @override
  void dispose(){
    valueNotifier.dispose();
    streamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return MyInheritedWidget(counter: inheritedCounter, child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Advanced Widgets Demo'),),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FutureBuilder(future: Future.delayed(const Duration(seconds: 2),() => "Future done"), builder: (context, snapshot){
              return Card(
                child: ListTile(
                 title: const Text('FutureBuilder'),
                 subtitle: Text(snapshot.hasData?snapshot.data!: 'Waiting.....'),
                ),
              );
            },),
            StreamBuilder<int>(stream: streamController.stream, builder: (context, snapshot){
              return Card(
                child: ListTile(
                  title: const Text('StreamBuilder'),
                  subtitle: Text(snapshot.data?. toString() ?? 'NO data yet'),
                  trailing: ElevatedButton(onPressed: ()=>streamController.add(DateTime.now().second), child: const Text('Add'),),
                ),
              );
            },),
            Card(child: ListTile(
              title: const Text('InheritedWidget'),
              subtitle: Text('Counter: ${MyInheritedWidget.of(context)?.counter??0}'),
              trailing: ElevatedButton(onPressed: (){
                setState(() {
                  inheritedCounter++;
                });
              }, child: const Text('Increment'),),
            ),),
            ValueListenableBuilder(valueListenable: valueNotifier, builder: (context, value, child){
              return Card(
                child: ListTile(
                  title: const Text('ValueListenableBuilder'),
                  subtitle: Text('Value: $value'),
                  trailing: ElevatedButton(onPressed: ()=>valueNotifier.value++, child: const Text('Increment'),),
                ),
              );
            },),
            LayoutBuilder(builder: (context, constraints){
              return Card(
                child: ListTile(
                  title: const Text('LayoutBuilder'),
                  subtitle: Text('Max Width: ${constraints.maxWidth.toStringAsFixed(2)}'),
                ),
              );
            },),
            SizedBox(height: 100,child: NotificationListener<ScrollNotification>(onNotification: (notification){
              debugPrint('Scrolled: ${notification.metrics.pixels}');
              return true;
            },
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index) => Container(
                  width: 80,
                  margin: const EdgeInsets.all(8),
                  color: Colors.blue[100*((index % 8)+1)],
                  child: Center(child: Text('Item $index'),),
                ),
              ),
            ),),
            Listener(
              onPointerDown: (_) => debugPrint('Pointer Down!'),
              child: Card(
                child: ListTile(title: const Text('Listener'),subtitle: const Text('Tap here'),),

              ),
            ),
            RawGestureDetector(
              gestures: {
                TapGestureRecognizer:GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
                    ()=> TapGestureRecognizer(),
                    (instance){
                      instance.onTap = () => debugPrint("Raw Gesture Tap!");
                    },
                ),
              },
              child: Card(
                child: ListTile(title: const Text('RawGestureDetector'),
                subtitle: const Text('Tap here'),
                ),
              ),
            ),
            SizedBox(height: 150,child: CustomScrollView(slivers: [
              const SliverAppBar(
                title: Text('SliverAppBar'),
                floating: true,
              ),
              SliverList(delegate: SliverChildBuilderDelegate(
                  (context , index) => ListTile(title: Text('Sliver Item $index'),),
                childCount: 3,
              ),),
            ],),),
            ElevatedButton(onPressed: (){
              final overlay = Overlay.of(context);
              final entry = OverlayEntry(builder: (_)=> Stack(children: [
                ModalBarrier(color: Colors.black54,dismissible: true,),
                Center(child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: const Text('Hello from Overlay!'),
                ),),
              ],),);
              overlay.insert(entry);
              Future.delayed(const Duration(seconds: 2),()=> entry.remove());
            }, child: const Text('Show Overlay'),),
            DragTarget<Color>(builder: (context , candidate, rejected){
              return Container(
                height: 100,
                color: candidate.isEmpty? Colors.grey[200]:Colors.green[200],
                child: const Center(child: Text('Drag Here'),),
              );
            },
            onAccept: (color){
              debugPrint('Dropped color: $color');
            },
            ),
            Draggable<Color>(data: Colors.red,child: Container(width: 50,height: 50,color: Colors.red), feedback: Container(width: 50,height: 50,color: Colors.red,),childWhenDragging: Container(width: 50,height: 50,color: Colors.pink),),
            Dismissible(key: UniqueKey(), background: Container(color: Colors.red,),child: const Card(child: ListTile(title: Text('Dismiss me'),),),
            ),
            RepaintBoundary(
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 50,
                color: Colors.blue,
                child: const Center(child: Text('RepainBoundary'),),
              ),
            ),
            Semantics(
              label: 'Custom accessibility label',
              child: Card(
                child: ListTile(title: Text('Semantics Widget'),),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
