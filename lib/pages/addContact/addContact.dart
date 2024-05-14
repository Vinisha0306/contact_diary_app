import 'dart:io';
import 'package:login_page/headers.dart';

class AddContact extends StatelessWidget {
  AddContact({super.key});

  Contact contact = Contact(
    name: "Name",
    contact: "+91 0000000000",
    email: "demo@gmail.com",
    image: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            stepper(context: context, contact: contact),
            ElevatedButton(
              onPressed: () async {
                if (ContactGlobal.form[0].currentState!.validate()) {
                  ContactGlobal.form[0].currentState!.save();
                }
                if (ContactGlobal.form[1].currentState!.validate()) {
                  ContactGlobal.form[1].currentState!.save();
                }
                if (ContactGlobal.form[2].currentState!.validate()) {
                  ContactGlobal.form[2].currentState!.save();
                }

                Provider.of<ContactController>(context, listen: false)
                    .addContact(contact: contact);
                if (ContactGlobal.form[0].currentState!.validate() &&
                    ContactGlobal.form[1].currentState!.validate()) {
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
