class User {
  String userId;
  String name;
  String email;
  String password;
  String contactNo;
  String dateOfBirth;
  String address;
  String role;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.contactNo,
    required this.address,
    required this.dateOfBirth,
    required this.role,
  });

  void login() {}

  void logout() {}

  void register() {}
}
