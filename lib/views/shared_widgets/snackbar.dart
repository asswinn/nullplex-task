import 'package:nullplex/constants/packages.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Center(
        child: Text(
          message,
          style: titleFontStyle.copyWith(fontSize: 16, fontFamily: semiBold),
        ),
      ),
      duration: Duration(seconds: 2), // Adjust the duration as needed
    ),
  );
}
