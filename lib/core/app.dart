import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokards/core/extensions.dart';
import 'package:pokards/routes/app_router.gr.dart';

import '../injection.dart';

class AppWidget extends StatelessWidget {
  ThemeData _getDefaultTheme(ThemeData base) => base.copyWith(
        primaryColor: base.isDark ? Colors.grey[700] : Colors.red[400],
        accentColor: base.isDark ? Colors.grey[500] : Colors.redAccent,
        textTheme: GoogleFonts.latoTextTheme(base.textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            )),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey[500]!.withOpacity(0.3);
              } else {
                return base.isDark ? Colors.grey[700] : Colors.red[400];
              }
            }),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey[300];
              } else {
                return base.isDark ? Colors.grey[500] : Colors.redAccent;
              }
            }),
            overlayColor:
                MaterialStateProperty.all(Colors.redAccent.withOpacity(0.2)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16.0,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: getIt<AppRouter>().delegate(),
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      title: 'Pokards',
      debugShowCheckedModeBanner: false,
      theme: _getDefaultTheme(ThemeData.light()),
      darkTheme: _getDefaultTheme(ThemeData.dark()),
    );
  }
}
