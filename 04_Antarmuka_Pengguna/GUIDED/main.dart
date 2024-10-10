import 'package:flutter/material.dart';
import 'package:modul_4/stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StackScreen(), // Menampilkan Gridview sebagai halaman utama
    );
  }
}
