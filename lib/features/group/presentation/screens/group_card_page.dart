import 'package:flutter/material.dart';

class GroupCardPage extends StatelessWidget {
  final String groupId;
  const GroupCardPage({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group $groupId'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(child: Text('Details for $groupId')),
    );
  }
}