import 'package:login_page/headers.dart';

Widget login({required size, required context}) {
  return Padding(
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
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: const Alignment(0, 0.6),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.loginpage2);
                },
                child: Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text("Log In"),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: const Alignment(0, 0.75),
              child: Container(
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Don't have an account? SignUp",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
