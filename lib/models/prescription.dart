class Prescription {
  String prescriptionId;
  String doctorId;
  String patientId;
  List<String> medications;
  DateTime dateIssued;

  Prescription({
    required this.prescriptionId,
    required this.doctorId,
    required this.patientId,
    required this.medications,
    required this.dateIssued,
  });

  void addMedication() {
  
  }
  void viewPrescription() {
   
  }
}
