import 'package:login_page/headers.dart';

class EditContact extends StatelessWidget {
  EditContact({super.key});

  Contact contact = Contact(
    name: "Name",
    contact: "+91 0000000000",
    email: "demo@gmail.com",
    image: "",
  );

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.3),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Align(
                  alignment: const Alignment(0, 0),
                  child:
                      formOf(contact: contact, context: context, index: index),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.9),
              child: leadingImage(
                index: index,
                context: context,
                radius: 70,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
