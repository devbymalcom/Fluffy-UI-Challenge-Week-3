import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomClipIcon extends StatelessWidget {
  const CustomClipIcon({super.key, required this.logo});

  final String logo;

  @override
  Widget build(BuildContext context) {
    Path customPath = Path()
      ..lineTo(0, 52)
      ..lineTo(52, 52)
      ..lineTo(52, 52 * 0.17)
      ..quadraticBezierTo(52, 52 * 0.17, 52 * 0.87, 0)
      ..lineTo(52 * 0.87, 0)
      ..lineTo(0, 0);

    return DottedBorder(
      padding: const EdgeInsets.all(4),
      customPath: (size) => customPath,
      color: Colors.black.withOpacity(0.25),
      dashPattern: const [8, 4],
      strokeWidth: 1.5,
      child: Center(
        child: Image.asset(
          'assets/images/$logo',
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
