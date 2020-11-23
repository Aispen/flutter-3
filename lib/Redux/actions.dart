import 'package:praktinis_3/Models/app_state.dart';

class AddUserAction{
  final String payload;

  AddUserAction(this.payload);

  String get username => payload;
}
class RemoveUserAction{
  final String payload;

  RemoveUserAction(this.payload);
}