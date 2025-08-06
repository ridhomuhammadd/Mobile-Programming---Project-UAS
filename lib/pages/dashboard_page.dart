// dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'gallery_page.dart';
import 'about_page.dart';
import 'login_page.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, Object>> items = [
    {
      'image': 'assets/images/bulan.jpg',
      'label': 'Bulan',
      'description':
          'Satelit alami Bumi yang menampilkan fase-fase indah sepanjang bulan. Bulan memiliki pengaruh besar terhadap pasang surut air laut di Bumi.',
      'details': [
        'Jarak dari Bumi: 384,400 km',
        'Diameter: 3,474 km',
        'Gravitasi: 1/6 dari gravitasi Bumi',
        'Periode orbit: 27.3 hari',
        'Suhu: -173°C hingga 127°C',
        'Komposisi: Batuan dan logam',
        'Atmosfer: Sangat tipis',
        'Jumlah kawah: Lebih dari 300,000',
      ],
    },
    {
      'image': 'assets/images/bumi.jpg',
      'label': 'Bumi',
      'description':
          'Planet ketiga dari Matahari dan satu-satunya planet yang diketahui memiliki kehidupan. Rumah bagi miliaran spesies makhluk hidup.',
      'details': [
        'Usia: 4.54 miliar tahun',
        'Diameter: 12,742 km',
        'Massa: 5.97 × 10²⁴ kg',
        'Satelit: 1 (Bulan)',
        'Atmosfer: 78% Nitrogen, 21% Oksigen',
        'Suhu rata-rata: 15°C',
        'Periode rotasi: 24 jam',
        'Periode revolusi: 365.25 hari',
      ],
    },
    {
      'image': 'assets/images/duniasophie.jpg',
      'label': 'Dunia Sophie',
      'description':
          'Novel filosofi karya Jostein Gaarder yang mengajarkan sejarah filsafat melalui cerita yang menarik tentang seorang gadis bernama Sophie.',
      'details': [
        'Penulis: Jostein Gaarder',
        'Tahun terbit: 1991',
        'Genre: Filosofi, Fiksi',
        'Bahasa asli: Norwegia',
        'Halaman: 518 halaman',
        'Penerbit: Aschehoug (Norwegia)',
        'Penghargaan: Deutscher Jugendliteraturpreis',
        'Terjemahan: 60+ bahasa',
      ],
    },
    {
      'image': 'assets/images/harrypotter.jpg',
      'label': 'Harry Potter',
      'description':
          'Seri novel fantasi yang menceritakan petualangan seorang penyihir muda bernama Harry Potter di Sekolah Sihir Hogwarts.',
      'details': [
        'Penulis: J.K. Rowling',
        'Jumlah buku: 7 novel utama',
        'Tahun terbit: 1997-2007',
        'Genre: Fantasi, Petualangan',
        'Penjualan: 500+ juta eksemplar',
        'Film: 8 film utama',
        'Bahasa: Diterjemahkan ke 80+ bahasa',
        'Penghargaan: Banyak penghargaan internasional',
      ],
    },
    {
      'image': 'assets/images/komet.jpg',
      'label': 'Komet',
      'description':
          'Benda langit yang terdiri dari es, debu, dan batuan yang mengelilingi Matahari dengan orbit elips. Menampilkan ekor indah saat mendekati Matahari.',
      'details': [
        'Komposisi: Es, debu, dan batuan',
        'Asal: Sabuk Kuiper dan Awan Oort',
        'Ekor: Terbentuk dari sublimasi es',
        'Periode orbit: Bervariasi (tahun-ribuan tahun)',
        'Komet terkenal: Halley, Hale-Bopp',
        'Ukuran inti: 1-50 km',
        'Suhu inti: -200°C hingga 0°C',
        'Kecepatan: 40-250 km/detik',
      ],
    },
    {
      'image': 'assets/images/kometminor.jpg',
      'label': 'Komet Minor',
      'description':
          'Komet-komet kecil dengan periode orbit yang lebih pendek. Biasanya berasal dari Sabuk Kuiper dan memiliki karakteristik unik.',
      'details': [
        'Ukuran: Lebih kecil dari komet utama',
        'Periode: Umumnya kurang dari 200 tahun',
        'Asal: Sabuk Kuiper',
        'Ekor: Lebih pendek dan redup',
        'Jumlah: Ribuan telah ditemukan',
        'Observasi: Memerlukan teleskop',
        'Orbit: Lebih stabil',
        'Penelitian: Penting untuk studi tata surya',
      ],
    },
    {
      'image': 'assets/images/matahari.jpg',
      'label': 'Matahari',
      'description':
          'Bintang di pusat tata surya kita yang menjadi sumber energi utama bagi kehidupan di Bumi. Terdiri dari gas hidrogen dan helium.',
      'details': [
        'Tipe: Bintang katai kuning (G2V)',
        'Usia: 4.6 miliar tahun',
        'Massa: 1.989 × 10³⁰ kg',
        'Diameter: 1.39 juta km',
        'Suhu permukaan: 5,778 K (5,505°C)',
        'Suhu inti: 15 juta °C',
        'Komposisi: 73% Hidrogen, 25% Helium',
        'Energi: 3.828 × 10²⁶ watt',
      ],
    },
    {
      'image': 'assets/images/mooncastle.jpg',
      'label': 'Moon Castle',
      'description':
          'Kastil misterius yang berdiri megah di bawah sinar bulan. Dipenuhi dengan legenda dan cerita mistis yang memikat para petualang.',
      'details': [
        'Arsitektur: Gothic Revival',
        'Periode: Abad ke-12',
        'Lokasi: Pegunungan Eropa',
        'Tinggi: 200 meter',
        'Kamar: 150+ ruangan',
        'Legenda: Hantu bangsawan kuno',
        'Kondisi: Terawat sebagai museum',
        'Pengunjung: 100,000+ per tahun',
      ],
    },
  ];

  // Updated color scheme
  final Color primaryColor = Color(0xFF437057);
  final Color shadowColor = Color(0xFF97B067);
  final Color textColor = Color(0xFFFAF9F6);
  final Color fadedPrimary = Color(0xFF437057).withOpacity(0.5);
  final Color fadedText = Color(0xFFFAF9F6).withOpacity(0.8);
  final Color inputFillColor = Color(0xFF437057).withOpacity(0.5);
  final Color gridItemColor = Colors.white.withOpacity(0.1);
  final Color hintTextColor = Color(0xFFFAF9F6).withOpacity(0.7);

  DashboardPage({super.key});

  void _showLoadingScreen(BuildContext context, VoidCallback onComplete) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => Container(
            color: primaryColor,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(radius: 40, backgroundColor: fadedPrimary),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: fadedText, fontSize: 20),
                      children: [
                        TextSpan(
                          text: 'Library',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: '  Bocah Prik.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      onComplete();
    });
  }

  void _handleNavigation(BuildContext context, Widget page) {
    _showLoadingScreen(context, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    });
  }

  void _handleLogout(BuildContext context) {
    _showLoadingScreen(context, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  void _showDetailDialog(BuildContext context, Map<String, Object> item) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.3),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header dengan gambar
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(item['image'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            primaryColor.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                color: textColor,
                                size: 30,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Text(
                              item['label'] as String,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: shadowColor.withOpacity(0.5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Content area
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Description
                          Text(
                            'Deskripsi',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            item['description'] as String,
                            style: TextStyle(
                              color: fadedText,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 20),

                          // Detail info
                          Text(
                            'Informasi Detail',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),

                          // Scrollable list
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListView.builder(
                                padding: EdgeInsets.all(12),
                                itemCount:
                                    (item['details'] as List<String>).length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      (item['details'] as List<String>)[index],
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 13,
                                        height: 1.3,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      'assets/images/profilelogin.jpg',
                    ),
                  ),
                  SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 18, color: textColor),
                      children: [
                        TextSpan(
                          text: 'WELCOME,',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: ' S',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: 'oyz.', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: primaryColor),
              title: Text('Dashboard'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.info, color: primaryColor),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                _handleNavigation(context, AboutPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album, color: primaryColor),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _handleNavigation(context, GalleryPage());
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Dashboard', style: TextStyle(color: textColor)),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: textColor),
            onPressed: () => _handleLogout(context),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('assets/images/banner.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            height: 160,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: hintTextColor),
                prefixIcon: Icon(Icons.search, color: textColor),
                filled: true,
                fillColor: inputFillColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Category of Book',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.8,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final imagePath = item['image'].toString();
                final label = item['label'].toString();

                return GestureDetector(
                  onTap: () => _showDetailDialog(context, item),
                  child: Container(
                    decoration: BoxDecoration(
                      color: gridItemColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey.withOpacity(0.3),
                                    child: Icon(
                                      Icons.image_not_supported,
                                      color: textColor,
                                      size: 30,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            label,
                            style: TextStyle(color: textColor, fontSize: 12),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
