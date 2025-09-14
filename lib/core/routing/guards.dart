import 'package:edu_journal/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef AuthGuardSource = AuthState;

StatefulShellRoute shellRouteWithBottomNav({
  required List<RouteBase> studentsRoutes,
  required List<RouteBase> groupsRoutes,
}) {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      const destinations = [
        NavigationDestination(icon: Icon(Icons.people), label: 'Students'),
        NavigationDestination(icon: Icon(Icons.group), label: 'Groups'),
      ];
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          destinations: destinations,
        ),
      );
    },
    branches: [
      StatefulShellBranch(routes: studentsRoutes),
      StatefulShellBranch(routes: groupsRoutes),
    ],
  );
}
