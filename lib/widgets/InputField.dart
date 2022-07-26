import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../theme/Theme.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
    this.keybordtype,
    this.formatter,
    this.valid,


  })
      : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final TextInputType? keybordtype;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)?  valid;



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 7,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: titleStyle,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(top: 10),
            width: width ,
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
                    controller: controller,
                    autofocus: false,
                    keyboardType: keybordtype ,
                    inputFormatters: formatter,
                    validator: Validators.compose([
                      Validators.required('Field is required'),
                      //Validators.email('Invalid email address'),
                    ]) ,
                    readOnly: widget == null? false:true ,
                    cursorColor:  Colors.grey,
                    decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: subtitleStyle,
                        enabledBorder:const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0,
                            )
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).backgroundColor,
                            )
                        ),


                    ),

                  ),
                ),
                widget?? Container(),
              ],
            ),

          ),

        ],
      ),

    );
  }
}