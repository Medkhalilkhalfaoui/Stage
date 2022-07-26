
import 'package:flutter/material.dart';

import '../theme/Theme.dart';

class Switchwidget extends StatefulWidget {
  const Switchwidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Switchwidget> createState() => _SwitchState();
}

class _SwitchState extends State<Switchwidget> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      title: Text(widget.title,style: titleStyle,),
        contentPadding: EdgeInsets.only(left:10,bottom: 10),
        value: isSwitched,
        onChanged: (bool newvalue){
          setState((){
            isSwitched =newvalue;
          });
        },
      activeColor: Colors.black54,
      activeTrackColor: Colors.blueGrey,
    );
  }
}
