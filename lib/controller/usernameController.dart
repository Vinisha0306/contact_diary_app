import 'package:login_page/headers.dart';

class UserNameController extends ChangeNotifier {
  late SharedPreferences preferences;
  late UserNameModal userNameModal;
  bool isLogin = false;

  UserNameController({required this.preferences}) {
    init();
  }

  void init() {
    userNameModal = UserNameModal(
        name: preferences.getString("userName") ?? 'Demo Name',
        password: preferences.getString("userContact") ?? 'Demo Contact');
    isLogin = preferences.getBool("isLogin") ?? false;
  }

  void userNameF() {
    userNameModal.userName = PersonalGlobal.username ?? "Demo Name";
    preferences.setString("userName", userNameModal.userName);
    userNameModal.userContact = PersonalGlobal.userContact ?? "Demo Contact";
    preferences.setString("userContact", userNameModal.userContact);
    isLogin = !isLogin;
    preferences.setBool("isLogin", isLogin);
    notifyListeners();
  }
}
