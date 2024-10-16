import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible vs Expanded'),
        backgroundColor: const Color.fromARGB(255, 29, 7, 172),
      ),
      body: Column(
        children: [
          // Flexible
          Text("Flexible"),
          const SizedBox(height: 5),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 0, 0, 0)
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(255, 191, 90, 241),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Flexible takes up the remaining space but can shrink if needed.",
                    ),
                  ),
                ),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
          const SizedBox(height: 20),
          // Expanded
          Text("Expanded"),
          const SizedBox(height: 5),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 25, 20, 19),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color:const Color.fromARGB(255, 191, 90, 241),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Expanded forces the widget to take up all the remaining space. It can never shrink. This is the default value. It can be used if you want to force the widget to take up all the remaining space.", 
                    ),
                  ),
                ),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
        ],
      ),
    );
  }
}