import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AddController noteController = Get.put(AddController());  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unguided Note App'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Obx(() {
        if (noteController.notes.isEmpty) {
          return Center(
            child: Text('Tidak ada catatan', style: TextStyle(fontSize: 20),),
          );
        }
        return ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) {
            final note = noteController.notes[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(note['title'] ?? ''),
                subtitle: Text(note['description'] ?? ''),
                trailing: IconButton(
                  onPressed: () => noteController.confirmDelete(context, index),
                  icon: Icon(Icons.delete, color: Colors.blue,)
                ),
              ),
            );
          }
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
