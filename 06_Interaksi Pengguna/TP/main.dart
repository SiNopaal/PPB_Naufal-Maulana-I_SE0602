mport 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    WisataScreen(),
    ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latihan Bottom Navigation Bar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 10,
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[50],
      alignment: Alignment.center,
      child: Text(
        'Ini adalah halaman Home',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

class WisataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[50],
      alignment: Alignment.center,
      child: Text(
        'Ini adalah halaman Wisata',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.green[700],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[50],
      alignment: Alignment.center,
      child: Text(
        'Ini adalah halaman Profil',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.amber[800],
        ),
      ),
    );
  }
}
