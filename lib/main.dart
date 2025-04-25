import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/Screens/common/forgot_password.dart';
import 'package:healthcare_app/Screens/doctor/doctor_dashoard.dart';
import 'package:healthcare_app/Screens/doctor/patient_history_page.dart';
import 'package:healthcare_app/Screens/doctor/prescription.dart';
import 'package:healthcare_app/Screens/doctor/update_availability_page.dart';
import 'package:healthcare_app/Screens/doctor/view_appointments_page.dart';
import 'package:healthcare_app/Screens/patient/user_dashboard.dart';
import 'package:healthcare_app/Screens/common/home_page.dart';
import 'Screens/common/login.dart'; // Create this file for Login Page
import 'Screens/common/signup_page.dart'; // Create this file for Sign-Up Page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBonRnj_6Ua8_Oo93LiP2QGjfGufWpvPl8',
      appId: '1:150357840655:android:f355e9b86a7b0374a7a47a',
      messagingSenderId: '150357840655',
      projectId: 'healthcare-5be3c',
      storageBucket: 'healthcare-5be3c.firebasestorage.app',
    ),
  );
  runApp(const HealthcareApp());
}

class HealthcareApp extends StatelessWidget {
  const HealthcareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthcare App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginScreen(), // Replace with your LoginPage
        '/signup': (context) =>
            const SignUpPage(), // Replace with your SignUpPage
        '/patientdashboard': (context) => const Dashboard(),
        '/prescription': (context) =>
            PrescriptionsPage(), // Replace with your SignUpPage
        '/patienthistory': (context) =>
            PatientHistoryPage(), // Replace with your SignUpPage
        '/updateavailability': (context) => UpdateAvailabilityPage(),
        '/viewappointment': (context) =>
            ViewAppointmentsPage(), // Replace with your SignUpPage
        '/doctordashboard': (context) => DoctorDashboard(),
        '/forgot': (context) => ForgotPasswordPage(),
      },
    );
  }
}
