import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP_09',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(
          secondary: Colors.pinkAccent,
        ),
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final picker = ImagePicker();

  // Fungsi untuk memilih gambar dari kamera
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);  // Menyimpan gambar yang dipilih ke variabel _image
      });
    }
  }

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);  // Menyimpan gambar yang dipilih ke variabel _image
      });
    }
  }

  // Fungsi untuk menghapus gambar yang ada
  void _deleteImage() {
    setState(() {
      _image = null;  // Menghapus gambar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Pick Picture"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple[600],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Menampilkan gambar yang dipilih atau ikon jika gambar belum dipilih
                _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.file(
                          _image!,  // Menampilkan gambar dari file
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.image_outlined,
                        size: 100,
                        color: Colors.grey[400],
                      ),
                SizedBox(height: 20),
                Text(
                  'Choose an option to pick an image',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Tombol untuk memilih gambar dari kamera
                    ElevatedButton.icon(
                      onPressed: _pickImageFromCamera,
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                      label: Text("Camera"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[400],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    // Tombol untuk memilih gambar dari galeri
                    ElevatedButton.icon(
                      onPressed: _pickImageFromGallery,
                      icon: Icon(Icons.photo, color: Colors.white),
                      label: Text("Gallery"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[400],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    // Tombol untuk menghapus gambar
                    ElevatedButton.icon(
                      onPressed: _deleteImage,
                      icon: Icon(Icons.delete, color: Colors.white),
                      label: Text("Delete"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
