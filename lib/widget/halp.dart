import 'package:flutter/material.dart';

import 'page.dart';

class HalpPage extends StatelessWidget {

  HalpPage({Key key}): super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return NavigablePage(
      title: 'HALP!',
      children: <Widget>[
        Text('halp information')
      ],
    );
  }
}