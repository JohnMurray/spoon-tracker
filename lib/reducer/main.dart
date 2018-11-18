import './navigation.dart';

class AppState {
  NavigationState nav;

  AppState({this.nav});

  AppState.initialState() {
    nav = NavigationState.initialState();
  }
}

AppState reducer(AppState state, action) => new AppState(
  nav: navigationReducer(state.nav, action),
);