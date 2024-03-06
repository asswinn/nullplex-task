import 'package:nullplex/constants/packages.dart';

Column customTextField({label, controller, keyboardType, is_pass = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$label",
        style: TextStyle(fontFamily: semiBold, fontSize: 16),
      ),
      SizedBox(
        height: 20,
      ),
      TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          // You can add more complex email validation if needed
          return null;
        },
        obscureText: is_pass,
        keyboardType: keyboardType,
      ),
    ],
  );
}
