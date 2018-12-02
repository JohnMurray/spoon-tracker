import 'package:flutter/material.dart';

import 'title.dart';

class FeedbackPage extends StatelessWidget {
  FeedbackPage({Key key}): super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppHeaderMenu(renderBackButton: true),
          AppHeaderTitle(title: 'Feedback'),
          Text('feedback'),
        ],
      ),
    );
  }
}
