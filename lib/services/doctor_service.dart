import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorService {
  static Future<void> addOrUpdateDoctorDetails({
    required String name,
    required String specialization,
    required List<DateTime> availability,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;

    // Get the logged-in doctor's user ID
    User? user = auth.currentUser;
    if (user == null) {
      throw Exception('No logged-in user');
    }

    // Convert availability list to ISO strings
    List<String> availabilityStrings =
        availability.map((date) => date.toIso8601String()).toList();

    // Add or update the doctor's details in Firestore
    await firestore.collection('doctors').doc(user.uid).set({
      'doctorId': user.uid,
      'name': name,
      'specialization': specialization,
      'availability': availabilityStrings,
    }, SetOptions(merge: true)); // merge: true to update instead of overwrite
  }
}
