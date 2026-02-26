import 'package:api/features/users/domain/entities/user_entity.dart';
import 'package:api/features/users/presentation/screens/user_detail_screen.dart';
import 'package:api/features/users/presentation/screens/users_list_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const String usersPath = '/';
  static const String detailPath = '/users/:id';

  static final router = GoRouter(
    initialLocation: usersPath,
    routes: [
      GoRoute(
        path: usersPath,
        builder: (context, state) => const UsersListScreen(),
      ),
      GoRoute(
        path: detailPath,
        builder: (context, state) {
          final user = state.extra as UserEntity;
          return UserDetailScreen(user: user);
        },
      ),
    ],
  );
}
