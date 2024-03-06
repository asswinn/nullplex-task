import 'dart:async';

import 'package:nullplex/constants/packages.dart';
import 'package:nullplex/views/auth_screens/auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  changeScreen(context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    changeScreen(context);
    return Scaffold(
      backgroundColor: kPrimary,
      body: Center(
        child: Image.asset(
          igLogo,
          width: width * 0.8,
        ),
      ),
    );
  }
}
