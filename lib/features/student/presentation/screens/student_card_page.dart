import 'package:flutter/material.dart';

class StudentCardPage extends StatelessWidget {
  final String studentId;
  const StudentCardPage({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student $studentId'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(child: Text('Details for $studentId')),
    );
  }
}