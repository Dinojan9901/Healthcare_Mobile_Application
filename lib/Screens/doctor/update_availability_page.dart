import 'package:flutter/material.dart';
import 'package:healthcare_app/services/doctor_service.dart';

class UpdateAvailabilityPage extends StatefulWidget {
  @override
  _UpdateAvailabilityPageState createState() => _UpdateAvailabilityPageState();
}

class _UpdateAvailabilityPageState extends State<UpdateAvailabilityPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  List<DateTime> selectedDates = [];

  void _addAvailability() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectedDates.add(date);
        });
      }
    });
  }

  Future<void> _saveDetails() async {
    try {
      await DoctorService.addOrUpdateDoctorDetails(
        name: nameController.text,
        specialization: specializationController.text,
        availability: selectedDates,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Details updated successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Availability")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: specializationController,
              decoration: const InputDecoration(labelText: "Specialization"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addAvailability,
              child: const Text("Add Availability"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedDates.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(selectedDates[index].toLocal().toString()),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _saveDetails,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
