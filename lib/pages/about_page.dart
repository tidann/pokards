import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: FutureBuilder<String>(
        future: rootBundle.loadString('assets/about.md'),
        builder: (context, snapshot) {
          return snapshot.hasData && snapshot.data != null
              ? Markdown(
                  data: snapshot.data!,
                  onTapLink: (_, link, __) {
                    if (link != null) launch(link);
                  },
                  imageBuilder: (uri, title, alt) => !uri.path.endsWith('svg')
                      ? Image.network(uri.path)
                      : const SizedBox(),
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
