import 'package:flutter/material.dart';
import 'package:liberty_employee/core/ui/styles.dart';

class CDropDown<T> extends StatefulWidget {
  final String title, hintText;
  final Stream<T> stream;
  final List<T> items;
  final void Function(T) onChange;
  final FontWeight hintWeight;
  final Widget icon;

  /// getStringFromItem must be passed if T is not String
  final String Function(T) getStringFromItem;

  /// get T from function passing list of items and the snapshot data
  final T Function(List<T>, T) getValueFromList;

  const CDropDown(
      {Key key,
        this.title,
        this.stream,
        @required this.items,
        this.hintText,
        this.onChange,
        this.getStringFromItem,
        this.getValueFromList,
        this.hintWeight = FontWeight.normal,
        this.icon})
      : assert(items != null),
        super(key: key);

  @override
  _CDropDownState<T> createState() => _CDropDownState<T>();
}

class _CDropDownState<T> extends State<CDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: widget.stream,
      builder: (context, snapshot) => SizedBox(
        height: 42,
        child: DropdownButtonFormField<T>(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Styles.edgeInsetsM,
            ),
            enabledBorder:  OutlineInputBorder(
              borderSide:  BorderSide(
                  color: Styles.lightGrey, width: 0.75),
              borderRadius: BorderRadius.all(
                Radius.circular(3.0),
              ),
            ),
          ),
          value: snapshot.data,
          isExpanded: true,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontWeight: FontWeight.w500),

          icon: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: widget.icon ??
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Styles.darkGrey,
                  size: 12,
                ),
          ),
          hint: widget.hintText != null
              ? Text(
            widget.hintText ?? '',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w500, color: Styles.lightGrey),
          )
              : null,
          onChanged: widget.onChange,
          selectedItemBuilder: (_) =>
          widget.items?.map<Widget>((T item) {
            final stringItem =
            item is String ? item : widget.getStringFromItem(item) ?? '';

            return stringItem.length > 20
                ? FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                stringItem,
                style: Theme.of(context).textTheme.headline1,
              ),
            )
                : Text(stringItem);
          })?.toList() ??
              [],
          items: widget.items
              ?.map((T item) => DropdownMenuItem<T>(
            child: Padding(
              padding:
              const EdgeInsets.only(bottom: Styles.edgeInsetsM),
              child: Text(
                item is String
                    ? item
                    : widget.getStringFromItem(item) ?? '',
                style: item == snapshot?.data
                    ? TextStyle(color: Styles.primaryColor)
                    : null,
              ),
            ),
            value: item,
          ))
              ?.toList() ??
              [],
        ),
      ),
    );
  }
}