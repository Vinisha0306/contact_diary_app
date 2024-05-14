import 'package:login_page/headers.dart';

Widget background() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          "lib/assets/images/bg.jpg",
        ),
        fit: BoxFit.cover,
      ),
      // color: Colors.amber,
    ),
  );
}
