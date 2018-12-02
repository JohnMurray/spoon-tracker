import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';

import 'reducer/main.dart';
import 'reducer/navigation.dart' as nav;

import 'widget/feedback.dart';
import 'widget/halp.dart';
import 'widget/legal_stuff.dart';
import 'widget/navigation.dart';
import 'widget/title.dart';

void main() {
  final store = new Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: [new LoggingMiddleware.printer()],
  );
  runApp(new FlutterReduxApp(
    title: 'Spoon Tracker',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  FlutterReduxApp({Key key, this.store, this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.light(),
        title: title,
        routes: {
          '/haalp': (ctx) => HalpPage(),
          '/feedback': (ctx) => FeedbackPage(),
          '/legal_stuff': (ctx) => LegalStuffPage(),
        },
        home: new Scaffold(
          body: Column(
            children: <Widget>[
              new AppHeaderMenu(),
              new AppHeaderTitle(),
              buildBody(),
            ],
          ),
          bottomNavigationBar: new BottomNavigation(),
        ),
      )
    );
  }

  Widget buildBody() {
    var build = (nav.NavigationState state) {
      switch (state.item) {
        case nav.NavItem.Symptoms:
        // TODO: delegate to symptoms widget
          return Text('TODO: symptoms widget');
        case nav.NavItem.Input:
        // TODO: delegate to input widget
          return Text('TODO: input widget');
        case nav.NavItem.Insights:
        // TODO: delegate to insights widget
          return Text('TODO: insights widget');
        case nav.NavItem.Log:
        // TODO: delegate to log widget
          return Text('TODO: log widget');
      }
    };
    return StoreConnector<AppState, nav.NavigationState>(
      converter: (s) => s.state.nav,
      builder: (ctx, model) {
        return build(model);
      },
    );
  }
}
