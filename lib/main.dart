import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'reducer/main.dart';
import 'reducer/navigation.dart' as nav;

import 'widget/navigation.dart';
import 'widget/title.dart';

void main() {
  final store = new Store<AppState>(reducer, initialState: AppState.initialState());
  runApp(new FlutterReduxApp(
    title: 'Spoon Tracker',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  FlutterReduxApp({Key key, this.store, this.title});

  @override
  Widget build(BuildContext context) {
    var header = AppHeader();

    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.light(),
        title: title,
        home: new Scaffold(
          body: Column(
            children: <Widget>[
              header.buildMenuButton(context),
              header.buildTitle(context),
              buildBody(store.state.nav),
            ],
          ),
          bottomNavigationBar: new BottomNavigation(),
        ),
      )
    );
  }

  Widget buildBody(nav.NavigationState state) {
    switch (state.item) {
      case nav.NavItem.Symptoms:
        // TODO: delegate to symptoms widget
        return Text('TODO: symptoms widget');
      case nav.NavItem.Input:
        // TODO: delegate to input widget
        return Text('TODO: symptoms widget');
      case nav.NavItem.Insights:
        // TODO: delegate to insights widget
        return Text('TODO: symptoms widget');
      case nav.NavItem.Log:
        // TODO: delegate to log widget
        return Text('TODO: symptoms widget');
    }
  }
}
