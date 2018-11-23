import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../reducer/main.dart';
import '../reducer/navigation.dart' as navv;

class _ViewState {
  void Function(int index) menuTapCallback;
  navv.NavigationState nav;

  _ViewState({this.nav, this.menuTapCallback});
}

_ViewState _viewStateBuilder(Store<AppState> store) => _ViewState(
  // state
  nav: store.state.nav,

  // actions
  menuTapCallback: (int index) {
    switch(index) {
    case 0: store.dispatch(navv.NavActions.SwitchToSymptoms);break;
    case 1: store.dispatch(navv.NavActions.SwitchToInput);break;
    case 2: store.dispatch(navv.NavActions.SwitchToInsights);break;
    case 3: store.dispatch(navv.NavActions.SwitchToLog);break;
    default:
    }
  }
);

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return StoreConnector<AppState, _ViewState>(
      converter: _viewStateBuilder,
      builder: (context, mod) {
        return new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: mod.nav.navIndex,
          iconSize: 26.0,
          onTap: mod.menuTapCallback,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(icon: Icon(Icons.local_hospital), title: Text('')),
            new BottomNavigationBarItem(icon: Icon(Icons.graphic_eq), title: Text('')),
            new BottomNavigationBarItem(icon: Icon(Icons.show_chart), title: Text('')),
            new BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('')),
          ],
        );
      },
    );
  }
}
