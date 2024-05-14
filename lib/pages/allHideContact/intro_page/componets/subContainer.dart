import 'package:login_page/headers.dart';

Widget hidesubContainer({required index, required context}) {
  return Align(
    alignment: const Alignment(0, 1),
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
      child: Stack(
        children: [
          //all
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mobile",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                        "+91 ${Provider.of<ContactController>(context).allHideNumber[index]}")
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment(0, -0.95),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // call
                    IconButton(
                      onPressed: () async {
                        Uri call = Uri(
                          scheme: 'tel',
                          path: Provider.of<ContactController>(context,
                                  listen: false)
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
                          path: Provider.of<ContactController>(context,
                                  listen: false)
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
                          path: Provider.of<ContactController>(context,
                                  listen: false)
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
          const Align(
            alignment: Alignment(0, -0.71),
            child: Divider(),
          ),
          //message
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: const Alignment(0, -0.65),
              child: Row(
                children: [
                  Text(
                    "Message +91 ${Provider.of<ContactController>(context).allHideNumber[index]}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage("lib/assets/icons/logo.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0, -0.43),
            child: Divider(),
          ),
          //voice
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: const Alignment(0, -0.33),
              child: Row(
                children: [
                  Text(
                    "Voice call +91 ${Provider.of<ContactController>(context).allHideNumber[index]}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage("lib/assets/icons/logo.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0, -0.15),
            child: Divider(),
          ),
          //video
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: const Alignment(0, -0.01),
              child: Row(
                children: [
                  Text(
                    "Video call +91 ${Provider.of<ContactController>(context).allHideNumber[index]}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage("lib/assets/icons/logo.png"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
