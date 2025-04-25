import 'package:flutter/material.dart';

class PatientHistoryPage extends StatelessWidget {
  // Mock patient data (Replace with API data later)
  final List<Map<String, String>> patients = [
    {
      'name': 'John Doe',
      'age': '30',
      'lastVisit': '2024-11-15',
      'diagnosis': 'Hypertension',
    },
    {
      'name': 'Emma Smith',
      'age': '40',
      'lastVisit': '2024-11-10',
      'diagnosis': 'Diabetes',
    },
    {
      'name': 'Liam Johnson',
      'age': '50',
      'lastVisit': '2024-11-05',
      'diagnosis': 'Arthritis',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient History'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(patient['name']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age: ${patient['age']}'),
                  Text('Last Visit: ${patient['lastVisit']}'),
                  Text('Diagnosis: ${patient['diagnosis']}'),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientDetailsPage(patient: patient),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PatientDetailsPage extends StatelessWidget {
  final Map<String, String> patient;

  PatientDetailsPage({required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${patient['name']}'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${patient['name']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Age: ${patient['age']}'),
            SizedBox(height: 10),
            Text('Last Visit: ${patient['lastVisit']}'),
            SizedBox(height: 10),
            Text('Diagnosis: ${patient['diagnosis']}'),
            SizedBox(height: 20),
            Text(
              'Detailed History:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('• Diagnosis: ${patient['diagnosis']}'),
            Text('• Medication: Prescribed drugs here'),
            Text('• Notes: Doctor\'s notes here'),
          ],
        ),
      ),
    );
  }
}
