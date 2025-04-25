import 'user.dart';

class Doctor extends User {
  String doctorId;
  String specialization;
  String qualifications;
  String clinicAddress;

  List<String> availableSlots;

  Doctor({
    required super.userId,
    required super.name,
    required super.email,
    required super.password,
    required super.contactNo,
    required this.doctorId,
    required this.specialization,
    required this.qualifications,
    required this.availableSlots,
    required this.clinicAddress,
    required super.address,
    required super.dateOfBirth,
    required super.role,
  });

  void addAvailability() {}

  void viewAppointments() {}
}
