import 'package:flutter/material.dart';

class EvenBox extends StatelessWidget {
  const EvenBox({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 228, 236, 243),
          height: 140,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 0,
          left: 110,
          child: Container(
            color: Colors.white,
            height: 140,
            width: 170,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 130,
          child: Transform.translate(
            offset: const Offset(0, 2),
            child: Transform.rotate(
              angle: 1 / 12,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 47.1103,
                width: 143,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 110,
          child: Transform.translate(
            offset: const Offset(-20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 47.1103,
              width: 143.647,
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 110,
          child: Transform.translate(
            offset: const Offset(-25, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 47.1103,
              width: 143,
            ),
          ),
        ),
        Positioned(
          top: 92,
          left: 110,
          child: Transform.translate(
            offset: const Offset(-25, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 47.1103,
              width: 143,
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 110,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
