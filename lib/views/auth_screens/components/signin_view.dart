import 'package:nullplex/constants/packages.dart';
import 'package:nullplex/views/home/home.dart';

signInViewContent(height, key, {mobile, pass}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Form(
      key: key,
      child: Column(
        children: [
          Text(
            "Welcome!",
            style: titleFontStyle.copyWith(color: textColor),
          ),
          Text(
            "Lets Sign in to begin..",
            style: titleFontStyle.copyWith(
                color: textColor, fontFamily: regular, fontSize: 18),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          customTextField(
              controller: mobile,
              label: "Mobile No",
              keyboardType: TextInputType.phone),
          SizedBox(
            height: height * 0.02,
          ),
          customTextField(
            controller: pass,
            label: "password",
            is_pass: true,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Consumer<AuthController>(builder: (context, controller, _) {
              return FilledButton(
                onPressed: () async {
                  if (key.currentState!.validate()) {
                    controller.loading = true;
                    await controller
                        .userSignIn(
                      context,
                      mobile: mobile.text,
                      pass: pass.text,
                    )
                        .then((value) {
                      if (value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      }
                    });
                    controller.loading = false;
                  }
                },
                child: controller.isLoading
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          color: whiteColor,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        "Continue to Sign In",
                        style: titleFontStyle.copyWith(
                            fontFamily: bold, fontSize: 16),
                      ),
              );
            }),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            "Forgot Password?",
            style: titleFontStyle.copyWith(
                color: textColor, fontFamily: semiBold, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
