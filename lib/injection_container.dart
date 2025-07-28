import 'package:get_it/get_it.dart';
import 'core/navigator/app_route.dart';

final GetIt sl = GetIt.instance;

void init() {
  // external
  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );
}
