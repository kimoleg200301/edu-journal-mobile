import 'package:edu_journal/features/student/data/datasources/student_remote_ds.dart';
import 'package:edu_journal/features/student/data/repositories_impl/student_repository_impl.dart';
import 'package:edu_journal/features/student/domain/repositories/student_repository.dart';
import 'package:edu_journal/features/student/presentation/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/config/app_config.dart';
import 'core/network/dio_client.dart';
import 'features/group/data/datasources/group_remote_ds.dart';
import 'features/group/data/repositories_impl/group_repository_impl.dart';
import 'features/group/presentation/providers/group_provider.dart';
import 'core/routing/app_router.dart';

class AuthState extends ChangeNotifier {
  bool _isAuthed = false;
  bool get isAuthed => _isAuthed;
  void signIn() {
    _isAuthed = true;
    notifyListeners();
  }
  void signOut() {
    _isAuthed = false;
    notifyListeners();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = buildDio(AppConfig.devLan.baseUrl);
    final groupRepo = GroupRepositoryImpl(GroupRemoteDataSource(dio));
    final studentRepo = StudentRepositoryImpl(StudentRemoteDataSource(dio));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthState()),
        ChangeNotifierProvider(create: (_) => GroupProvider(groupRepo)..getGroupList()),
        ChangeNotifierProvider(create: (_) => StudentProvider(studentRepo)..getStudentList()),
      ],
      child: Builder(
        builder: (context) {
          final router = buildAppRouter(context.read<AuthState>());
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'EduJournal',
            routerConfig: router,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(),
          );
        },
      ),
    );
  }
}