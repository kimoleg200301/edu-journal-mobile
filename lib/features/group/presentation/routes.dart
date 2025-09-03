import 'package:go_router/go_router.dart';
import 'screens/group_page.dart';
import 'screens/add_group_page.dart';
import 'screens/group_card_page.dart';

final routes = <RouteBase>[
  GoRoute(
    path: '/groups',
    name: 'groups',
    builder: (_, __) => const GroupPage(),
    routes: [
      GoRoute(
        path: 'add',
        name: 'group_add',
        builder: (_, __) => const AddGroupPage(),
      ),
      GoRoute(
        path: ':id',
        name: 'group_card',
        builder: (_, state) {
          final id = state.pathParameters['id']!;
          return GroupCardPage(groupId: id);
        },
      ),
    ],
  ),
];