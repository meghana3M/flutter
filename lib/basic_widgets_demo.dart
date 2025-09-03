import 'package:flutter/material.dart';
class BasicWidgetsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Widgets'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('This is a Text Widget',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.amber,
              child: Text('This is inside a Container'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Row:'),
                Icon(Icons.star, color: Colors.red,),
                Icon(Icons.star, color: Colors.green,),
              ],
            ),
            Column(
              children: [
                Text('Column Example'),
                Icon(Icons.favorite, color: Colors.pink,),
              ],
            ),
            Image.network(''
                'https://picsum.photos/400/300',
              height: 100,
            ),
            Icon(
              Icons.home, size: 40,color: Colors.blue,
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.add),),
            ElevatedButton(onPressed: (){}, child: Text('Elevated Button')),
            TextButton(onPressed: (){}, child: Text('Text Button')),
            OutlinedButton(onPressed: (){}, child: Text('Outlined Button')),
            Center(
              child: Text('Centered Text'),
            ),
            Row(
              children: [
                Expanded(child: Container(color: Colors.red,height: 30,)),
                Spacer(),
                Expanded(child: Container(color: Colors.blue,height: 30,)),
              ],
            ),
            SizedBox(height: 30,),
            Padding(padding: EdgeInsets.all(20),
            child: Text('Text with padding'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text('Aligned Right'),
            ),
            Stack(
              children: [
                Container(width: 100,height: 100,color: Colors.yellow),
                Positioned(top: 20,left: 20,
                child: Container(width: 50,height: 50,color: Colors.red),)
              ],
            ),
            Material(
              elevation: 5,
              child: Padding(padding: EdgeInsets.all(10),
              child: Text("Material with elevation"),),
            ),
            Card(
              child: ListTile(
                title: Text('This is a Card with ListTile'),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("ListTile Example"),
              subtitle: Text('Subtitle here'),
              trailing: Icon(Icons.arrow_forward),
            ),

          ],
        ),
      ),
    );
  }
}
