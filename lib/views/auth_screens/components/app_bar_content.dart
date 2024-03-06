import 'package:nullplex/constants/packages.dart';

Column signUpAppBarContent(double height, AuthController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: height * 0.02,
      ),
      Text(
        "Sign Up",
        style: titleFontStyle,
      ),
      SizedBox(
        height: height * 0.005,
      ),
      Row(
        children: [
          Text(
            "Already have an account? ",
            style: titleFontStyle.copyWith(fontSize: 18),
          ),
          GestureDetector(
            onTap: () {
              controller.updateScreen = 0;
            },
            child: Text(
              "Sign In",
              style:
                  titleFontStyle.copyWith(fontSize: 18, color: yellowTextColor),
            ),
          ),
        ],
      ),
    ],
  );
}

Column signInAppBarContent(double height, AuthController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: height * 0.02,
      ),
      Text(
        "Sign In",
        style: titleFontStyle,
      ),
      SizedBox(
        height: height * 0.005,
      ),
      Row(
        children: [
          Text(
            "Dont have an account? ",
            style: titleFontStyle.copyWith(fontSize: 18),
          ),
          GestureDetector(
            onTap: () {
              controller.updateScreen = 1;
            },
            child: Text(
              "Sign Up",
              style:
                  titleFontStyle.copyWith(fontSize: 18, color: yellowTextColor),
            ),
          ),
        ],
      ),
    ],
  );
}
