class UserNameModal {
  late String userName;
  late String userContact;

  String get getUserName => userName;
  String get getUserContact => userContact;

  UserNameModal({required String name, required String password}) {
    userName = name;
    userContact = password;
  }
}
