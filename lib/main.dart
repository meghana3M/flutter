import 'package:flutter/material.dart';
import 'basic_widgets_demo.dart';
import 'layout_widgets_demo.dart';
import 'input_widgets_demo.dart';
import 'styling_widgets_demo.dart';
import 'scrolling_widgets_demo.dart';
import 'animation_widgets_demo.dart';
import 'advanced_widgets_demo.dart';
import 'material_widgets_demo.dart';
void main(){
  runApp(WidgetsPlaygroundApp());
}
class WidgetsPlaygroundApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Widgets",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget{
  final List<Map<String, dynamic>> categories = [
    {
      "icon":Icons.widgets,
      "title":"Basic Widgets",
      "page":BasicWidgetsDemo(),
    },
    {
      "icon":Icons.view_quilt,
      "title":"Layout Widgets",
      "page":LayoutWidgetsDemo(),
    },
    {
      "icon":Icons.input,
      "title":"Input & Forms",
      "page":InputWidgetsDemo(),
    },
    {
      "icon":Icons.format_paint,
      "title":"Styling & Theming",
      "page":StylingWidgetsDemo(),
    },
    {
      "icon": Icons.list,
      "title": "Scrolling & Lists",
      "page":ScrollingWidgetsDemo(),
    },
    {
      "icon": Icons.animation,
      "title": "Animations & Motion",
      "page":AnimationWidgetsDemo(),
    },
    {
      "icon": Icons.build,
      "title": "Advanced Widgets",
      "page":AdvancedWidgetsDemo(),
    },
    {
      "icon":Icons.layers,
      "title":"Material Components",
      "page":MyWidgetCatalogApp(),
    },
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Center(child: Text('Widgets Playground',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),))),
      body: GridView.count(
        padding: EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: categories.map((cat){
          return GestureDetector(
            onTap: (){
               Navigator.push(context,
                MaterialPageRoute(builder: (_) => cat["page"]),
               );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(cat["icon"],size: 34,color: Colors.blue),
                  SizedBox(height: 10),
                  Text(
                    cat["title"],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}