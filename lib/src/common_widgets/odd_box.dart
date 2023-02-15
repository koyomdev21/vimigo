import 'package:flutter/material.dart';

class OddBox extends StatelessWidget {
  const OddBox({
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
            height: 140,
            width: 170,
            color: Colors.white,
          ),
        ),
        Positioned(
          left: 110,
          child: Transform.translate(
            offset: const Offset(20, 0),
            child: Container(
              height: 47.1103,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          left: 110,
          child: Transform.translate(
            offset: const Offset(-12, -3),
            child: Container(
              height: 47.1103,
              width: 47.1103,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 110,
          child: Transform.translate(
            offset: const Offset(-20, 0),
            child: Container(
              height: 47.1103,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 110,
          child: Transform.translate(
            offset: const Offset(10, 0),
            child: Container(
              height: 47.1103,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          top: 92,
          left: 110,
          child: Transform.translate(
            offset: const Offset(-15, 0),
            child: Container(
              height: 47.1103,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 112,
          child: Transform.translate(
            offset: const Offset(11, 0),
            child: Container(
              height: 47.1103,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
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
