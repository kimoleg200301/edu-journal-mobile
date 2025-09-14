import 'screens/add_student_page.dart';
import 'screens/student_card_page.dart';
import 'screens/student_page.dart';
import 'package:go_router/go_router.dart';

final routes = <RouteBase>[
  GoRoute(
    path: '/students',
    name: 'students',
    builder: (_, __) => const StudentPage(),
    routes: [
      GoRoute(
        path: 'add',
        name: 'student_add',
        builder: (_, __) => AddStudentPage(),
      ),
      GoRoute(
        path: ':id',
        name: 'student_card',
        builder: (_, state) {
          final id = state.pathParameters['id']!;
          return StudentCardPage(studentId: id);
        },
      ),
    ],
  ),
];