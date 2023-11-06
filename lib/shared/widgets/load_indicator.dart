import 'package:flutter/material.dart';
import 'package:prova_flutter/shared/utilities.dart';

class LoadIndicator extends StatelessWidget {
  const LoadIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight(context),
      width: maxWidth(context),
      color: getColors(context).shadow,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
