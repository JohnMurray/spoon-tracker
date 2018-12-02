import 'package:flutter/material.dart';

import 'page.dart';

class FeedbackPage extends StatelessWidget {
  FeedbackPage({Key key}): super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return NavigablePage(
      title: 'Feedback',
      children: <Widget>[
        Text('feedback 2')
      ],
    );
  }
}
