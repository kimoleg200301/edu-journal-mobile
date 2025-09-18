import 'package:edu_journal/features/student/presentation/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<StudentProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Студенты'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Builder(
        builder: (_) {
          if (vm.loading) return const Center(child: CircularProgressIndicator());
          if (vm.error != null) return Center(child: Text('Ошибка: ${vm.error}'));
          if (vm.items.isEmpty) return const Center(child: Text('Пусто'));

          return RefreshIndicator.adaptive(
            onRefresh: () async {
              await context.read<StudentProvider>().getStudentList();
            },
            child: ListView.separated(
              itemCount: vm.items.length,
              itemBuilder: (_, i) {
                final g = vm.items[i];
                return ListTile(
                  title: Text('${g.firstname} ${g.lastname}'),
                  subtitle: Text('ИИН: ${g.iin}' ?? 'без иин'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: null,
                  ),
                  // onTap: () => context.pushNamed('student_card', pathParameters: {'id': id}),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed('student_add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}