import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RekomendasiWisata(),
    );
  }
}

class RekomendasiWisata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Wisata'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Nama Tempat Wisata',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://example.com/gambar_tempat_wisata.jpg', // Ganti dengan URL gambar yang valid
              height: 250,
              width: 400,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Deskripsi singkat mengenai tempat wisata ini. Tempat ini sangat indah dengan pemandangan yang menakjubkan dan menawarkan berbagai aktivitas untuk wisatawan.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi saat tombol ditekan
                print('Kunjungi Tempat');
              },
              child: Text('Kunjungi Tempat'),
            ),
          ],
        ),
      ),
    );
  }
}
