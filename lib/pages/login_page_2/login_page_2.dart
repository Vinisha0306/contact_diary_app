import 'package:login_page/headers.dart';

class LoginPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: all(context: context, size: size),
    );
  }
}
