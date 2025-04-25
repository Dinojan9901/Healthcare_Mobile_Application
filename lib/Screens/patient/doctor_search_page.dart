import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/Screens/patient/doctor_details_page.dart';

class DoctorSearchPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Doctor'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('doctors').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No doctors available.'));
          }

          final doctors = snapshot.data!.docs;

          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              final name = doctor['name'];
              final specialization = doctor['specialization'];
              final availability = doctor['availability'] as List<dynamic>;

              return Card(
                child: ListTile(
                  title: Text(name),
                  subtitle: Text(specialization),
                  trailing: Text(
                    availability.isNotEmpty
                        ? 'Available Slots: ${availability.length}'
                        : 'No Availability',
                  ),
                  onTap: () {
                    // Navigate to DoctorDetailsPage with doctor details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorDetailsPage(
                          doctorName: name,
                          specialization: specialization,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
