import 'package:flutter/material.dart';

import 'page.dart';

class LegalStuffPage extends StatelessWidget {
  LegalStuffPage({Key key}): super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return NavigablePage(
      title: 'Legal Stuff',
      children: <Widget>[
        Text('legal-stuff 2')
      ],
    );
  }
}

/// Displays the license for the app and where the source-code can be
/// found.
class AppLicense extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return null;
  }
}

class NoticeList extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return null;
  }
}

class Notice extends StatelessWidget {
  final String title;
  final String text;

  Notice({Key key, this.title, this.text}): super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return null;
  }
}