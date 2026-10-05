import 'package:flutter/material.dart';

import '../tokens/mahafez_responsive.dart';
import '../tokens/mahafez_spacing.dart';

class MahafezTextField extends StatelessWidget {
  const MahafezTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.enabled,
    this.autofillHints,
    this.focusNode,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool? enabled;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: validator,
      enabled: enabled,
      autofillHints: autofillHints,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: MahafezResponsive.symmetricPadding(
                  horizontal: MahafezSpacing.md,
                ),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

