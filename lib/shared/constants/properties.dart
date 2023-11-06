import 'package:flutter/material.dart';
import 'package:prova_flutter/shared/utilities.dart';

BorderRadius defBorderRadius() => BorderRadius.circular(5);

BoxShadow defBoxShadow(context) => BoxShadow(
      blurRadius: 3,
      offset: const Offset(0, 3),
      color: getColors(context).shadow,
    );

BoxShadow defBoxShadowMove(context, pressed) => BoxShadow(
      blurRadius: pressed ? 1 : 3,
      offset: Offset(0, pressed ? 1 : 3),
      color: getColors(context).shadow,
    );
