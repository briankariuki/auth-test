import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconAsset extends StatelessWidget {
  final String name;
  final double height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  const IconAsset({
    Key? key,
    required this.name,
    required this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        name,
        height: height,
        width: width,
        fit: fit!,
        color: color,
      ),
    );
  }
}
