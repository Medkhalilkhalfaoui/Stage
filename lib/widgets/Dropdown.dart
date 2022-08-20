import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prise/main.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../Controller/varcontroller.dart';
import '../theme/Theme.dart';
import 'InputField.dart';

class Dropdown extends StatefulWidget {
  Dropdown(
      {Key? key,
      required this.title,
      required this.selectval,
      required this.items})
      : super(key: key);
  final String title;

  String selectval;
  List items;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 7, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: titleStyle,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(top: 10),
            width: width,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autofocus: false,
                    // validator: Validators.compose([
                    //   Validators.required('Field is required'),
                    //   //Validators.email('Invalid email address'),
                    // ]),
                    readOnly: true,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: widget.selectval,
                      hintStyle: subtitleStyle,
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Theme.of(context).backgroundColor,
                      )),
                    ),
                  ),
                ),
                Row(
                  children: [
                    DropdownButton(

                      dropdownColor: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                      items: widget.items
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  ))
                          .toList(),
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey, size: 32),
                      elevation: 4,
                      style: subtitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newval) {
                        setState(() {
                          widget.selectval = newval!;
                          if (widget.title == "Pays") {
                            c.selectDate.value = widget.selectval;
                          }
                          if (widget.title == "Time") {
                            c.selectedtime.value = widget.selectval;
                          }
                          print(c.selectDate.value);
                          print(c.selectedtime.value);
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
