import 'package:nullplex/constants/packages.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  TextEditingController signUpNameField = TextEditingController();
  TextEditingController signUpMobileField = TextEditingController();
  TextEditingController signUpPassField = TextEditingController();

  TextEditingController mobileField = TextEditingController();
  TextEditingController passField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            stackedContainers(
              width,
              height,
              child: Consumer<AuthController>(
                builder: (context, controller, _) {
                  return controller.currentScreenIndex == 0
                      ? signInAppBarContent(height, controller)
                      : signUpAppBarContent(height, controller);
                },
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Consumer<AuthController>(builder: (context, controller, _) {
              return controller.currentScreenIndex == 0
                  ? signInViewContent(height, _signInFormKey,
                      mobile: mobileField, pass: passField)
                  : signUpViewContent(height, _signUpFormKey,
                      nameField: signUpNameField,
                      passwordField: signUpPassField,
                      mobileField: signUpMobileField);
            }),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom * 0.1))
          ],
        ),
      ),
    );
  }
}
