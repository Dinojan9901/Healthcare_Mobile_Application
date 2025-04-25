import 'package:flutter/material.dart';
import 'package:healthcare_app/Screens/patient/appointment_booking_page.dart';
//import 'appointment_booking_page.dart';

class DoctorDetailsPage extends StatelessWidget {
  final String doctorName;
  final String specialization;

  const DoctorDetailsPage(
      {required this.doctorName, required this.specialization});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorName),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              specialization,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            // Add additional details
            const Text(
              'Location: XYZ Hospital, Main Street',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Contact: (123) 456-7890',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the AppointmentBookingPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentBookingPage(
                      doctorName: doctorName,
                      specialization: specialization,
                      doctorEmail: '',
                    ),
                  ),
                );
              },
              child: const Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
