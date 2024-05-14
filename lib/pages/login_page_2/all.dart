import 'package:login_page/headers.dart';

Widget all({required context, required size}) {
  return Stack(
    children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffFFE0B5),
        ),
      ),
      Container(
        height: 500,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          image: DecorationImage(
            image: AssetImage(
              "lib/assets/images/bg.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              Text(
                "FIND",
                style: GoogleFonts.caveat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  letterSpacing: 5,
                ),
              ),
              const Text(
                "Create your own itenerary!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: const Alignment(0, 0.7),
          child: Container(
            width: 400,
            height: 412,
            decoration: const BoxDecoration(
              color: Color(0xffFFFE0B5),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: form(context: context),
          ),
        ),
      ),
    ],
  );
}
