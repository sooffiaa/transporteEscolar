class UserModel {
  late String userName;
  late String email;
  late String password;

  UserModel(this.userName, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userName': userName,
      'email': email,
      'password': password,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
  }
}