import 'package:flutter/material.dart';
class LayoutWidgetsDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Widgets'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: GridView.count(crossAxisCount: 3,
              children:List.generate(6, (index){
                return Container(
                 margin: EdgeInsets.all(5),
                 color: Colors.blue[(index+1)*100],
                );
              }),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(width: 80, color: Colors.red),
                  Container(width: 80,color: Colors.green),
                  Container(width: 80,color: Colors.blue),
                ],
              ),
            ),
            Container(
              height: 200,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 50,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('SliverAppBar'),
                    ),
                  ),
                  SliverList(delegate: SliverChildBuilderDelegate(
                      (context , index)=>ListTile(title: Text('Item $index')),
                    childCount: 5,
                  ),),
                ],
              ),
            ),
            Row(
              children: [
                Flexible(child: Container(height: 50,color: Colors.red)),
                Flexible(child: Container(height: 50,color: Colors.green)),
              ],
            ),
            Wrap(
              spacing: 10,
              children: List.generate(
               5, (i)=> Chip(label: Text('Item $i')),
              ),
            ),
            Container(
              height: 100,
              child: Flow(delegate: MyFlowDelegate(),
                children: List.generate(5, (i)=> Container(width: 50,height: 50,color: Colors.primaries[i],),),),

            ),
            IndexedStack(
              index: 1,
              children: [
                Container(width: 100,height: 50,color:Colors.red),
                Container(width: 100,height: 50,color: Colors.green),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('Hello', style: TextStyle(fontSize: 20)),
                Text('World',style: TextStyle(fontSize: 40)),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
              maxWidth: 200,
              minHeight: 50
            ),
            child: Container(color: Colors.amber,height: 100),),

            FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(height: 40,color: Colors.purple),
            ),

            LimitedBox(
              maxHeight: 50,
              child: Container(height: 200,color: Colors.orange),
            ),

            AspectRatio(aspectRatio: 16/9,
            child: Container(color: Colors.teal),),

            IntrinsicHeight(
              child: Row(
                children: [
                  Container(color: Colors.red,width: 50,height: 100),
                  Container(color: Colors.green,width: 50,height: 200),
                ],
              ),
            ),
            IntrinsicWidth(
              child: Row(
                children: [
                  Container(color: Colors.blue,width: 50,height: 100),
                  Container(color: Colors.pink,width: 50,height: 100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class MyFlowDelegate extends FlowDelegate{
  @override
  void paintChildren(FlowPaintingContext context){
    double x = 0.0;
    double y = 0.0;
    for(int i = 0 ; i < context.childCount; i++){
      var w = context.getChildSize(i)!.width;
      if(x+w < context.size.width){
        context.paintChild(i,transform: Matrix4.translationValues(x, y, 0));
        x+= w+10;
      }
      else{
        x = 0;
        y += context.getChildSize(i)!.height+10;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x+=w+10;
      }
    }
  }
  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}