import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Screen'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          buildContainerItem('Type A', Colors.red[300]!),
          buildContainerItem('Type B', Colors.blue[300]!),
          buildContainerItem('Type C', Colors.yellow[300]!),
          buildContainerItem('Type D', Colors.green[300]!),
        ],
      ),
    );
  }

  // Helper method to build a container with border radius and shadow
  Widget buildContainerItem(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15), // Border radius for smooth edges
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            blurRadius: 10, // Spread of the shadow
            offset: const Offset(0, 5), // Position of the shadow
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Icon(
            Icons.label,
            size: 40,
            color: const Color.fromARGB(255, 21, 8, 8),
          ),
          const SizedBox(width: 20),
          // Text and description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 1, 1),
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}
