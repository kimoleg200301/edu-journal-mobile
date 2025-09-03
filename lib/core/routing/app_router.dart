import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../features/group/presentation/routes.dart' as group_routes;
import 'guards.dart';

GoRouter buildAppRouter(AuthGuardSource authGuardSource) {
  return GoRouter(
    initialLocation: '/groups',
    routes: [
      shellRouteWithBottomNav(
        routes: [
          ...group_routes.routes,
        ],
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (_, __) => const LoginPage(),
      ),
    ],
    redirect: (context, state) => authRedirect(context, state, authGuardSource),
  );
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Login'));
  }
}