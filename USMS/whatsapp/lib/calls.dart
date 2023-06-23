import 'package:flutter/material.dart';

import 'database.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() =>_CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // List View Builder
      body: Column(
        children: [
          const ListTile(
            // Show images from picsum.photos
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://picsum.photos/seed/500/200/200'),
            ),
            title: Text('Create call link'),
            subtitle: Text('Share a link for your WhatsApp call'),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Recent'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // Show images from picsum.photos
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/seed/$index/200/200'),
                  ),
                  title: Text(name[index]),
                  subtitle: Text('$index:0$index'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.call),
        onPressed: () {
          setState(() {
            name.add('New Chat');
            chats.add('What\'s up Man');
          });
        },
      ),
    );
    
  }
}


mport 'package:flutter/material.dart';

class Call {
  final String name;
  final String time;
  final bool missed;

  Call({this.name, this.time, this.missed});
}

class CallsSection extends StatelessWidget {
  final List<Call> callsList = [
    Call(name: 'John Doe', time: '10:15 AM', missed: false),
    Call(name: 'Jane Smith', time: '11:30 AM', missed: true),
    Call(name: 'Michael Johnson', time: '12:45 PM', missed: true),
    // Add more calls to the list
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callsList.length,
      itemBuilder: (context, index) {
        Call call = callsList[index];
        return ListTile(
          leading: Icon(
            call.missed ? Icons.phone_missed : Icons.phone,
            color: call.missed ? Colors.red : Colors.green,
          ),
          title: Text(call.name),
          subtitle: Text(call.time),
          onTap: () {
            // Handle call item tap
          },
        );
      },
    );
  }
}

