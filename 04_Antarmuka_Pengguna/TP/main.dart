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
        primarySwatch: Colors.pink,
      ),
      home: RekomendasiWisataScreen(),
    );
  }
}

class RekomendasiWisataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Wisata'),
        backgroundColor: Colors.pink[600],
      ),
      body: SingleChildScrollView(  // Tambahkan SingleChildScrollView di sini
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.pink[100]!,
                Colors.pink[300]!,
                Colors.pink[600]!,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Judul Tempat Wisata
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pantai Menganti Kebumen',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),

                // Gambar Tempat Wisata dengan rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    'https://i.imgur.com/JFWMraQ.jpg',
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),

                // Card untuk Deskripsi Tempat Wisata
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Pantai Menganti terletak di Desa Karangduwur, Kecamatan Ayah, Kabupaten Kebumen. '
                        'Perjalanan dari Kota Kebumen menuju Pantai Menganti memiliki jarak sekitar 40 km. '
                        'Rute yang dapat diambil adalah melalui arah selatan Kebumen, '
                        'dengan urutan rute perjalanan sebagai berikut: Kebumen – Petanahan – Puring – Karangbolong – Menganti. '
                        'Alternatif lainnya adalah melalui rute Kebumen – Gombong, kemudian menuju ke arah Jatijajar, '
                        'yang juga memiliki waktu tempuh sekitar 60 menit.\n\n'
                        'Pantai Menganti adalah destinasi wisata yang terjangkau. Pengunjung hanya perlu membayar tiket masuk sebesar Rp 10.000, '
                        'yang sudah mencakup biaya parkir. Pantai ini juga menawarkan shuttle mobil untuk mengelilingi berbagai obyek wisata sekitar pantai. Pantai Menganti terkenal dengan pemandangan matahari terbit dan terbenam yang menakjubkan.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14, height: 1.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Tombol Kunjungi
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pink[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shadowColor: Colors.pink[300],
                    elevation: 5,
                  ),
                  onPressed: () {
                    // Tambahkan kode tindakan di sini!
                  },
                  child: Text(
                    'Kunjungi Wisata',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
