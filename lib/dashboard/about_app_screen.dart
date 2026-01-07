import 'package:flutter/material.dart';

// AboutAppScreen
class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

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
          'Tentang Aplikasi',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // App Logo
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.medical_services,
                size: 60,
                color: Colors.teal[400],
              ),
            ),
            const SizedBox(height: 24),

            // App Name
            const Text(
              'Aplikasi Kesehatan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Version
            Text(
              'Versi 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),

            // Description
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tentang',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Aplikasi Kesehatan adalah aplikasi yang memudahkan Anda untuk menemukan dokter terpercaya, membuat janji temu, dan memesan obat secara online. Dengan fitur-fitur lengkap dan antarmuka yang mudah digunakan, kami berkomitmen untuk memberikan pengalaman kesehatan digital terbaik untuk Anda.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Features
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fitur',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _FeatureItem(
                    icon: Icons.person_search,
                    title: 'Cari Dokter',
                    description: 'Cari dokter berdasarkan spesialisasi',
                  ),
                  _FeatureItem(
                    icon: Icons.calendar_today,
                    title: 'Buat Janji',
                    description: 'Buat janji temu dengan mudah',
                  ),
                  _FeatureItem(
                    icon: Icons.local_pharmacy,
                    title: 'Apotek Online',
                    description: 'Pesan obat secara online',
                  ),
                  _FeatureItem(
                    icon: Icons.article,
                    title: 'Artikel Kesehatan',
                    description: 'Baca artikel kesehatan terkini',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Developer Info
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pengembang',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _InfoRow(label: 'Dikembangkan oleh', value: 'Tim Health App'),
                  _InfoRow(label: 'Email', value: 'dev@healthapp.com'),
                  _InfoRow(label: 'Website', value: 'www.healthapp.com'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Legal
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.description_outlined,
                      color: Colors.teal,
                    ),
                    title: const Text(
                      'Syarat Layanan',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.privacy_tip_outlined,
                      color: Colors.teal,
                    ),
                    title: const Text(
                      'Kebijakan Privasi',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.copyright_outlined,
                      color: Colors.teal,
                    ),
                    title: const Text(
                      'Lisensi',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showLicensePage(
                        context: context,
                        applicationName: 'Aplikasi Kesehatan',
                        applicationVersion: '1.0.0',
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Copyright
            Text(
              '© 2024 Aplikasi Kesehatan. Hak cipta dilindungi.',
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.teal[700], size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
