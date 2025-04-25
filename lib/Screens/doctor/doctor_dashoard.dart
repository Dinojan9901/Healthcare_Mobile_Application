import 'package:flutter/material.dart';
import 'package:healthcare_app/Screens/doctor/prescription.dart';
import 'package:healthcare_app/Screens/doctor/view_appointments_page.dart';
import 'package:healthcare_app/Screens/doctor/update_availability_page.dart';
import 'package:healthcare_app/Screens/doctor/prescription.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorDashboard extends StatefulWidget {
  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        setState(() {
          loggedInUser = user;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 10, 10, 10),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        title: const Text('Doctor Dashboard',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 4, 225, 177),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            color: Colors.amber,
            onPressed: () {
              // Optional: Implement additional options for doctors
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Doctor.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewAppointmentsPage()),
                );
              },
              child: const Text('View Appointments'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateAvailabilityPage()),
                );
              },
              child: const Text('Update Availability'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrescriptionsPage()),
                );
              },
              child: const Text('Manage Prescriptions'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Menu",
            icon: Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 4, 225, 177),
      ),
    );
  }
}
