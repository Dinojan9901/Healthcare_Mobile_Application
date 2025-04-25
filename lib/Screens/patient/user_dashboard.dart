import 'package:flutter/material.dart';
import 'package:healthcare_app/Screens/patient/doctor_search_page.dart';

import 'appointment_booking_page.dart';
import 'appointment_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
        title:
            const Text('Health Care ', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 4, 225, 177),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            color: Colors.amber,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DoctorSearchPage()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Home.jpg'),
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
                  MaterialPageRoute(builder: (context) => DoctorSearchPage()),
                );
              },
              child: const Text('Find a Doctor'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppointmentBookingPage(
                            doctorName: '',
                            specialization: '',
                            doctorEmail: '',
                          )),
                );
              },
              child: const Text('Book An Appointment'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentPage()),
                );
              },
              child: const Text(' My Appointments'),
            )
            //
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
        backgroundColor: Color.fromARGB(255, 4, 225, 177),
      ),
    );
  }
}
