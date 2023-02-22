import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final Color color;

  const DividerWidget({Key? key, this.color = const Color(0x2620FFFC)}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: 1,
      thickness: 0.8,
    );
  }
}

class VerticalDividerWidget extends StatelessWidget {
  final Color color;

  const VerticalDividerWidget({Key? key, this.color = const Color(0x2620FFFC)}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: color,
      width: 1,
      thickness: 0.8,
    );
  }
}
