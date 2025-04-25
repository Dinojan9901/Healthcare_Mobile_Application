import 'user.dart';

class Patient extends User {
  String patientId;
  String medicalHistory;

  Patient({
    required super.userId,
    required super.name,
    required super.email,
    required super.password,
    required super.contactNo,
    required this.patientId,
    required super.address,
    required super.dateOfBirth,
    required this.medicalHistory,
    required super.role,
  });

  void bookAppointment() {}

  void viewMedicalHistory() {}

  void orderLabTests() {}

  void orderMedicines() {}
}
