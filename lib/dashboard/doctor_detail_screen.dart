import 'package:flutter/material.dart';
import 'package:crud_api/model.dart/doctor_model.dart';
import 'schedule_screen.dart';

// DoctorDetailScreen
class DoctorDetailScreen extends StatefulWidget {
  final Doctor doctor;

  const DoctorDetailScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  int selectedDateIndex = 2; // Default Wed 23
  String selectedTime = '02:00 PM';

  final List<Map<String, dynamic>> dates = [
    {'day': 'Mon', 'date': '21'},
    {'day': 'Tue', 'date': '22'},
    {'day': 'Wed', 'date': '23'},
    {'day': 'Thu', 'date': '24'},
    {'day': 'Fri', 'date': '25'},
    {'day': 'Sat', 'date': '26'},
  ];

  final List<String> timeSlots = [
    '10:00 AM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '07:00 PM',
  ];

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
          'Detail Dokter',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Info Card
              Row(
                children: [
                  // Doctor Avatar
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(widget.doctor.image),
                    onBackgroundImageError: (_, __) {},
                    child: null,
                  ),
                  const SizedBox(width: 16),

                  // Doctor Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.doctor.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.doctor.specialty,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.doctor.rating}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.doctor.distance,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // About Section
              const Text(
                'Tentang',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.doctor.about,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                ),
                child: const Text(
                  'Baca selengkapnya',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Date Selection
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedDateIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDateIndex = index;
                        });
                      },
                      child: Container(
                        width: 60,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.teal : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? Colors.teal : Colors.grey[300]!,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dates[index]['day'],
                              style: TextStyle(
                                fontSize: 14,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              dates[index]['date'],
                              style: TextStyle(
                                fontSize: 18,
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Time Selection
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: timeSlots.map((time) {
                  final isSelected = selectedTime == time;
                  final isUnavailable =
                      time == '01:00 PM' || time == '08:00 PM';

                  return GestureDetector(
                    onTap: isUnavailable
                        ? null
                        : () {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isUnavailable
                            ? Colors.grey[100]
                            : (isSelected ? Colors.teal : Colors.white),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isUnavailable
                              ? Colors.grey[300]!
                              : (isSelected ? Colors.teal : Colors.grey[300]!),
                        ),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          fontSize: 14,
                          color: isUnavailable
                              ? Colors.grey[400]
                              : (isSelected ? Colors.white : Colors.black),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Create appointment
                final appointment = Appointment(
                  doctor: widget.doctor,
                  date:
                      '${dates[selectedDateIndex]['day']}, ${dates[selectedDateIndex]['date']}',
                  time: selectedTime,
                  status: 'Confirmed',
                );

                // Show confirmation dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    title: const Text(
                      'Janji Berhasil Dibuat',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      'Janji temu Anda dengan ${widget.doctor.name} pada ${dates[selectedDateIndex]['day']}, ${dates[selectedDateIndex]['date']} pukul $selectedTime telah berhasil dibuat!',
                      style: const TextStyle(height: 1.5),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          Navigator.pop(context); // Back to previous screen

                          // Navigate to Schedule Screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ScheduleScreen(appointments: [appointment]),
                            ),
                          );
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Buat Janji',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
