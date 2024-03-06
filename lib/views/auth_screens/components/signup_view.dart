import 'package:nullplex/views/home/home.dart';

import '../../../constants/packages.dart';

Container signUpViewContent(double height, key,
    {nameField, mobileField, passwordField}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Form(
      key: key,
      child: Column(
        children: [
          Text(
            "Welcome!",
            style: titleFontStyle.copyWith(color: textColor),
          ),
          Text(
            "Lets Sign Up to begin..",
            style: titleFontStyle.copyWith(
                color: textColor, fontFamily: regular, fontSize: 18),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          customTextField(
            controller: nameField,
            label: "Name",
          ),
          SizedBox(
            height: height * 0.02,
          ),
          customTextField(
              controller: mobileField,
              label: "Mobile No",
              keyboardType: TextInputType.phone),
          SizedBox(
            height: height * 0.02,
          ),
          customTextField(
            controller: passwordField,
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
                    await controller
                        .userSignUp(
                      context,
                      name: nameField.text,
                      pass: passwordField.text,
                      mobile: mobileField.text,
                    )
                        .then((value) {
                      if (value) {
                        print(value);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      } else {}
                    });
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
                        "Continue to Sign Up",
                        style: titleFontStyle.copyWith(
                            fontFamily: bold, fontSize: 16),
                      ),
              );
            }),
          ),
        ],
      ),
    ),
  );
}
