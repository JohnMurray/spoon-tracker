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


/// Build the menu button that displays at the very top of the app. This
/// is the button that opens up the bottom drawer menu to get help or
/// provide feedback.
class AppHeaderMenu extends StatelessWidget {
  final bool renderBackButton;

  AppHeaderMenu({Key key, this.renderBackButton = false}): super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        buildBackButton(ctx),
        Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: ctx,
                builder: this.buildBottomModalMenu,
              );
            },
            tooltip: 'Options',
          )
        ),
      ],
    );
  }

  Widget buildBackButton(BuildContext ctx) {
    if (renderBackButton == true) {
      return Padding(
        padding: EdgeInsets.only(),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF444444),),
          onPressed: () => Navigator.of(ctx).pop(),
        ),
      );
    }
    return Padding(padding: EdgeInsets.only());
  }

  /// Build a bottom-navigation menu to render inside of the modal bottom-sheet
  /// that is shown when the user clicks the menu button rendered by the top
  /// menu button.
  /// See: buildMenuButton
  Widget buildBottomModalMenu(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Give Feedback'), 
            onTap: onModalMenuTap(ctx, '/feedback')),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('HALP!'),
            onTap: onModalMenuTap(ctx, '/haalp')),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Legal Stuff'),
            onTap: onModalMenuTap(ctx, '/legal_stuff')),
        ],
      ),
    );
  }

  Function onModalMenuTap(BuildContext ctx, String name) {
    return () {
      Navigator.of(ctx).pop();
      Navigator.of(ctx).pushNamed(name);
      // Navigator.pushNamed(ctx, name);
      // TODO: display appropriate container
    };
  }
}


/// Build the main title element that let's you know what page you're
/// currently on. This is mostly a reflection of the bottom navigation.
///
/// This component automatically updates from the redux state, but can
/// be set statically (manually) via the constructor parameter.
class AppHeaderTitle extends StatelessWidget {
  final String title;

  AppHeaderTitle({Key key, this.title}): super(key: key);

  @override
  Widget build(BuildContext ctx) {
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
                this.title ?? state.pageTitle,
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
