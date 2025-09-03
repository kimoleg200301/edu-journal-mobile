import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final demoIds = const ['g1', 'g2', 'g3'];
    return Scaffold(
      appBar: AppBar(title: const Text('Groups')),
      body: ListView(
        children: [
          for (final id in demoIds)
            ListTile (
              title: Text('Group $id'),
              onTap: () => context.pushNamed('group_card', pathParameters: {'id': id}),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed('group_add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}