import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAnnotatedRegion extends StatelessWidget {
  const CustomAnnotatedRegion({
    super.key,
    required this.child,
    required this.statusBarColor,
    required this.systemNavigationBarColor,
  });

  final Widget child;
  final Color statusBarColor;
  final Color systemNavigationBarColor;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: child,
    );
  }
}
