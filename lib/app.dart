import 'headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Color(0xffFFFE0B5),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Provider.of<UserNameController>(context).isLogin
          ? Routes.homepage
          : Routes.loginpage,
      routes: Routes.routes,
    );
  }
}
