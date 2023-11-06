import 'package:flutter/material.dart';
import 'package:prova_flutter/shared/utilities.dart';

SnackBar defaultSnackBar(BuildContext context, String content) => SnackBar(
      backgroundColor: getColors(context).primary,
      content: Text(
        content,
        style: getStyles(context).labelMedium?.copyWith(
              color: getColors(context).onPrimary,
            ),
      ),
    );
