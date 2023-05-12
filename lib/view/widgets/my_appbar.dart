import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

customAppBar(String title, BuildContext context,
    {bool? automaticallyImplyLeading, Widget? leading, List<Widget>? actions}) {
  TextTheme textTheme = Theme.of(context).textTheme;
  return AppBar(
    iconTheme: const IconThemeData(color: white),
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    leading: leading,
    backgroundColor: black,
    elevation: 3.0,
    centerTitle: true,
    toolbarHeight: 64,
    actions: actions,
    title: Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: textTheme.headlineSmall!.copyWith(
              fontSize: 22,
              color: white,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
      ],
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
  );
}