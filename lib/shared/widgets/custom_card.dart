import 'package:flutter/material.dart';

import '../../app/constants/properties.dart';
import '../utilities.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [defBoxShadow(context)],
        borderRadius: defBorderRadius(),
        color: getColors(context).surface,
      ),
      child: child,
    );
  }
}
