import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todo_app/Config/routes/app_routes.dart';
import 'package:todo_app/Config/routes/route.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteLocation.home,
    navigatorKey: navigationKey,
    routes: appRoutes,
  );
});