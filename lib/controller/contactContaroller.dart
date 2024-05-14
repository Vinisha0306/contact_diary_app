import 'package:login_page/headers.dart';

class ContactController extends ChangeNotifier {
  late SharedPreferences preferences;
  late Contact contact;

  List<String> allName = [];
  List<String> allNumber = [];
  List<String> allEmail = [];

  int allDataIndex = 0;
  int allHideDataIndex = 0;

  List<String> allHideName = [];
  List<String> allHideNumber = [];
  List<String> allHideEmail = [];

  ContactController({required this.preferences}) {
    init();
  }

  void init() {
    allName = preferences.getStringList("allName") ?? [];
    allNumber = preferences.getStringList("allNumber") ?? [];
    allEmail = preferences.getStringList("allEmail") ?? [];

    allHideName = preferences.getStringList("allHideName") ?? [];
    allHideNumber = preferences.getStringList("allHideNumber") ?? [];
    allHideEmail = preferences.getStringList("allHideEmail") ?? [];

    allDataIndex = preferences.getInt("allDataIndex") ?? 0;
    allHideDataIndex = preferences.getInt("allHideDataIndex") ?? 0;

    notifyListeners();
  }

  void addContact({required Contact contact}) {
    if (ContactGlobal.form[0].currentState!.validate() &&
        ContactGlobal.form[1].currentState!.validate()) {
      allName.add(contact.name as String);
      allNumber.add(contact.contact as String);
      allEmail.add(contact.email as String);
      allDataIndex = allName.length;

      preferences.setStringList("allName", allName);
      preferences.setStringList("allNumber", allNumber);
      preferences.setStringList("allEmail", allEmail);

      preferences.setInt("allDataIndex", allDataIndex);
    }
    notifyListeners();
  }

  void removeContact({required index}) {
    allName.removeAt(index);
    allNumber.removeAt(index);
    allEmail.removeAt(index);
    allDataIndex = allName.length;

    preferences.setStringList("allName", allName);
    preferences.setStringList("allNumber", allNumber);
    preferences.setStringList("allEmail", allEmail);
    preferences.setInt("allDataIndex", allDataIndex);

    notifyListeners();
  }

  void updateContact({required int index, required Contact contact}) {
    allName[index] = contact.name ?? "Name";
    allNumber[index] = contact.contact ?? "Contact";
    allEmail[index] = contact.email ?? "demo@gmail.com";
    allDataIndex = allName.length;

    preferences.setStringList("allName", allName);
    preferences.setStringList("allNumber", allNumber);
    preferences.setStringList("allEmail", allEmail);
    preferences.setInt("allDataIndex", allDataIndex);

    notifyListeners();
  }

  void hideAddContact(
      {required name, required number, required email, required index}) {
    allName.removeAt(index);
    allNumber.removeAt(index);
    allEmail.removeAt(index);
    allHideName.add(name);
    allHideNumber.add(number);
    allHideEmail.add(email);
    allHideDataIndex = allHideName.length;
    allDataIndex = allName.length;

    preferences.setStringList("allName", allName);
    preferences.setStringList("allNumber", allNumber);
    preferences.setStringList("allEmail", allEmail);
    preferences.setInt("allDataIndex", allDataIndex);

    preferences.setStringList("allHideName", allHideName);
    preferences.setStringList("allHideNumber", allHideNumber);
    preferences.setStringList("allHideEmail", allHideEmail);
    preferences.setInt("allHideDataIndex", allHideDataIndex);

    notifyListeners();
  }

  void hideListContact({required index}) {
    allHideName.removeAt(index);
    allHideNumber.removeAt(index);
    allHideEmail.removeAt(index);
    allHideDataIndex = allHideName.length;

    preferences.setStringList("allHideName", allHideName);
    preferences.setStringList("allHideNumber", allHideNumber);
    preferences.setStringList("allHideEmail", allHideEmail);
    preferences.setInt("allHideDataIndex", allHideDataIndex);

    notifyListeners();
  }

  void hideRemoveContact({required index}) {
    allName.add(allHideName[index]);
    allNumber.add(allHideNumber[index]);
    allEmail.add(allHideEmail[index]);

    allHideName.removeAt(index);
    allHideNumber.removeAt(index);
    allHideEmail.removeAt(index);

    allHideDataIndex = allHideName.length;
    allDataIndex = allName.length;

    preferences.setStringList("allName", allName);
    preferences.setStringList("allNumber", allNumber);
    preferences.setStringList("allEmail", allEmail);
    preferences.setInt("allDataIndex", allDataIndex);

    preferences.setStringList("allHideName", allHideName);
    preferences.setStringList("allHideNumber", allHideNumber);
    preferences.setStringList("allHideEmail", allHideEmail);
    preferences.setInt("allHideDataIndex", allHideDataIndex);

    notifyListeners();
  }

  void hideUpdateContact({required int index, required Contact contact}) {
    allHideName[index] = contact.name ?? "Name";
    allHideNumber[index] = contact.contact ?? "Contact";
    allHideEmail[index] = contact.email ?? "demo@gmail.com";
    allHideDataIndex = allHideName.length;

    preferences.setStringList("allHideName", allHideName);
    preferences.setStringList("allHideNumber", allHideNumber);
    preferences.setStringList("allHideEmail", allHideEmail);
    preferences.setInt("allHideDataIndex", allHideDataIndex);

    notifyListeners();
  }
}
