import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/group_provider.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final vm = context.watch<GroupProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Builder(
        builder: (_) {
          if (vm.loading) return const Center(child: CircularProgressIndicator());
          if (vm.error != null) return Center(child: Text('Ошибка: ${vm.error}'));
          if (vm.items.isEmpty) return const Center(child: Text('Пусто'));

          return ListView.builder(
            itemCount: vm.items.length,
            itemBuilder: (_, i) {
              final g = vm.items[i];
              return ListTile(
                title: Text(g.name ?? 'без названия'),
                subtitle: Text((g.edu_group_id ?? 'без id') as String),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: g.edu_group_id == null ? null : () => print('delete'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed('group_add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}