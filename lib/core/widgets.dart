import 'package:flutter/material.dart';

class CenteredBodyCard extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final Widget child;
  final EdgeInsets padding;

  const CenteredBodyCard({
    Key? key,
    this.maxWidth = 400,
    this.maxHeight = 400,
    required this.child,
    this.padding = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
            maxWidth: maxWidth,
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: double.maxFinite,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  final double fontSize;
  final Color? color;

  const AppLogo({
    Key? key,
    this.fontSize = 30,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        '♠ ❤️ Pokards ♦ ♣',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
