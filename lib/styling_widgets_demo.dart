import 'package:flutter/material.dart';
import 'dart:ui';
class StylingWidgetsDemo extends StatelessWidget {
  const StylingWidgetsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18,color: Colors.black),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Styling & Theming Widgets'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Screen Width : ${MediaQuery.of(context).size.width}'),
              const SizedBox(height: 20,),
              const Text('RichText Example'),
              RichText(text: TextSpan(
                text: 'Hello',
                    style:TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  TextSpan(
                    text: "Flutter",
                    style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold
                    ),),
                    TextSpan(
                      text: 'World!',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                ],
              ),
              ),
              const SizedBox(height: 20,),
              const Text('DefaultTextStyle Example:'),
              const DefaultTextStyle(style: TextStyle(fontSize: 18, color: Colors.green),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('This is green text'),
                      Text('This is also green text'),
                    ],
                  ),
              ),
              const SizedBox(height: 20,),
              DecoratedBox(decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5),
                ],
              ),
                child: Padding(padding: EdgeInsets.all(16),
                child: Text('I am inside a decorated box'),
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Opacity Example: '),
              Opacity(opacity: 0.5,
               child: Container(
                 height: 80,
                 width: 200,
                 color: Colors.blue,
                 alignment: Alignment.center,
                 child: const Text('Half Transparent',
                   style: TextStyle(color: Colors.white),
                 ),
               ),
              ),
              const SizedBox(height: 20,),
              const Text('Transform Example'),
              Transform.rotate(angle: 0.2,
              child: Container(
                height: 80,
                width: 200,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text('Rotated Box',
                 style: TextStyle(color: Colors.white),
                ),
              ),
              ),
              const SizedBox(height: 20,),
              const Text('ClipRect, ClipRRect, ClipOval Examples:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.5,
                      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLat8bZvhXD3ChSXyzGsFVh6qgplm1KhYPKA&s'),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network('https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-souvenirpixels-414612.jpg&fm=jpg'),
                  ),
                  ClipOval(
                    child: Image.network('https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630'),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              const Text("Backdropfilter Example"),
              Stack(
                children: [
                  Image.network('https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg'),
                  Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                  ),),
                  const Positioned.fill(child: Center(
                    child: Text("Blurred Background",
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                     ),
                    ),
                  ),),
                ],
              ),
              const SizedBox(height: 20,),
              const Text('ShaderMask Example:'),
              ShaderMask(shaderCallback: (bounds)=>const LinearGradient(colors: [Colors.red, Colors.blue],
               begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Text('Gradient Text',
              style: TextStyle(fontSize: 40,color: Colors.white),
              ),),
              const SizedBox(height: 20,),
              const Text('CustomPaint Example'),
              CustomPaint(
                size: const Size(200, 200),
                painter: MyCirclePainter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MyCirclePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    final paint = Paint()
        ..color = Colors.purple
        ..style = PaintingStyle.fill;
    canvas.drawCircle(size.center(Offset.zero), 80, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}