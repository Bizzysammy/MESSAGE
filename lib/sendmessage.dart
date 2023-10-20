import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';


class Sendmessages extends StatefulWidget {
  const Sendmessages({Key? key}) : super(key: key);

  @override
  SendmessagesState createState() => SendmessagesState();
}

class SendmessagesState extends State<Sendmessages> {
  final CollectionReference notificationsRef =
  FirebaseFirestore.instance.collection('messages');
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void addNotification() {
    final random = Random();
    final int randomId = random.nextInt(100000);
    final String message = messageController.text;

    if (message.isNotEmpty) {
      notificationsRef.doc(randomId.toString()).set({'message': message})
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(' message added successfully')),
        );
        messageController.clear();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add message')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send a New Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: messageController,
              decoration: const InputDecoration(labelText: 'Notification Message'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: addNotification,
              child: const Text('Add Notification'),
            ),
          ],
        ),
      ),
    );
  }
}