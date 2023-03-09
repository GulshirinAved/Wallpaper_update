import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DarkMode extends StatefulWidget {
  bool darkmode;
  DarkMode({required this.darkmode, Key? key}) : super(key: key);

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.moon_stars,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
//   widget.darkmode = !widget.darkmode;
