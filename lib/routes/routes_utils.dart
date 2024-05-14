import 'dart:io';
import 'package:login_page/headers.dart';

class Routes {
  static String loginpage = '/';
  static String loginpage2 = 'loginpage2';
  static String homepage = 'homepage';
  static String addContact = 'addcontact';
  static String introPage = 'intropage';
  static String QRcode = 'qrcode';
  static String editContact = 'editcontact';
  static String hideContact = 'hidecontact';
  static String hideIntroPage = 'hideintroPage';
  static String hideQRCode = 'hideqrCode';

  static Map<String, WidgetBuilder> routes = {
    Routes.loginpage: (context) => LoginPage(),
    Routes.loginpage2: (context) => LoginPage2(),
    Routes.homepage: (context) => HomePage(),
    Routes.addContact: (context) => AddContact(),
    Routes.introPage: (context) => IntroPage(),
    Routes.QRcode: (context) => QRCode(),
    Routes.editContact: (context) => EditContact(),
    Routes.hideContact: (context) => HideContact(),
    Routes.hideIntroPage: (context) => HideIntroPage(),
    Routes.hideQRCode: (context) => HideQRCode(),
  };
}

class PersonalGlobal {
  static String? username;
  static String? userContact;
}

class ContactGlobal {
  static File? contactImage;

  static List<GlobalKey<FormState>> form =
      List.generate(4, (index) => GlobalKey());
}
