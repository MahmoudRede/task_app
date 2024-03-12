import 'package:flutter/material.dart';

class CircleItemRight extends StatelessWidget {
  final double top;
  final double right;
  final double radius;
  final String imageUrl;

  const CircleItemRight({super.key,
    required this.radius,
    required this.imageUrl,
    required this.top,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: top,
      right: right,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(imageUrl),
      ),
    );
  }
}
