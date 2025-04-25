import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppointmentBookingPage extends StatefulWidget {
  final String doctorName;
  final String doctorEmail; // You need to pass doctor's email as well
  final String specialization;

  const AppointmentBookingPage(
      {required this.doctorName,
      required this.doctorEmail,
      required this.specialization});

  @override
  _AppointmentBookingPageState createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController patientEmailController = TextEditingController();

  // Firebase Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to book the appointment and store it in Firestore
  Future<void> _bookAppointment() async {
    final String patientName = patientNameController.text;
    final String patientEmail = patientEmailController.text;

    // Validate the inputs
    if (patientName.isEmpty || patientEmail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    // Validate email format
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(patientEmail)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    // Get current user UID (if logged in)
    final User? user = _auth.currentUser;
    final String userId = user?.uid ?? '';

    // Create the appointment data
    Map<String, dynamic> appointmentData = {
      'doctorName': widget.doctorName,
      'doctorEmail': widget.doctorEmail, // Store the doctor's email
      'specialization': widget.specialization,
      'date': selectedDate.toIso8601String(),
      'patientName': patientName,
      'patientEmail': patientEmail,
      'status': 'Pending', // Initial status of the appointment
      'userId': userId, // Link the appointment to the user
      'createdAt': FieldValue.serverTimestamp(),
    };

    try {
      // Add appointment to Firestore
      await _firestore.collection('appointments').add(appointmentData);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Appointment booked successfully')),
      );

      // Optionally, navigate back to the previous page after booking
      Navigator.pop(context);
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book an Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              widget.doctorName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.specialization,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: patientNameController,
              decoration: const InputDecoration(labelText: 'Patient Name'),
            ),
            TextField(
              controller: patientEmailController,
              decoration: const InputDecoration(labelText: 'Patient Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child:
                  Text('Select Date: ${selectedDate.toLocal()}'.split(' ')[0]),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _bookAppointment, // Call the function to book the appointment
              child: const Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }

  // Date Picker function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
