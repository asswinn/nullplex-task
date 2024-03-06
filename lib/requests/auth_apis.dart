import 'package:http/http.dart' as http;

class AuthApis {
  static Future<http.Response?> userSignInRequest(
      {mobile, pass, deviceid}) async {
    final url = Uri.parse('https://restsf.nullplex.co.in/api/login');

    try {
      final response = await http.post(
        url,
        body: {
          'mobile': mobile,
          'password': pass,
          'deviceid': deviceid,
        },
      );

      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<http.Response?> userSignUpRequest(
      {name, mobile, pass, deviceid}) async {
    final url = Uri.parse('https://restsf.nullplex.co.in/api/register');

    try {
      final response = await http.post(
        url,
        body: {
          "name": name,
          "mobile": mobile,
          "password": pass,
          "password_confirmation": pass,
          "deviceid": deviceid
        },
      );

      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
