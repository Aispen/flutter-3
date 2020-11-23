class User{
  final String userId;
  final String password;

  User({this.userId,this.password});

  Map<String, dynamic> toMap(){
    return{
      'userId': userId,
      'password': password
    };
  }
}