import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String name;
  final Widget suffixIcon;
  final Function(String) onChanged;
  final String errorMessage;
  final bool obscureText;
  final Color borderColor;
  final String initialValue;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  InputField(
      {@required this.name,
      this.suffixIcon,
      this.errorMessage = "",
      this.borderColor = Colors.green,
      this.initialValue = "",
      @required this.onChanged,
      this.inputFormatters = const [],
      this.obscureText,
      this.keyboardType = TextInputType.text});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, bottom: 5),
          child: Text(
            name,
            style: theme.textTheme.headline4,
          ),
        ),
        TextFormField(
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          style: theme.textTheme.bodyText1,
          onChanged: (value) => onChanged(value),
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: borderColor),
              )),
        ),
        errorMessage != ""
            ? Text(
                errorMessage,
                style: theme.textTheme.bodyText2.copyWith(color: Colors.red),
              )
            : Container(),
      ],
    );
  }
}
