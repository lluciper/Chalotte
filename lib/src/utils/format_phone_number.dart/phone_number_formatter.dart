import 'package:flutter/services.dart';

import 'text_editing.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  PhoneNumberFormatter({this.phoneNumber = ''});

  final String phoneNumber;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return textManipulation(
      oldValue,
      newValue,
      textInputFormatter: FilteringTextInputFormatter.digitsOnly,
      formatPattern: (phoneNumber) {
        var offset = 0;

        var buffer = StringBuffer();

        for (var i = 0; i <= phoneNumber.length; i += 1) {
          buffer.write(phoneNumber.substring(offset, i));
          if (i == phoneNumber.length) break;
          if (i == phoneNumber.length - 3) {
            buffer.write('.');
          }
          if (i == phoneNumber.length - 6) {
            buffer.write('.');
          }
          offset = i;
        }
        return buffer.toString();
      },
    );
  }
}