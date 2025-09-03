import 'package:edu_journal/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

typedef AuthGuardSource = AuthState;

String? authRedirect(BuildContext context, GoRouterState state, AuthGuardSource auth) {
  final loggingIn = state.matchedLocation == '/login';
  final needsAuth = state.matchedLocation.startsWith('/groups');
  if (!auth.isAuthed && needsAuth && loggingIn) {
    return '/login';
  }
  if (auth.isAuthed && loggingIn) return '/groups';
  return null;
}

StatefulShellRoute shellRouteWithBottomNav({required List<RouteBase> routes}) {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.group), label: 'Groups'),
          ]
        ),
      );
    },
    branches: [
      StatefulShellBranch(routes: routes),
    ],
  );
}