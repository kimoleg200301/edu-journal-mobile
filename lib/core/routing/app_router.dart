import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../features/group/presentation/routes.dart' as group_routes;
import '../../features/student/presentation/routes.dart' as student_routes;
import 'guards.dart';

GoRouter buildAppRouter(AuthGuardSource authGuardSource) {
  return GoRouter(
    initialLocation: '/students',
    routes: [
      shellRouteWithBottomNav(
        studentsRoutes: student_routes.routes,
        groupsRoutes: group_routes.routes,
      ),
    ],
  );
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Login'));
  }
}
