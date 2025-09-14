import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final demoIds = const ['s1', 's2', 's3'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          for (final id in demoIds)
            ListTile(
              title: Text('Student $id'),
              onTap: () => context.pushNamed('student_card', pathParameters: {'id': id}),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed('student_add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}