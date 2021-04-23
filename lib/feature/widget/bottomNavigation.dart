import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';
import 'package:message_app/core/constants/color_contants.dart';
import 'package:message_app/feature/widget/bottomNavItem.dart';

class bottomNavigation extends StatelessWidget {
  final colorConst = ColorTheme();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.1),
      // width: context.dynamicWidth(0.9),
      padding: context.paddingLow,
      decoration: BoxDecoration(
          borderRadius: context.highBorderRadius, color: colorConst.emerald),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavItem(
            icon: Icon(Icons.message),
            isActive: false,
          ),
          NavItem(
            icon: Icon(Icons.call),
            isActive: false,
          ),
          NavItem(
            icon: Icon(Icons.camera_alt_outlined),
            isActive: false,
          ),
          NavItem(
            icon: Icon(Icons.settings),
            isActive: false,
          ),
        ],
      ),
    );
  }
}
