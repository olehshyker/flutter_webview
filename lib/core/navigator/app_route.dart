import 'package:auto_route/auto_route.dart';
import '../../screens/home/home_screen.dart';
part 'app_route.gr.dart';

class RouterName {
  static const home = '/home';
}

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: RouterName.home,
      page: HomeRoute.page,
      initial: true,
    ),
  ];
}
