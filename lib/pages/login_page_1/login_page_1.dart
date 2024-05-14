import 'package:login_page/headers.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          background(),
          login(size: size, context: context),
        ],
      ),
    );
  }
}
