import 'package:flutter/material.dart';

class CircleItemLeft extends StatelessWidget {
  final double top;
  final double left;
  final double radius;
  final String imageUrl;

  const CircleItemLeft({super.key,
    required this.radius,
    required this.imageUrl,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: top,
      left: left,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(imageUrl),
      ),
    );
  }
}
