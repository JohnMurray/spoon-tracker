import 'package:flutter/material.dart';

import 'title.dart';

class HalpPage extends StatelessWidget {

  HalpPage({Key key}): super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppHeaderMenu(renderBackButton: true),
          AppHeaderTitle(title: 'HALP!'),
        ],
      ),
    );
  }
}