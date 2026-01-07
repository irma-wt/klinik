import 'package:flutter/material.dart';
import 'package:crud_api/model.dart/doctor_model.dart';

// Model untuk Appointment
class Appointment {
  final Doctor doctor;
  final String date;
  final String time;
  String status; // Confirmed, Completed, Canceled (mutable)

  Appointment({
    required this.doctor,
    required this.date,
    required this.time,
    required this.status,
  });
}

// ScheduleScreen
class ScheduleScreen extends StatefulWidget {
  final List<Appointment> appointments;

  const ScheduleScreen({
    Key? key,
    this.appointments = const [],
  }) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String selectedTab = 'Upcoming';
  late List<Appointment> displayedAppointments;

  @override
  void initState() {
    super.initState();
    // Create mutable copy of appointments
    displayedAppointments = List.from(widget.appointments);
  }

  List<Appointment> getFilteredAppointments() {
    if (selectedTab == 'Upcoming') {
      return displayedAppointments
          .where((app) => app.status == 'Confirmed')
          .toList();
    } else if (selectedTab == 'Completed') {
      return displayedAppointments
          .where((app) => app.status == 'Completed')
          .toList();
    } else {
      return displayedAppointments
          .where((app) => app.status == 'Canceled')
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredAppointments = getFilteredAppointments();

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
          'Jadwal',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _TabButton(
                  label: 'Akan Datang',
                  isSelected: selectedTab == 'Upcoming',
                  onTap: () {
                    setState(() {
                      selectedTab = 'Upcoming';
                    });
                  },
                ),
                const SizedBox(width: 12),
                _TabButton(
                  label: 'Selesai',
                  isSelected: selectedTab == 'Completed',
                  onTap: () {
                    setState(() {
                      selectedTab = 'Completed';
                    });
                  },
                ),
                const SizedBox(width: 12),
                _TabButton(
                  label: 'Dibatalkan',
                  isSelected: selectedTab == 'Canceled',
                  onTap: () {
                    setState(() {
                      selectedTab = 'Canceled';
                    });
                  },
                ),
              ],
            ),
          ),

          // Appointment List
          Expanded(
            child: filteredAppointments.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 80,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Tidak ada janji ${selectedTab.toLowerCase()}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredAppointments.length,
                    itemBuilder: (context, index) {
                      return _AppointmentCard(
                        appointment: filteredAppointments[index],
                        onCancel: () {
                          setState(() {
                            // Find the appointment in the original list and update status
                            final appointment = filteredAppointments[index];
                            appointment.status = 'Canceled';
                          });
                        },
                        onReschedule: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Fitur penjadwalan ulang segera hadir'),
                              backgroundColor: Colors.teal,
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Schedule selected
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

// Widget Tab Button
class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal : Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

// Widget Appointment Card
class _AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback onCancel;
  final VoidCallback onReschedule;

  const _AppointmentCard({
    required this.appointment,
    required this.onCancel,
    required this.onReschedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor Info
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctor.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      appointment.doctor.specialty,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Date, Time, Status
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text(
                appointment.date,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(width: 16),
              Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text(
                appointment.time,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: appointment.status == 'Confirmed'
                      ? Colors.green[50]
                      : appointment.status == 'Completed'
                          ? Colors.blue[50]
                          : Colors.red[50],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: appointment.status == 'Confirmed'
                          ? Colors.green
                          : appointment.status == 'Completed'
                              ? Colors.blue
                              : Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      appointment.status,
                      style: TextStyle(
                        fontSize: 11,
                        color: appointment.status == 'Confirmed'
                            ? Colors.green
                            : appointment.status == 'Completed'
                                ? Colors.blue
                                : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Action Buttons
          if (appointment.status == 'Confirmed')
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[300]!),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Batalkan',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onReschedule,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Jadwal Ulang',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}