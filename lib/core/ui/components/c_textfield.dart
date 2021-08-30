import 'package:flutter/material.dart';
import 'package:liberty_employee/core/ui/styles.dart';

class CTextField extends StatelessWidget {
  final void Function(String) onChange;
  final String hintText;
  final int maxLines;
  final double height;

  const CTextField({
    Key key,
    this.onChange,
    this.hintText,
    this.maxLines,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 42,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(color: Styles.lightGrey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Styles.lightGrey, width: 0.75),
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Styles.lightGrey, width: 0.75),
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Styles.lightGrey, width: 0.75),
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
          ),
        ),
        maxLines: maxLines,
        onChanged: onChange,
      ),
    );
  }
}
