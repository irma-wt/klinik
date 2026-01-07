import 'package:flutter/material.dart';
import 'doctor_detail_screen.dart';
import 'package:crud_api/model.dart/doctor_model.dart';

// TopDoctorScreen
class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({Key? key}) : super(key: key);

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
        rating: 4.7,
        distance: '1.5km away',
        image:
            'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=200&h=200&fit=crop',
      ),
      Doctor(
        name: 'Dr. Stefi Jessi',
        specialty: 'Orthopedic',
        rating: 4.7,
        distance: '2km away',
        image:
            'https://images.unsplash.com/photo-1594824476967-48c8b964273f?w=200&h=200&fit=crop',
      ),
      Doctor(
        name: 'Dr. Gerty Cori',
        specialty: 'Pharmacist',
        rating: 4.7,
        distance: '800m away',
        image:
            'https://images.unsplash.com/photo-1537368910025-700350fe46c7?w=200&h=200&fit=crop',
      ),
      Doctor(
        name: 'Dr. Diandra',
        specialty: 'Orthopedic',
        rating: 4.7,
        distance: '900m away',
        image:
            'https://images.unsplash.com/photo-1651008376811-b90baee60c1f?w=200&h=200&fit=crop',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Dokter Teratas', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return _DoctorListTile(doctor: doctors[index]);
        },
      ),
    );
  }
}

// Widget Doctor List Tile
class _DoctorListTile extends StatelessWidget {
  final Doctor doctor;

  const _DoctorListTile({required this.doctor});

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
        margin: const EdgeInsets.only(bottom: 16),
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
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            backgroundImage: NetworkImage(doctor.image),
            onBackgroundImageError: (_, __) {},
            child: null,
          ),
          title: Text(
            doctor.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                doctor.specialty,
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${doctor.rating}',
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    doctor.distance,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
