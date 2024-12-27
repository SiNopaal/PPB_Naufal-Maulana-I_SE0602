import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided/add_screen.dart';
import 'package:unguided/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/add', page: () => AddScreen())
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,

      ),
    );
  }
}
