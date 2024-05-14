import 'package:login_page/headers.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController listenable = Provider.of<ContactController>(context);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'delete',
                child: Text(
                  'Delete',
                ),
              ),
              const PopupMenuItem(
                value: "hide",
                child: Text(
                  'Hide Contact',
                ),
              ),
            ],
            onSelected: (String newValue) {
              if (newValue == "delete") {
                Navigator.pop(context);
                Provider.of<ContactController>(context, listen: false)
                    .removeContact(index: index);
              }
              if (newValue == "hide") {
                Navigator.pop(context);
                Provider.of<ContactController>(context, listen: false)
                    .hideAddContact(
                  index: index,
                  name: listenable.allName[index],
                  number: listenable.allNumber[index],
                  email: listenable.allEmail[index],
                );
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              // container
              container(index: index, context: context),
              //image
              Align(
                alignment: const Alignment(0, -1),
                child: leadingImage(
                  index: index,
                  context: context,
                  radius: 50,
                  size: 30,
                ),
              ),
              // sub row
              subContainer(index: index, context: context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 100,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(Routes.QRcode, arguments: index);
                  },
                  icon: const Icon(
                    Icons.qr_code_scanner,
                  ),
                ),
                const Text("QR code")
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(Routes.editContact, arguments: index);
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
                const Text("Edit")
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Share.share(
                      "Name : ${listenable.allName[index]} \nContact Number : ${listenable.allNumber[index]}",
                    );
                  },
                  icon: const Icon(
                    Icons.share,
                  ),
                ),
                const Text("Share")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
