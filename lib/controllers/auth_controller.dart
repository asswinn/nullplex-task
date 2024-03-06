import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:http/http.dart' as http;
import 'package:nullplex/requests/auth_apis.dart';
import 'package:nullplex/views/shared_widgets/snackbar.dart';

class AuthController extends ChangeNotifier {
  // 0 for signIn And 1 for SignUp

  var userData;

  int currentScreenIndex = 0;

  bool isLoading = false;

  getDeviceId() async {
    return await FlutterUdid.udid;
  }

  set loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set updateScreen(int value) {
    currentScreenIndex = value;
    notifyListeners();
  }

  Future<bool> userSignIn(context, {mobile, pass}) async {
    loading = true;
    String deviceID = await getDeviceId() ?? "12345";
    if (kDebugMode) {
      print(deviceID);
    }

    http.Response? res = await AuthApis.userSignInRequest(
        mobile: mobile, pass: pass, deviceid: deviceID);

    if (res != null) {
      if (res.statusCode == 200) {
        userData = jsonDecode(res.body);
        loading = false;
        return true;
      } else {
        var responseBody = jsonDecode(res.body);
        String message = responseBody["message"];
        showSnackBar(context, message);
        loading = false;
        return false;
      }
    }
    showSnackBar(context, "Something Went Wrong");
    loading = false;
    return false;
  }

  Future<bool> userSignUp(context, {name, mobile, pass}) async {
    loading = true;
    String deviceID = await getDeviceId() ?? "12345";
    if (kDebugMode) {
      print(deviceID);
    }

    http.Response? res = await AuthApis.userSignUpRequest(
        name: name, mobile: mobile, pass: pass, deviceid: deviceID);

    if (res != null) {
      if (res.statusCode == 200) {
        userData = jsonDecode(res.body);
        loading = false;
        return true;
      } else {
        var responseBody = jsonDecode(res.body);
        String message = responseBody["message"];
        showSnackBar(context, message);
        loading = false;
        return false;
      }
    }
    showSnackBar(context, "Something Went Wrong");
    loading = false;
    return false;
  }
}
