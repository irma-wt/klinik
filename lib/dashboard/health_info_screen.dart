import 'package:flutter/material.dart';

class HealthInfoScreen extends StatelessWidget {
  const HealthInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Informasi Kesehatan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?w=800&h=400&fit=crop',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.health_and_safety,
                          size: 80,
                          color: Colors.teal,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Title
              const Text(
                'Perlindungan Dini untuk Kesehatan Keluarga',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 16),

              // Content
              Text(
                'Menjaga kesehatan keluarga adalah prioritas utama. Dengan deteksi dini dan pencegahan yang tepat, Anda dapat melindungi orang-orang tercinta dari berbagai penyakit.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),

              // Tips Section
              const Text(
                'Tips Kesehatan Keluarga',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              _HealthTipCard(
                icon: Icons.restaurant_menu,
                title: 'Pola Makan Sehat',
                description:
                    'Konsumsi makanan bergizi seimbang dengan banyak sayur dan buah.',
              ),
              const SizedBox(height: 12),

              _HealthTipCard(
                icon: Icons.fitness_center,
                title: 'Olahraga Teratur',
                description:
                    'Lakukan aktivitas fisik minimal 30 menit setiap hari.',
              ),
              const SizedBox(height: 12),

              _HealthTipCard(
                icon: Icons.bedtime,
                title: 'Istirahat Cukup',
                description:
                    'Tidur 7-8 jam sehari untuk menjaga daya tahan tubuh.',
              ),
              const SizedBox(height: 12),

              _HealthTipCard(
                icon: Icons.medical_services,
                title: 'Pemeriksaan Rutin',
                description:
                    'Lakukan check-up kesehatan secara berkala untuk deteksi dini.',
              ),
              const SizedBox(height: 24),

              // CTA Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Konsultasi dengan Dokter',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _HealthTipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _HealthTipCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
