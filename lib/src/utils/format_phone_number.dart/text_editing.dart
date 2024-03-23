import 'dart:math';

import 'package:flutter/services.dart';

TextEditingValue textManipulation(
  TextEditingValue oldValue,
  TextEditingValue newValue, {
  TextInputFormatter? textInputFormatter,
  String Function(String filteredString)? formatPattern,
}) {
  final originalUserInput = newValue.text;

  newValue = textInputFormatter != null
      ? textInputFormatter.formatEditUpdate(oldValue, newValue)
      : newValue;

  var selectedIndex = newValue.selection.end;

  final newText =
      formatPattern != null ? formatPattern(newValue.text) : newValue.text;

  if (newText == newValue.text) {
    return newValue;
  }

  var insertCount = 0;
  var inPutCount = 0;

  bool _isUserInput(String s) {
    if (textInputFormatter == null) return originalUserInput.contains(s);
    return newValue.text.contains(s);
  }

  for (var i = 0; i < newText.length && inPutCount < selectedIndex; i++) {
    final character = newText[i];

    if (_isUserInput(character)) {
      inPutCount++;
    } else {
      insertCount++;
    }
  }

  selectedIndex += insertCount;
  selectedIndex = min(selectedIndex, newText.length);

  // if (selectedIndex - 1 >= 0 &&
  //     selectedIndex - 1 < newText.length &&
  //     !_isUserInput(newText[selectedIndex - 1])) {
  //   // selectedIndex;
  // }

  return newValue.copyWith(
    text: newText,
    selection: TextSelection.collapsed(offset: selectedIndex),
    composing: TextRange.empty,
  );
}