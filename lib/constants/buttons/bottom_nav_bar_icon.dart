import 'package:flutter/material.dart';

import '../constants.dart';

class IconBottonBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;
  const IconBottonBar({required this.text, required this.icon, required this.selected, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: iconsize25,
            color: selected ? Theme.of(context).colorScheme.secondary : kgrey,
          ),
        ),
        Text(
          text,
          //
          style: TextStyle(fontSize: fontsize12, height: .1, color: selected ? Theme.of(context).colorScheme.secondary : kgrey, fontFamily: selected ? fontstyleGilroyBold : fontstyleGilroyMedium),
        )
      ],
    );
  }
}
