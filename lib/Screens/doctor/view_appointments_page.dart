import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewAppointmentsPage extends StatefulWidget {
  @override
  _ViewAppointmentsPageState createState() => _ViewAppointmentsPageState();
}

class _ViewAppointmentsPageState extends State<ViewAppointmentsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  // Get the current logged-in user
  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        loggedInUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loggedInUser == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Appointments'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
        backgroundColor: const Color.fromARGB(255, 4, 225, 177),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('appointments')
            .where('doctorEmail',
                isEqualTo: loggedInUser!.email) // Filter by doctor's email
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No appointments found.'));
          }

          final appointments = snapshot.data!.docs;

          return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              final patientName = appointment['patientName'];
              final specialization = appointment['specialization'];
              final date = appointment['date'];
              String appointmentDate = 'N/A';

              if (date is Timestamp) {
                appointmentDate = date.toDate().toLocal().toString();
              }

              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  title: Text('$patientName - $appointmentDate'),
                  subtitle: Text('Specialization: $specialization'),
                  trailing: IconButton(
                    icon: const Icon(Icons.check_circle_outline),
                    onPressed: () {
                      _markAppointmentAsCompleted(appointment.id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Mark the appointment as completed
  Future<void> _markAppointmentAsCompleted(String appointmentId) async {
    try {
      await _firestore.collection('appointments').doc(appointmentId).update({
        'status': 'Completed',
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Appointment marked as completed'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error updating appointment: $e'),
      ));
    }
  }
}
