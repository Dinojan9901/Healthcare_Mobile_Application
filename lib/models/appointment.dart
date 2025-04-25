class Appointment {
  String appointmentId;
  DateTime appointmentDate;
  String doctorId;
  String patientId;
  String status;

  Appointment({
    required this.appointmentId,
    required this.appointmentDate,
    required this.doctorId,
    required this.patientId,
    required this.status,
  });

  void scheduleAppointment() {}

  void reScheduleAppointment() {}

  void cancelAppointment() {}
}
