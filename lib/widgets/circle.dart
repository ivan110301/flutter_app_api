import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final List<Color> colors;
  final double size;

  const Circle({
    super.key,
    required this.size,
    required this.colors,
  })  : assert(size != null && size > 0),
        assert(colors != null && colors.length >= 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
