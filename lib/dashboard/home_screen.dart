import 'package:flutter/material.dart';
import 'top_doctor_screen.dart';
import 'pharmacy_screen.dart';
import 'health_info_screen.dart';
import 'doctor_detail_screen.dart';
import 'package:crud_api/model.dart/doctor_model.dart';
import 'profile_screen.dart';
import 'schedule_screen.dart';

// HomeScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctors = [
      Doctor(
        name: 'Dr. Marcus Horizon',
        specialty: 'Chardiologist',
        rating: 4.7,
        distance: '800m away',
        image:
            'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=200&h=200&fit=crop',
      ),
      Doctor(
        name: 'Dr. Maria Elena',
        specialty: 'Psychologist',
        rating: 4.8,
        distance: '1.5km away',
        image:
            'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=200&h=200&fit=crop',
      ),
      Doctor(
        name: 'Dr. Stefi Jessi',
        specialty: 'Orthopedic',
        rating: 4.9,
        distance: '2km away',
        image:
            'https://images.unsplash.com/photo-1594824476967-48c8b964273f?w=200&h=200&fit=crop',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const Text(
                  'Temukan solusi\nkesehatan Anda',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 20),

                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari dokter...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Category Icons
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TopDoctorScreen(),
                            ),
                          );
                        },
                        child: _CategoryCard(
                          icon: Icons.medical_services_outlined,
                          label: 'Dokter',
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PharmacyScreen(),
                            ),
                          );
                        },
                        child: _CategoryCard(
                          icon: Icons.local_pharmacy_outlined,
                          label: 'Apotek',
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Banner
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Perlindungan dini untuk\nkesehatan keluarga Anda',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HealthInfoScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text('Pelajari lebih lanjut'),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=200&h=200&fit=crop',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.health_and_safety,
                                size: 50,
                                color: Colors.teal,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Top Doctor Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dokter Teratas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopDoctorScreen(),
                          ),
                        );
                      },
                      child: const Text('Lihat semua'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Doctor List
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return _DoctorCard(doctor: doctors[index]);
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScheduleScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

// Widget Category Card
class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// Widget Doctor Card
class _DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const _DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailScreen(doctor: doctor),
          ),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(doctor.image),
              onBackgroundImageError: (_, __) {},
              child: null,
            ),
            const SizedBox(height: 8),
            Text(
              doctor.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                const SizedBox(width: 2),
                Text('${doctor.rating}', style: const TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              doctor.distance,
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
