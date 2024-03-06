import 'package:nullplex/constants/packages.dart';

var filledButtonThemeData = FilledButtonThemeData(
    style: FilledButton.styleFrom(backgroundColor: kPrimary));
var inputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  fillColor: textFieldColor,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: textFieldBorderColor),
    borderRadius: BorderRadius.circular(50),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: textFieldBorderColor),
    borderRadius: BorderRadius.circular(50),
  ),
);
