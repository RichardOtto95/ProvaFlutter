import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities.dart';
import 'custom_card.dart';

class DataInput extends StatelessWidget {
  const DataInput({
    super.key,
    this.label,
    this.icon,
    this.validator,
    this.inputFormatters,
    this.controller,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.textAlign = TextAlign.start,
    this.hintText,
    this.focus,
  });

  final String? label;
  final String? hintText;
  final IconData? icon;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(String value)? onFieldSubmitted;
  final bool autofocus;
  final TextAlign textAlign;
  final FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4, left: 7),
            child: Text(
              label!,
              style: getStyles(context).bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        CustomCard(
          width: 350,
          padding: const EdgeInsets.fromLTRB(13, 12, 13, 12),
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: getColors(context).onBackground,
                  size: 23,
                ),
                hSpace(12),
              ],
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: TextFormField(
                    autofocus: autofocus,
                    style: getStyles(context).bodyMedium,
                    decoration: InputDecoration.collapsed(
                      hintText: hintText,
                    ),
                    validator: validator,
                    focusNode: focus,
                    inputFormatters: inputFormatters,
                    controller: controller,
                    onFieldSubmitted: onFieldSubmitted,
                    textAlign: textAlign,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
