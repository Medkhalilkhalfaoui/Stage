import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../Controller/varcontroller.dart';
import '../theme/Theme.dart';


class GroupRadio extends StatefulWidget {
   GroupRadio({Key? key, required this.selected,required this.title,required this.status}) : super(key: key);
    String selected;
    String title ;
    List status;

  @override
  State<GroupRadio> createState() => _GroupRadioState();
}

class _GroupRadioState extends State<GroupRadio> {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(left: 7,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: titleStyle,),
          const SizedBox(height: 10,),
          RadioGroup<String>.builder(

            textStyle: subtitleStyle,
            groupValue: widget.selected,
            onChanged: (String? value) => setState(() {
              widget.selected = value!;
              c.SelectedRadio.value = widget.selected;
              print( c.SelectedRadio.value);
            }),
            items: widget.status.map((e) => e.toString()).toList(),
            itemBuilder: (item) => RadioButtonBuilder(
              item,
            ),
            activeColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
