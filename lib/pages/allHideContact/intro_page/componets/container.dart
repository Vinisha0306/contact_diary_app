import 'package:login_page/headers.dart';

Widget hidecontainer({required index, required context}) {
  return Align(
    alignment: const Alignment(0, -0.8),
    child: Container(
      height: 200,
      width: double.infinity,
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          //name
          Align(
            alignment: const Alignment(0, -0.2),
            child: Text(
              Provider.of<ContactController>(context).allHideName[index],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //contact
          Align(
            alignment: const Alignment(0, 0.2),
            child: Text(
              "+91 ${Provider.of<ContactController>(context).allHideNumber[index]}",
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // call
                IconButton(
                  onPressed: () async {
                    Uri call = Uri(
                      scheme: 'tel',
                      path:
                          Provider.of<ContactController>(context, listen: false)
                              .allHideNumber[index],
                    );
                    await launchUrl(call);
                  },
                  icon: const Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                ),
                //sms
                IconButton(
                  onPressed: () async {
                    Uri sms = Uri(
                      scheme: 'sms',
                      path:
                          Provider.of<ContactController>(context, listen: false)
                              .allHideNumber[index],
                    );
                    await launchUrl(sms);
                  },
                  icon: const Icon(
                    Icons.sms,
                    color: Colors.red,
                  ),
                ),
                //email
                IconButton(
                  onPressed: () async {
                    Uri email = Uri(
                      scheme: 'mailto',
                      path:
                          Provider.of<ContactController>(context, listen: false)
                              .allHideEmail[index],
                    );
                    await launchUrl(email);
                  },
                  icon: const Icon(
                    Icons.mail,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
