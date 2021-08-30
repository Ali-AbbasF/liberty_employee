import 'package:flutter/material.dart';
import 'package:liberty_employee/core/ui/styles.dart';

class CButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Widget widget;

  const CButton({Key key, this.onPressed, this.text, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Styles.black, width: 1.0),
              color: Styles.white,
              borderRadius: BorderRadius.all(Radius.circular(3.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget ??
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.w700),
                ),
          ),
        ));
  }
}
