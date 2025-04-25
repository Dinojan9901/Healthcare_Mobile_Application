import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthcare App'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 229, 24),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome Message
            const Text(
              'Welcome!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 20), // Space between elements
            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/login'); // Navigate to Login Page
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10), // Space between buttons
            // Sign-Up Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/signup'); // Navigate to Login Page
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Signup',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 50,
        color: Color.fromARGB(255, 31, 229, 24),
        child: const Center(
          child: Text(
            ' @ Copyrights reserved',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
    );
  }
}
