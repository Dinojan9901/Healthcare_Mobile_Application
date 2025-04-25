import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/Screens/patient/appointment_booking_page.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    final String userId = user?.uid ?? ''; // Get the logged-in user's UID

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('appointments')
            .where('userId', isEqualTo: userId) // Filter appointments by userId
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No appointments booked.'));
          }

          final appointments = snapshot.data!.docs;

          return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              final doctorName = appointment['doctorName'];
              final patientName = appointment['patientName'];
              final specialization = appointment['specialization'];

              // Safely get the 'date' field, check if it's a Timestamp before using 'toDate'
              final date = appointment['date'];
              String appointmentDate = 'N/A';

              if (date is Timestamp) {
                appointmentDate = date.toDate().toLocal().toString();
              } else {
                appointmentDate = 'Invalid Date';
              }

              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  title: Text('$doctorName - $appointmentDate'),
                  subtitle: Text(
                      'Patient: $patientName\nSpecialization: $specialization'),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      // Code to cancel appointment
                      _cancelAppointment(appointment.id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to booking appointment form (you can pass necessary data)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointmentBookingPage(
                doctorName: '',
                specialization: '',
                doctorEmail: '',
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Book New Appointment',
      ),
    );
  }

  // Function to cancel an appointment
  Future<void> _cancelAppointment(String appointmentId) async {
    try {
      await _firestore.collection('appointments').doc(appointmentId).delete();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Appointment canceled successfully'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error canceling appointment: $e'),
      ));
    }
  }
}
