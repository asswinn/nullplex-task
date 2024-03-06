import 'package:nullplex/constants/packages.dart';

Stack stackedContainers(double width, double height, {child}) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        width: width * 0.8,
        height: height * 0.28,
        decoration: BoxDecoration(color: box3, borderRadius: boxRadius),
      ),
      Container(
        width: width * 0.9,
        height: height * 0.26,
        decoration: BoxDecoration(color: box2, borderRadius: boxRadius),
      ),
      Container(
        padding: EdgeInsets.only(top: height * 0.08, left: width * 0.05),
        width: double.infinity,
        height: height * 0.24,
        decoration: BoxDecoration(color: box1, borderRadius: boxRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              igLogo,
              width: width * 0.5,
            ),
            child ?? const SizedBox()
          ],
        ),
      ),
      Positioned(
        right: -15,
        top: -15,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: box2,
        ),
      )
    ],
  );
}
