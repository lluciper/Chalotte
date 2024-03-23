// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:trust_sign/core/components/custom_gesture_detector.dart';
// import 'package:trust_sign/theme/app_text_style.dart';
// import 'package:trust_sign/theme/gen/LuColors.gen.dart';
// import 'package:trust_sign/theme/sizer_custom/sizer.dart';

// import '../../config/sizer_custom/sizer.dart';

// class TextFieldCommon extends StatefulWidget {
//   const TextFieldCommon({
//     Key? key,
//     this.label,
//     this.hintText,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.labelStyle,
//     this.fillColor = SavisColor.neutral200,
//     this.clearTextColor = LuColors.blueGrey,
//     this.obscureText = false,
//     this.controller,
//     this.focusNode,
//     this.onChanged,
//     this.onTap,
//     this.hintStyle,
//     this.cursorColor,
//     this.style,
//     this.borderColor = LuColors.transparent,
//     this.onSubmitted,
//     this.focusColor = SavisColor.primary300,
//     this.maxLines = 1,
//     this.height,
//     this.keyboardType,
//     this.isRequired = false,
//     this.autofocus = false,
//     this.floatingLabelBehavior,
//     this.contentPadding,
//     this.inputFormatters,
//     this.readOnly = false,
//     this.onEditingComplete,
//     this.textInputAction,
//     this.labelNoFocus = '',
//     this.isCollapsed = false,
//     this.hasClearText = false,
//     this.onClearText,
//     this.cursorHeight,
//     this.validator,
//     this.hasErrorBorder = false,
//     this.hasSuffix = true,
//     this.isResetValidateWithOnTap = false,
//   }) : super(key: key);

//   final String? label;
//   final String labelNoFocus;
//   final String? hintText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final Color? fillColor;
//   final Color? cursorColor;
//   final double? cursorHeight;
//   final Color borderColor;
//   final Color focusColor;
//   final Color clearTextColor;
//   final TextStyle? labelStyle;
//   final TextStyle? hintStyle;
//   final TextStyle? style;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final void Function(String)? onChanged;
//   final void Function(String)? onSubmitted;
//   final void Function()? onEditingComplete;
//   final void Function()? onTap;
//   final void Function()? onClearText;
//   final int maxLines;
//   final double? height;
//   final TextInputType? keyboardType;
//   final bool isRequired;
//   final bool readOnly;
//   final bool obscureText;
//   final bool autofocus;
//   final bool isCollapsed;
//   final bool hasClearText;
//   final FloatingLabelBehavior? floatingLabelBehavior;
//   final TextInputAction? textInputAction;
//   final EdgeInsetsGeometry? contentPadding;
//   final List<TextInputFormatter>? inputFormatters;
//   final FormFieldValidator<String>? validator;
//   final bool? hasErrorBorder;
//   final bool hasSuffix;
//   final bool isResetValidateWithOnTap;

//   @override
//   State<TextFieldCommon> createState() => _TextFieldCommonState();
// }

// class _TextFieldCommonState extends State<TextFieldCommon> {
//   String? _msgError;
//   FocusNode? _focusNode;
//   TextEditingController? _textCTL;
//   RxBool isActiveRequired = false.obs;
//   bool isShowClose = false;
//   bool hasListenController = false;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//     _textCTL = TextEditingController();
//     initListenController();
//     (widget.focusNode ?? _focusNode)?.addListener(_handleFocusChanged);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: widget.maxLines > 1 ? null : widget.height,
//               constraints: BoxConstraints(
//                 minHeight: widget.height ?? 56.px,
//               ),
//               decoration: BoxDecoration(
//                 color: widget.fillColor,
//                 borderRadius: BorderRadius.circular(8),
//                 border: _renderBorder(isActiveRequired.value),
//               ),
//               child: TextFormField(
//                 onTapOutside: (_) {
//                   FocusManager.instance.primaryFocus?.unfocus();
//                   resetValidate();
//                 },
//                 validator: (value) {
//                   return !GetUtils.isEmail(value!)
//                       ? 'Email is not valid'
//                       : null;
//                 },
//                 focusNode: widget.focusNode ?? _focusNode,
//                 controller: widget.controller ?? _textCTL,
//                 obscureText: widget.obscureText,
//                 obscuringCharacter: '●',
//                 readOnly: widget.readOnly,
//                 minLines: 1,
//                 maxLines: widget.obscureText ? 1 : widget.maxLines,
//                 cursorRadius: Radius.circular(100.px),
//                 onTap: () {
//                   if (widget.onTap != null) {
//                     widget.onTap!();
//                   }
//                   if (widget.isResetValidateWithOnTap) {
//                     resetValidate();
//                   }
//                 },
//                 onFieldSubmitted: widget.onSubmitted,
//                 onEditingComplete: widget.onEditingComplete,
//                 keyboardType: widget.keyboardType,
//                 inputFormatters: widget.inputFormatters,
//                 textInputAction: widget.textInputAction,
//                 decoration: InputDecoration(
//                   label: RichText(
//                     text: TextSpan(
//                       text: _getLabel(),
//                       style: widget.labelStyle ?? const TextStyle(),
//                       children: [
//                         if (widget.isRequired)
//                           const TextSpan(
//                             text: ' *',
//                             style: TextStyle(),
//                           ),
//                       ],
//                     ),
//                   ),
//                   isCollapsed: widget.isCollapsed,
//                   prefixIcon: widget.prefixIcon != null
//                       ? Container(
//                           padding: EdgeInsets.fromLTRB(16.px, 0, 8.px, 0),
//                           height: 24.px,
//                           width: 24.px,
//                           child: widget.prefixIcon,
//                         )
//                       : null,
//                   suffixIcon: widget.hasSuffix == true
//                       ? _buildSuffixIcon()
//                       : const SizedBox(),
//                   contentPadding: _getContentPadding(),
//                   floatingLabelBehavior: widget.floatingLabelBehavior ??
//                       (widget.label == null
//                           ? FloatingLabelBehavior.never
//                           : FloatingLabelBehavior.auto),
//                   hintText: widget.hintText,
//                   hintStyle: widget.hintStyle ?? const TextStyle(),
//                   border: InputBorder.none,
//                   isDense: true,
//                   errorBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: SavisColor.error400),
//                     borderRadius: BorderRadius.circular(8.px),
//                   ),
//                 ),
//                 autofocus: widget.autofocus,
//                 cursorColor: widget.cursorColor ?? LuColors.blueGrey,
//                 cursorHeight: widget.cursorHeight,
//                 style: widget.style ?? const TextStyle(),
//               ),
//             ),
//             if (_checkRequired(isActiveRequired.value)) ...[
//               SizedBox(height: 2.px),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Vui lòng không bỏ trống trường này',
//                   style: TextStyle(),
//                 ),
//               ),
//             ],
//             if (_msgError != null)
//               Padding(
//                 padding: EdgeInsets.only(top: 8.px),
//                 child: Text(
//                   _msgError!,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: SavisStyle.bodyMRegular.error300,
//                 ),
//               ),
//           ],
//         ));
//   }

//   void initListenController() {
//     (widget.controller ?? _textCTL)?.addListener(() {
//       widget.onChanged?.call((widget.controller ?? _textCTL)?.text ?? '');
//       if (widget.isRequired &&
//           !isActiveRequired.value &&
//           ((widget.controller ?? _textCTL)?.text ?? '').isNotEmpty) {
//         isActiveRequired.value = true;
//       }

//       if (isShowClose && (widget.controller ?? _textCTL)!.text.isNotEmpty) {
//         return;
//       } else {
//         if (mounted) {
//           setState(() {
//             isShowClose = _isShowClose;
//           });
//         }
//       }
//     });
//   }

//   Border _renderBorder(bool isActiveRequired) {
//     if (widget.isRequired &&
//             isActiveRequired &&
//             ((widget.controller ?? _textCTL)?.text ?? '').isEmpty ||
//         (_msgError != null && widget.hasErrorBorder == true)) {
//       return Border.all(color: SavisColor.error300, width: 1.5.px);
//     }

//     return Border.all(
//       color: (widget.focusNode ?? _focusNode)?.hasFocus == true
//           ? widget.focusColor
//           : widget.borderColor,
//     );
//   }

//   void _handleFocusChanged() {
//     if (mounted) {
//       if ((widget.focusNode ?? _focusNode)?.hasFocus == false) {
//         setState(() {
//           isShowClose = false;
//         });
//       } else if (((widget.controller ?? _textCTL)?.text ?? '').isNotEmpty) {
//         setState(() {
//           isShowClose = true;
//         });
//       }
//     }
//   }

//   EdgeInsetsGeometry _getContentPadding() {
//     if (widget.contentPadding != null) {
//       return widget.contentPadding!;
//     }

//     return widget.label != null &&
//             widget.floatingLabelBehavior != FloatingLabelBehavior.never
//         ? EdgeInsets.symmetric(vertical: 8.px, horizontal: 16.px)
//         : EdgeInsets.only(bottom: 16.px);
//   }

//   String _getLabel() {
//     if ((widget.focusNode ?? _focusNode)?.hasFocus == true ||
//         ((widget.controller ?? _textCTL)?.text ?? '').isNotEmpty ||
//         widget.labelNoFocus.isEmpty) {
//       return widget.label ?? '';
//     }

//     return widget.labelNoFocus;
//   }

//   bool _checkRequired(bool isActiveRequired) =>
//       widget.isRequired &&
//       isActiveRequired &&
//       (widget.controller ?? _textCTL)!.text.isEmpty;

//   bool get _isShowClose {
//     if ((widget.controller ?? _textCTL)!.text.isNotEmpty &&
//         (widget.focusNode ?? _focusNode)?.hasFocus == true) {
//       return true;
//     }

//     return false;
//   }

//   Widget _buildSuffixIcon() {
//     if (widget.hasClearText && isShowClose) {
//       return CustomGestureDetector(
//         onTap: () {
//           (widget.controller ?? _textCTL)?.clear();
//           widget.onClearText?.call();
//         },
//         child: Container(
//           padding: EdgeInsets.fromLTRB(8.px, 0, 16.px, 0),
//           child: const Icon(Icons.close),
//         ),
//       );
//     } else if (widget.suffixIcon != null) {
//       return Container(
//         padding: EdgeInsets.fromLTRB(8.px, 0, 16.px, 0),
//         height: 24.px,
//         width: 24.px,
//         child: widget.suffixIcon,
//       );
//     }

//     return const SizedBox.shrink();
//   }

//   bool checkValidate() {
//     if (_msgError != null) {
//       return false;
//     }
//     if (widget.validator != null) {
//       setState(() {
//         _msgError = widget.validator!(widget.controller?.text);
//       });
//     }

//     return _msgError == null;
//   }

//   void resetValidate() {
//     setState(() {
//       _msgError = null;
//     });
//   }

//   bool? get error => _msgError != null;

//   void setError(String value) {
//     setState(() {
//       _msgError = value;
//     });
//   }

//   @override
//   void dispose() {
//     (widget.controller ?? _textCTL)?.removeListener(() {});
//     (widget.focusNode ?? _focusNode)?.removeListener(() {});
//     _focusNode?.dispose();
//     _textCTL?.dispose();

//     super.dispose();
//   }
// }
