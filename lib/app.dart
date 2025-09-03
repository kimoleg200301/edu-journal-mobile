import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthState()),
      ],
      child: Builder(
        builder: (context) {
          final router = buildAppRouter(context.read<AuthState>());
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'EduJournal',
            routerConfig: router,
            theme: ThemeData.light(),
            darkTheme: ThemeData.light(),
          );
        },
      ),
    );
  }
}