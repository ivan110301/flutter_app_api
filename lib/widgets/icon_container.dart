import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  final double size;
  const IconContainer({
    super.key,
    required this.size,
  }) : assert(size > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size * 0.15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 25,
            offset: Offset(0, 15),
          ),
        ],
      ),
      padding: EdgeInsets.all(
        size * 0.15,
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/icon.svg',
          width: size * 0.6,
          height: size * 0.6,
        ),
      ),
    );
  }
}
