import 'dart:ffi';

class Payment {
  String paymentId;
  String patientId;
  Float amount;
  String status;

  Payment({
    required this.paymentId,
    required this.patientId,
    required this.amount,
    required this.status,
  });

  void makePayment() {}

  void viewPaymentDetails() {}
}
