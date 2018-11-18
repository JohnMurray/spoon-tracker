import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../reducer/main.dart';

class _ViewState {
  _ViewState({this.pageTitle});
  String pageTitle;
}

_ViewState _viewStateBuilder(Store<AppState> store) => _ViewState(
  pageTitle: store.state.nav.pageTitle,
);


/// Class to help render the menu and title on the top-portion of the screen.
/// These components build on top of the redux state and this class also
/// takes care of building up the necessary state.
class AppHeader {

  /// Build the menu button that displays at the very top of the app. This
  /// is the button that opens up the bottom drawer menu to get help or
  /// provide feedback.
  Widget buildMenuButton(BuildContext ctx) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => {},
            tooltip: 'Options',
          )
      )],
    );
  }

  /// Build the main title element that let's you know what page you're
  /// currently on. This is mostly a reflection of the bottom navigation.
  Widget buildTitle(BuildContext ctx) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 35.0),
          child: StoreConnector<AppState, _ViewState>(
            converter: _viewStateBuilder,
            builder: (ctx, state) {
              return Text(
                state.pageTitle,
                style: TextStyle(
                  color: Color(0xFF4a4a4a),
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
