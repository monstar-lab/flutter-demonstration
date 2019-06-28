import 'package:flutter/widgets.dart';

fadePageRoute<T>(Widget widget) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondAnimation) {
      return widget;
    },
    transitionsBuilder: (context, animation, secondAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
        child: child,
      );
    },
  );
}
