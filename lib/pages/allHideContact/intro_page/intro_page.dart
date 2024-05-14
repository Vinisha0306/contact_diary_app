import 'package:login_page/headers.dart';

class HideIntroPage extends StatelessWidget {
  const HideIntroPage({super.key});

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
                  'UnHide Contact',
                ),
              ),
            ],
            onSelected: (String newValue) {
              if (newValue == "delete") {
                Navigator.pop(context);
                Provider.of<ContactController>(context, listen: false)
                    .hideListContact(index: index);
              }
              if (newValue == "hide") {
                Navigator.pop(context);
                Provider.of<ContactController>(context, listen: false)
                    .hideRemoveContact(
                  index: index,
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
              hidecontainer(index: index, context: context),
              //image
              Align(
                alignment: const Alignment(0, -1),
                child: hideleadingImage(
                  index: index,
                  context: context,
                  radius: 50,
                  size: 30,
                ),
              ),
              // sub row
              hidesubContainer(index: index, context: context),
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
                        .pushNamed(Routes.hideQRCode, arguments: index);
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
                    Share.share(
                      "Name : ${listenable.allHideName[index]} \nContact Number : ${listenable.allHideNumber[index]}",
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
