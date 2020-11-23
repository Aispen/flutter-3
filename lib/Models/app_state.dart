import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AppState {
  String loggedInUser;

  AppState({@required this.loggedInUser});

  AppState.fromAppState(AppState another){
    loggedInUser = another.loggedInUser;
  }
}