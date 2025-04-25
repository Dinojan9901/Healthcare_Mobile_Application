
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome to Healthcare App'),
//         centerTitle: true,
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Welcome Message
//             Text(
//               'Welcome!',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20), // Space between elements
//             // Login Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/login'); // Navigate to Login Page
//               },
//               child: Text('Login'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//               ),
//             ),
//             SizedBox(height: 10), // Space between buttons
//             // Sign-Up Button
//             OutlinedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/signup'); // Navigate to Sign-Up Page
//               },
//               child: Text('Sign Up'),
//               style: OutlinedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 side: BorderSide(color: Colors.blueGrey),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }