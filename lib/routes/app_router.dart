import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:pokards/pages/about_page.dart';
import 'package:pokards/pages/game/game_page.dart';
import 'package:pokards/pages/help_page.dart';
import 'package:pokards/pages/home/home_page.dart';
import 'app_router.gr.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: GamePage, path: '/game'),
    MaterialRoute(page: HelpPage, path: '/help'),
    MaterialRoute(page: AboutPage, path: '/about'),
  ],
)
class $AppRouter {}

@module
abstract class RouteInjectableModule {
  @lazySingleton
  AppRouter get router => AppRouter();
}
