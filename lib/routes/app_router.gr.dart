// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i6;

import '../core/game_objects.dart' as _i7;
import '../pages/about_page.dart' as _i5;
import '../pages/game/game_page.dart' as _i3;
import '../pages/help_page.dart' as _i4;
import '../pages/home/home_page.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.HomePage());
    },
    GamePageRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<GamePageRouteArgs>(orElse: () => GamePageRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i3.GamePage(
              key: args.key,
              properties: args.properties,
              onPlayAgainPressed: args.onPlayAgainPressed));
    },
    HelpPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.HelpPage());
    },
    AboutPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.AboutPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomePageRoute.name, path: '/'),
        _i1.RouteConfig(GamePageRoute.name, path: '/game'),
        _i1.RouteConfig(HelpPageRoute.name, path: '/help'),
        _i1.RouteConfig(AboutPageRoute.name, path: '/about')
      ];
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/');

  static const String name = 'HomePageRoute';
}

class GamePageRoute extends _i1.PageRouteInfo<GamePageRouteArgs> {
  GamePageRoute(
      {_i6.Key? key,
      _i7.GameProperties? properties,
      dynamic Function()? onPlayAgainPressed})
      : super(name,
            path: '/game',
            args: GamePageRouteArgs(
                key: key,
                properties: properties,
                onPlayAgainPressed: onPlayAgainPressed));

  static const String name = 'GamePageRoute';
}

class GamePageRouteArgs {
  const GamePageRouteArgs({this.key, this.properties, this.onPlayAgainPressed});

  final _i6.Key? key;

  final _i7.GameProperties? properties;

  final dynamic Function()? onPlayAgainPressed;
}

class HelpPageRoute extends _i1.PageRouteInfo {
  const HelpPageRoute() : super(name, path: '/help');

  static const String name = 'HelpPageRoute';
}

class AboutPageRoute extends _i1.PageRouteInfo {
  const AboutPageRoute() : super(name, path: '/about');

  static const String name = 'AboutPageRoute';
}
