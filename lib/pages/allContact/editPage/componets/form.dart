import 'package:flutter/cupertino.dart';
import 'package:login_page/headers.dart';

Widget formOf({required contact, required context, required index}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    height: 430,
    width: double.infinity,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(
          children: [
            Icon(
              CupertinoIcons.profile_circled,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            )
          ],
        ),
        Form(
          key: ContactGlobal.form[0],
          child: TextFormField(
            onSaved: (val) {
              contact.name = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter your username" : null,
            initialValue:
                Provider.of<ContactController>(context).allName[index],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          children: [
            Icon(
              Icons.call,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Contact',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            )
          ],
        ),
        Form(
          key: ContactGlobal.form[1],
          child: TextFormField(
            onSaved: (val) {
              contact.contact = val;
            },
            keyboardType: TextInputType.number,
            maxLength: 10,
            validator: (val) => (val!.isEmpty)
                ? "Enter your Contact Number"
                : (val.length == 10)
                    ? null
                    : "Enter 10 Number",
            initialValue:
                Provider.of<ContactController>(context).allNumber[index],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          children: [
            Icon(
              Icons.email,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Email',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            )
          ],
        ),
        Form(
          key: ContactGlobal.form[2],
          child: TextFormField(
            onSaved: (val) {
              contact.email = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter Contact Email" : null,
            initialValue:
                Provider.of<ContactController>(context).allEmail[index],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Cancel',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (ContactGlobal.form[0].currentState!.validate()) {
                  ContactGlobal.form[0].currentState!.save();
                }
                if (ContactGlobal.form[1].currentState!.validate()) {
                  ContactGlobal.form[1].currentState!.save();
                }
                if (ContactGlobal.form[2].currentState!.validate()) {
                  ContactGlobal.form[2].currentState!.save();
                }
                contact.image = ContactGlobal.contactImage;
                Provider.of<ContactController>(context, listen: false)
                    .updateContact(index: index, contact: contact);
                if (ContactGlobal.form[0].currentState!.validate() &&
                    ContactGlobal.form[1].currentState!.validate()) {
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Save',
              ),
            ),
          ],
        )
      ],
    ),
  );
}
