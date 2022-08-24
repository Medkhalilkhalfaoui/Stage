import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../Controller/varcontroller.dart';
import '../theme/Theme.dart';


class GroupRadio extends StatefulWidget {
   GroupRadio({Key? key, required this.title,required this.status}) : super(key: key);

    String title ;
    List status;

  @override
  State<GroupRadio> createState() => _GroupRadioState();
}

class _GroupRadioState extends State<GroupRadio> {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.only(left: 7,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,style: titleStyle,),
              const SizedBox(height: 10,),
              Obx(() => RadioGroup<String>.builder(

                textStyle: subtitleStyle,
                groupValue: c.SelectedRadio.value,
                onChanged: (String? value) => setState(() {
                  //widget.selected = value!;
                  c.SelectedRadio.value = value!;
                  print( c.SelectedRadio.value);
                }),
                items: widget.status.map((e) => e.toString()).toList(),
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
                activeColor: Colors.grey,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
