import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Viewmessages extends StatefulWidget {
  const Viewmessages({Key? key}) : super(key: key);

  @override
  ViewmessagesState createState() => ViewmessagesState();
}

class ViewmessagesState extends State<Viewmessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF213C54),
        title: const Text('MESSAGE BOX'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final notifications = snapshot.data?.docs ?? [];

          if (notifications.isEmpty) {
            return const Center(child: Text('No messages found.'));
          }

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index].data() as Map<String, dynamic>?;

              final message = notification?['message'] as String? ?? '';
              final currentDateTime = DateTime.now();

              return ListTile(
                title: Text(message),
                subtitle: Text(
                  'Time: $currentDateTime', // Display the current date and time
                ),
              );
            },
          );
        },
      ),
    );
  }
}