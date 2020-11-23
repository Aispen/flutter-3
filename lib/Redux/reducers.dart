import 'package:praktinis_3/Models/app_state.dart';
import 'package:praktinis_3/Redux/actions.dart';

AppState reducer(AppState prevState, action){
  AppState newState = AppState.fromAppState(prevState);

  if(action is AddUserAction){
    newState.loggedInUser = action.payload;
  }
  else if(action is RemoveUserAction){
    newState.loggedInUser = '';
  }

  return newState;
}