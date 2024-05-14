import 'package:login_page/headers.dart';

Widget hideleadingImage(
    {required index,
    required context,
    required double radius,
    required double size}) {
  return CircleAvatar(
    radius: radius,
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.primaries[index % 18],
            Colors.primaries[index % 18].withOpacity(0.5),
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        child: Text(
          Provider.of<ContactController>(context)
              .allHideName[index][0]
              .toUpperCase(),
          style: TextStyle(
            fontSize: size,
          ),
        ),
      ),
    ),
  );
}
