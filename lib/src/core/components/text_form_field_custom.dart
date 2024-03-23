import 'package:flutter/material.dart';

import '../../config/base_color.dart';

class TextFormFieldCustom extends StatefulWidget {
  const TextFormFieldCustom({
    super.key,
    this.errorText,
    this.onTap,
    this.maxLine,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.clearError,
    this.controller,
    this.keyboardType,
    this.label,
    this.isRequired = false,
    this.floatingLabelBehavior,
    this.hintText,
  });

  final String? errorText;
  final void Function()? onTap;
  final int? maxLine;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool readOnly;
  final void Function()? clearError;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? label;
  final bool isRequired;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? hintText;

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool isFocusWithOnTap = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isFocusWithOnTap
                  ? LuColors.black
                  : widget.errorText != null
                      ? LuColors.red
                      : LuColors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            onFieldSubmitted: widget.onFieldSubmitted,
            readOnly: widget.readOnly,
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
              focusThis(false);
            },
            onTap: () {
              focusThis(true);
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            cursorColor: LuColors.black.withOpacity(0.7),
            minLines: 1,
            maxLines: widget.maxLine ?? 1,
            scrollPadding: EdgeInsets.zero,
            decoration: InputDecoration(
              hoverColor: LuColors.red,
              contentPadding: const EdgeInsets.all(16).copyWith(top: 0),
              floatingLabelBehavior: widget.floatingLabelBehavior ??
                  (widget.label == null
                      ? FloatingLabelBehavior.never
                      : FloatingLabelBehavior.auto),
              border: InputBorder.none,
              label: RichText(
                text: TextSpan(
                  text: widget.label,
                  style: const TextStyle(
                    color: LuColors.black,
                  ),
                  children: [
                    if (widget.isRequired)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(),
                      ),
                  ],
                ),
              ),
              hintText: widget.hintText,
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                color: LuColors.red,
              ),
            ),
          ),
      ],
    );
  }

  void focusThis(bool isFocus) {
    setState(() {
      isFocusWithOnTap = isFocus;
    });
    if (widget.clearError != null) {
      widget.clearError!();
    }
  }
}
