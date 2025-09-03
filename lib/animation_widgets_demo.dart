import 'package:flutter/material.dart';
class AnimationWidgetsDemo extends StatefulWidget {
  const AnimationWidgetsDemo({super.key});

  @override
  State<AnimationWidgetsDemo> createState() => _AnimationWidgetsDemoState();
}

class _AnimationWidgetsDemoState extends State<AnimationWidgetsDemo> with SingleTickerProviderStateMixin{
 bool _toggled = false;
 late AnimationController _controller;
 late Animation<double> _curvedAnimation;

 @override
  void initState(){
   super.initState();
   _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2),
   );
   _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
 }
 @override
  void dispose(){
   _controller.dispose();
   super.dispose();
 }
 void _toggle(){
   setState(() => _toggled = !_toggled);
   _toggled ? _controller.forward(): _controller.reverse();
 }
 @override
  Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(title: const Text('Animation Widgets Demo')),
     body: ListView(
       padding: const EdgeInsets.all(16),
       children: [
         _buildSection(
           'AnimatedContainer',
           AnimatedContainer(
             duration: const Duration(seconds: 1),
             width: _toggled ? 200:100,
             height: 100,
             color: _toggled ? Colors.blue : Colors.red,
             alignment: _toggled ? Alignment.center: Alignment.topCenter,
             child: const Text('Tap button to animate'),
           ),
         ),
         _buildSection(
           'AnimatedOpacity',
           AnimatedOpacity(opacity: _toggled ? 1.0 : 0.2,
           duration: const Duration(seconds: 1),
             child: Container(width: 100,height: 100,color: Colors.purple),
           ),
         ),
         _buildSection('AnimatedCrossFade',
           AnimatedCrossFade(
             firstChild: Container(width: 100,height: 100,color: Colors.orange),
             secondChild: Container(width: 100,height: 100,color: Colors.green),
             duration: const Duration(seconds: 1),
             crossFadeState: _toggled ? CrossFadeState.showSecond:CrossFadeState.showFirst,
           ),
         ),
         _buildSection(
           'AnimatedDefaultTextStyle',
           AnimatedDefaultTextStyle(child: const Text('Animated Text Style'), style: TextStyle(fontSize: _toggled ? 30:16, color: _toggled?Colors.blue:Colors.black,), duration: const Duration(seconds : 1),),
         ),
   _buildSection(
     'AnimatedPositioned',
     SizedBox(
       height: 150,
       child: Stack(
         children: [
           AnimatedPositioned(
             child: Container(width: 50,height: 50,color: Colors.teal,),
             left: _toggled ? 100 : 0,
             right: _toggled ? 50 : 0,
             duration: const Duration(seconds: 1),)
         ],
       ),
     ),
   ),
         _buildSection(
           'AnimatedSize',
           AnimatedSize(duration: const Duration(seconds: 1),
           child: Container(
             width: _toggled ? 150 : 50,
             height: _toggled ? 150 : 50,
             color: Colors.indigo,
           ),
           ),
         ),
         _buildSection(
           'Hero(Tap box)',
           GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (_) => const HeroSecondScreen(),),);
             },
             child: Hero(tag: 'hero-demo', child: Container(width: 100,height: 100,color: Colors.cyan),),
           ),
         ),
         _buildSection(
           'ScaleTransition',
           ScaleTransition(
             scale: _curvedAnimation,
             child: Container(width: 100,height: 100,color: Colors.pink),
           ),
         ),
         _buildSection(
           'RotationTransition',
           RotationTransition(turns: _curvedAnimation, child: Container(width: 100,height: 100,color: Colors.grey,),),
         ),
         _buildSection(
           'SlideTransition',
           SlideTransition(position: Tween<Offset>(
             begin: const Offset(-1,0),
             end: Offset.zero,
           ).animate(_curvedAnimation),
           child: Container(width: 100,height: 100,color: Colors.brown,),
           ),
         ),
         _buildSection(
           'TweenAnimationBuilder',
           TweenAnimationBuilder<double>(tween: Tween(begin: 0.0,end: _toggled ? 1.0:0.0), duration: const Duration(seconds: 1), builder: (context , value, child){
             return Opacity(opacity: value, child: Container(width: 100,height: 100,color: Colors.red,),);
           },),
         ),
       ],
     ),
     floatingActionButton: FloatingActionButton(onPressed: _toggle, child: const Icon(Icons.play_arrow),),
   );
 }

 Widget _buildSection(String title, Widget child){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(title, style: const TextStyle(fontSize:18,fontWeight:FontWeight.bold),),
       const SizedBox(height: 8,),
       child,
       const Divider(),
     ],
   );
 }
}

class HeroSecondScreen extends StatelessWidget{
  const HeroSecondScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:const Text('Hero Second Screen')),
      body: Center(
        child: Hero(
          tag: 'hero-demo',
          child: Container(width: 200,height: 200,color: Colors.cyan),
        ),
      ),
    );
  }
}
