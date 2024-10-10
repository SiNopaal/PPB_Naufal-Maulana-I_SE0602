import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata Banyumas',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WisataBanyumasScreen(),
    );
  }
}

class WisataBanyumasScreen extends StatelessWidget {
  final List<Wisata> wisataList = [
    Wisata(
      nama: "Baturaden",
      deskripsi: "Baturaden adalah destinasi wisata populer di Banyumas, menawarkan keindahan alam pegunungan dan air terjun yang memukau.",
      imageUrl: "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p2/133/2023/09/21/Lokawisata-Baturaden-305262080.jpg",
    ),
    Wisata(
      nama: "Telaga Sunyi",
      deskripsi: "Telaga Sunyi menawarkan ketenangan dengan pemandangan air yang jernih dan suasana yang asri.",
      imageUrl: "https://img.inews.co.id/media/1200/files/inews_new/2023/01/16/Telaga_sunyi_purwokerto.jpg",
    ),
    Wisata(
      nama: "Curug Cipendok",
      deskripsi: "Curug Cipendok merupakan air terjun yang menawarkan pemandangan menakjubkan dan udara segar dari pegunungan.",
      imageUrl: "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p3/94/2024/05/30/1716976122391-4171606808.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Banyumas"),
        backgroundColor: Colors.green[600],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[100]!, Colors.green[400]!],
          ),
        ),
        child: ListView.builder(
          itemCount: wisataList.length,
          itemBuilder: (context, index) {
            final wisata = wisataList[index];
            return Padding(
              padding: const EdgeInsets.all(4.0), // Mengurangi padding di sekitar Card
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      child: Image.network(
                        wisata.imageUrl,
                        height: 100, // Mengurangi tinggi gambar
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0), // Mengurangi padding di dalam Card
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            wisata.nama,
                            style: TextStyle(
                              fontSize: 16, // Mengurangi ukuran font
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                              shadows: [
                                Shadow(
                                  blurRadius: 4.0,
                                  color: Colors.black38,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2), // Mengurangi jarak antara elemen
                          Text(
                            wisata.deskripsi,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 10, // Mengurangi ukuran font
                              height: 1.2,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4), // Mengurangi jarak antara elemen
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[700],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Padding tombol
                              ),
                              onPressed: () {
                                // Tindakan saat tombol ditekan
                              },
                              child: Text(
                                'Kunjungi',
                                style: TextStyle(
                                  fontSize: 10, // Ukuran font tombol lebih kecil
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Wisata {
  final String nama;
  final String deskripsi;
  final String imageUrl;

  Wisata({
    required this.nama,
    required this.deskripsi,
    required this.imageUrl,
  });
}
