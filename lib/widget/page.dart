import 'package:flutter/material.dart';

import 'title.dart';

/// Renders a page with a back-button. It is assumed that the page is
/// pushed onto the stack with Navigator as going back will pop this
/// state to the previous page.
class NavigablePage extends StatelessWidget {
  final String title;
  final List<Widget> children;

  NavigablePage({Key key, this.children, this.title}): super(key: key);

  Widget build(BuildContext ctx) {
    var buildChildren = <Widget>[];
    buildChildren
      ..addAll(<Widget>[
        AppHeaderMenu(renderBackButton: true),
        AppHeaderTitle(title: title),
      ])
      ..addAll(children);
    return Scaffold(
      body: Column(children: buildChildren)
    );
  }
}