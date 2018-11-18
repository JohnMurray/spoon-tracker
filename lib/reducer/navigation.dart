class NavigationState {
  NavigationState({this.item, this.navIndex});

  NavigationState.initialState() {
    item = NavItem.Symptoms;
    navIndex = 0;
    pageTitle = 'Symptoms';
  }

  /// The index of the nav-item selected (used by widgets)
  int navIndex;

  /// Human-readable enum of the current page
  NavItem item;

  /// Title of the currently selected page */
  String pageTitle;
}

enum NavItem {
  Symptoms,
  Input,
  Insights,
  Log,
}

enum NavActions {
  SwitchToSymptoms,
  SwitchToInput,
  SwitchToInsights,
  SwitchToLog,
}

NavigationState navigationReducer(NavigationState state, dynamic action) {
  if (action is NavActions) {
    NavActions _action = action as NavActions;
    switch(_action) {
      case NavActions.SwitchToSymptoms:
        state.navIndex = 0;
        state.item = NavItem.Symptoms;
        state.pageTitle = 'Symptoms';
        break;
      case NavActions.SwitchToInput:
        state.navIndex = 1;
        state.item = NavItem.Input;
        state.pageTitle = 'Input';
        break;
      case NavActions.SwitchToInsights:
        state.navIndex = 2;
        state.item = NavItem.Insights;
        state.pageTitle = 'Insights';
        break;
      case NavActions.SwitchToLog:
        state.navIndex = 3;
        state.item = NavItem.Log;
        state.pageTitle = 'Log';
        break;
    }
  }
  return state;
}
