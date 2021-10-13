import 'package:flutter/material.dart';

import 'SideMenuStyle.dart';
import 'Global/Global.dart';
import 'SideMenuItem.dart';
import 'SideMenuDisplayMode.dart';

class SideMenu extends StatelessWidget {
  /// Page controller to control [PageView] widget
  final PageController controller;

  /// List of [SideMenuItem] to show them on [SideMenu]
  final List<SideMenuItem> items;

  /// Title widget will shows on top of all items,
  /// it can be a logo or a Title text
  final Widget? title;

  /// Footer widget will show on bottom of [SideMenu]
  /// when [displayMode] was SideMenuDisplayMode.open
  final Widget? footer;

  /// [SideMenu] can be configured by this
  final SideMenuStyle? style;

  /// ### Easy Sidemenu widget
  ///
  /// Sidemenu is a menu that is usually located
  /// on the left or right of the page and can used for navigations
  const SideMenu({
    Key? key,
    required this.items,
    required this.controller,
    this.title,
    this.footer,
    this.style,
  }) : super(key: key);

  /// Set [SideMenu] width according to displayMode
  double _widthSize(SideMenuDisplayMode mode, BuildContext context) {
    if (mode == SideMenuDisplayMode.auto) {
      if (MediaQuery.of(context).size.width > 600) {
        Global.displayModeState.change(SideMenuDisplayMode.open);
        return Global.style.openSideMenuWidth ?? 300;
      } else {
        Global.displayModeState.change(SideMenuDisplayMode.compact);
        return Global.style.compactSideMenuWidth ?? 50;
      }
    } else if (mode == SideMenuDisplayMode.open) {
      Global.displayModeState.change(SideMenuDisplayMode.open);
      return Global.style.openSideMenuWidth ?? 300;
    } else {
      Global.displayModeState.change(SideMenuDisplayMode.compact);
      return Global.style.compactSideMenuWidth ?? 50;
    }
  }

  @override
  Widget build(BuildContext context) {
    Global.controller = controller;
    items.sort((a, b) => a.priority.compareTo(b.priority));
    Global.style = style ?? SideMenuStyle();

    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      width: _widthSize(
          Global.style.displayMode ?? SideMenuDisplayMode.auto, context),
      height: MediaQuery.of(context).size.height * (0.89),
      color: Global.style.backgroundColor ?? null,
      // decoration: BoxDecoration(borderRadius: BorderRadius.only(
      //     topLeft: const Radius.circular(16),
      //     bottomLeft: const Radius.circular(16))),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                if (title != null) title!,
                ...items,
              ],
            ),
          ),
          if (footer != null &&
              Global.displayModeState.value != SideMenuDisplayMode.compact)
            Align(alignment: Alignment.bottomCenter, child: footer!),
        ],
      ),
    );
  }
}
