import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: FutureBuilder<String>(
        future: rootBundle.loadString('assets/help.md'),
        builder: (context, snapshot) {
          return snapshot.hasData && snapshot.data != null
              ? Markdown(
                  data: snapshot.data!,
                  padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal:
                          max(MediaQuery.of(context).size.width - 600, 16) / 2),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
