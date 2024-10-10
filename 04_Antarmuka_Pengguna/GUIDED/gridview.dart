import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SiNopal"),
        backgroundColor: Color.alphaBlend(Colors.pinkAccent, Colors.white),
      ),
      body: GridView.count(
        crossAxisCount: 3, // 3 kolom
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(12),
        children: [
          // Container 1
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 8),
                Text('Add', style: TextStyle(color: Colors.white)),
              ],
            ),
            color: Colors.black,
          ),
          // Container 2
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.home, color: Colors.white),
                SizedBox(width: 8),
                Text('Home', style: TextStyle(color: Colors.white)),
              ],
            ),
            color: Colors.blue,
          ),
          // Container 3
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.favorite, color: Colors.white),
                SizedBox(width: 8),
                Text('Love Profile', style: TextStyle(color: Colors.white)),
              ],
            ),
            color: Colors.green,
          ),
          // Container 4
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.phone, color: Colors.white),
                SizedBox(width: 8),
                Text('Telephone', style: TextStyle(color: Colors.white)),
              ],
            ),
            color: Colors.red,
          ),
          // Container 5
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.camera, color: Colors.white),
                SizedBox(width: 8),
                Text('Camera', style: TextStyle(color: Colors.white)),
              ],
            ),
            color: Colors.purple,
          ),
          // Container 6
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.settings, color: Colors.white),
                SizedBox(width: 8),
                Text('Setting', style: TextStyle(color: Colors.white)),
              ],
            ),
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
