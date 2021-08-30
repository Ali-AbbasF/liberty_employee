import 'package:flutter/material.dart';
import 'package:liberty_employee/core/ui/styles.dart';

class SideMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget page;
  final bool selected;

  const SideMenuItem({
    Key key,
    @required this.icon,
    @required this.title,
    this.page,
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => page != null ? Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)) : {},
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 56.0,
            color: selected
                ? Styles.primaryColor.withOpacity(0.1)
                : Colors.transparent,
            child: Row(
              children: [
                SizedBox(width: Styles.edgeInsetsM,),
                Icon(
                  icon,
                  color: selected ? Styles.primaryColor : Styles.menuText,
                ),
                SizedBox(width: Styles.edgeInsetsM,),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: selected ? Styles.primaryColor : Styles.menuText),
                ),
              ],
            ),
          ),
          selected
              ? Container(
                  height: 56.0,
                  width: 4.0,
                  color: Styles.primaryColor,
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
