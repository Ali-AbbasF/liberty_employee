import 'package:flutter/material.dart';

Future<void> popupView(
    BuildContext context, content) async {

  ShapeBorder dialogShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      const Radius.circular(10),
    ),
  );
  await showDialog<Future<void>>(
    context: context,
    builder: (context) => AlertDialog(
      shape: dialogShape,
      content: content,
    ),
  );
  // }
}