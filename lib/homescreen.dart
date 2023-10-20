

import 'package:flutter/material.dart';
import 'package:messages/sendmessage.dart';
import 'package:messages/viewmessage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LETS TALK APPLICATION'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Add some spacing
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.orange, // Set the icon color to orange
                    size: 60, // Set the icon size
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Sendmessages()),
                    );
                  },
                ),
                const Text(
                  'Send Message',
                  style: TextStyle(
                    color: Colors.black, // Set the text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add some spacing
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.message,
                    color: Colors.orange, // Set the icon color to orange
                    size: 60, // Set the icon size
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Viewmessages()),
                    );
                  },
                ),
                const Text(
                  'View Messages',
                  style: TextStyle(
                    color: Colors.black, // Set the text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}