import 'package:login_page/headers.dart';

Widget form({required context}) {
  List<GlobalKey<FormState>> formKey =
      List.generate(2, (index) => GlobalKey<FormState>());
  return Column(
    children: [
      const SizedBox(
        height: 100,
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Form(
          key: formKey[0],
          child: TextFormField(
            onSaved: (val) {
              PersonalGlobal.username = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter your username" : null,
            decoration: InputDecoration(
              fillColor: Colors.yellow.shade100,
              filled: true,
              focusColor: Colors.black,
              contentPadding: const EdgeInsets.all(16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              label: const Text(
                "User Name",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: const Icon(Icons.person),
            ),
            textInputAction: TextInputAction.next,
            cursorColor: Colors.black,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey[1],
          child: TextFormField(
            onSaved: (val) {
              PersonalGlobal.userContact = val;
            },
            validator: (val) =>
                (val!.isEmpty) ? "Enter your Contact Number" : null,
            decoration: InputDecoration(
              fillColor: Colors.yellow.shade100,
              filled: true,
              focusColor: Colors.black,
              contentPadding: const EdgeInsets.all(16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              label: const Text(
                "Contact",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: const Icon(Icons.call),
            ),
            textInputAction: TextInputAction.done,
            cursorColor: Colors.black,
            obscureText: true,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: const Alignment(0, 0.6),
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 3),
                  blurRadius: 2,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                if (formKey[0].currentState!.validate() &&
                    formKey[1].currentState!.validate()) {
                  formKey[0].currentState!.save();
                  formKey[1].currentState!.save();
                }
                if (formKey[0].currentState!.validate() &&
                    formKey[1].currentState!.validate()) {
                  Provider.of<UserNameController>(context, listen: false)
                      .userNameF();
                  Navigator.pushReplacementNamed(context, Routes.homepage);
                }
              },
              child: const Center(
                child: Text("Log In"),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
