import 'package:flutter/material.dart';

class PrescriptionsPage extends StatefulWidget {
  @override
  _PrescriptionsPageState createState() => _PrescriptionsPageState();
}

class _PrescriptionsPageState extends State<PrescriptionsPage> {
  // Mock prescription data (Replace with API data later)
  List<Map<String, String>> prescriptions = [
    {
      'patient': 'John Doe',
      'date': '2024-11-20',
      'medications': 'Aspirin, Vitamin C',
    },
    {
      'patient': 'Emma Smith',
      'date': '2024-11-18',
      'medications': 'Paracetamol, Ibuprofen',
    },
  ];

  final TextEditingController _patientController = TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();

  // Function to add a new prescription
  void _addPrescription() {
    if (_patientController.text.isNotEmpty &&
        _medicationsController.text.isNotEmpty) {
      setState(() {
        prescriptions.add({
          'patient': _patientController.text,
          'date': DateTime.now().toString().split(' ')[0],
          'medications': _medicationsController.text,
        });
      });
      _patientController.clear();
      _medicationsController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescriptions'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Prescription',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _patientController,
              decoration: InputDecoration(
                labelText: 'Patient Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _medicationsController,
              decoration: InputDecoration(
                labelText: 'Medications (comma-separated)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addPrescription,
              child: Text('Add Prescription'),
            ),
            SizedBox(height: 20),
            Text(
              'Existing Prescriptions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: prescriptions.length,
                itemBuilder: (context, index) {
                  final prescription = prescriptions[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(prescription['patient']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: ${prescription['date']}'),
                          Text('Medications: ${prescription['medications']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            prescriptions.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
