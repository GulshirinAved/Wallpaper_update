import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constants/constants.dart';
import '../widgets/widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: true, elevation: true, name: 'About Us'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: height15, bottom: height10, left: width12),
            child: Text(
              'For Contacting:',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontFamily: fontstyleGilroyBold, fontSize: fontsize20),
            ),
          ),
          aboutPageWidget('dadebaygurbanow333@gmail.com', IconlyLight.message, context),
        ],
      ),
    );
  }
}
