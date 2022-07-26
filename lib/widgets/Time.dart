import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


import '../theme/Theme.dart';

class Time extends StatefulWidget {
  const Time({Key? key,
    required this.title,




  })
      : super(key: key);

  final String title;



  @override
  State<Time> createState() => _InputFieldState();
}

class _InputFieldState extends State<Time> {
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 10,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: titleStyle,),
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
                    autofocus: false,
                    readOnly: true ,
                    cursorColor:  Colors.white,
                    decoration: InputDecoration(
                      hintText: _startTime,
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
                IconButton(
                  icon: const Icon(
                    Icons.access_time_filled_rounded,
                    color: Colors.grey,
                  ),
                  onPressed: () => _getTimeFromUser(),
                ),
              ],
            ),

          ),

        ],
      ),

    );
  }
  _getTimeFromUser() async {
    TimeOfDay? _pickedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    String _formattedTime = _pickedTime!.format(context);
    if (_pickedTime != null) {
      setState(() => _startTime = _formattedTime);
    } else
      print('time canceled something is wrong ');
  }
}
