// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vimigo/src/utils/app_preferences.dart';

class PathPainter2 extends CustomPainter {
  PathPainter2(
    this.ref,
    this.index,
  );
  final WidgetRef ref;
  final int index;

  @override
  void paint(Canvas canvas, Size size) {
    final currentLevel = ref.watch(appPreferencesProvider).getLevel() ?? 0;
    Paint paint = Paint()
      ..color = currentLevel < index + 1 ? Colors.white : Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path0 = Path();
    path0.lineTo(5, 0);
    path0.quadraticBezierTo(150, -10, 140, 65);

    canvas.drawPath(path0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PathPainter3 extends CustomPainter {
  PathPainter3(
    this.ref,
    this.index,
  );
  final WidgetRef ref;
  final int index;
  @override
  void paint(Canvas canvas, Size size) {
    final currentLevel = ref.watch(appPreferencesProvider).getLevel() ?? 0;
    Paint paint = Paint()
      ..color = currentLevel < index + 1 ? Colors.white : Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path0 = Path();
    path0.lineTo(5, 0);
    path0.quadraticBezierTo(135, 10, 140, -76);

    canvas.drawPath(path0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
