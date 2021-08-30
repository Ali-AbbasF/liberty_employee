import 'package:flutter/material.dart';
import 'package:liberty_employee/core/enums/side_menu_enums.dart';
import 'package:liberty_employee/core/ui/styles.dart';
import 'package:liberty_employee/core/ui/widgets/side_menu_widget.dart';

class SideMenuPage extends StatelessWidget {
  final Widget bodyRight;
  final Widget bodyLeft;
  final Widget header;
  final Widget options;
  final SideMenuEnums selectedPage;

  const SideMenuPage(
      {Key key, this.bodyRight, this.bodyLeft, this.header, this.options, this.selectedPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.lightScaffoldBackground,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: SideMenuWidget(
              selectedPage: selectedPage,
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(height: Styles.headerHeight,color: Styles.white,child: header ?? Container()),
                SizedBox(
                  height: Styles.edgeInsetsML,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Styles.edgeInsetsML),
                  child: SizedBox(
                    height: 75,
                    child: Card(
                      color: Styles.white,
                      child: options ??  Container(),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Styles.edgeInsetsML, vertical: Styles.edgeInsetsML),
                  child: SizedBox(
                    height: 480,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Card(
                            color: Styles.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: bodyLeft ?? Container(),
                            ),
                          ),
                        ),
                        SizedBox(width: Styles.edgeInsetsML,),
                        Expanded(
                          child: Card(
                            color: Styles.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: bodyRight ??  Container(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
