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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130.0, // Mengurangi tinggi header
            floating: true,
            pinned: true,
            backgroundColor: Colors.green[700],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Wisata Banyumas",
                style: TextStyle(
                  fontSize: 18, // Mengatur ukuran font agar lebih kecil
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 6.0,
                      color: Colors.black54,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/6/66/Banyumas_Regency.jpg",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3), // Gradient overlay pada gambar
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 3 / 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final wisata = wisataList[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
                            wisata.imageUrl,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                wisata.nama,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                wisata.deskripsi,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[700],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  ),
                                  onPressed: () {
                                    // Tindakan saat tombol ditekan
                                  },
                                  child: Text(
                                    'Kunjungi',
                                    style: TextStyle(
                                      fontSize: 12,
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
                  );
                },
                childCount: wisataList.length,
              ),
            ),
          ),
        ],
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

