
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


import '../theme/Theme.dart';

class Calendar extends StatefulWidget {
   Calendar({Key? key,
    required this.title,
    this.ignore




  })
      : super(key: key);

  final String title;
  Function? ignore ;



  @override
  State<Calendar> createState() => _InputFieldState();
}

class _InputFieldState extends State<Calendar> {
  DateTime _selectedDate = DateTime.now();

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
                      hintText: DateFormat('dd-MM-yyyy ').format(_selectedDate),
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
          Icons.calendar_today_outlined,
          color: Colors.grey,
        ),
        onPressed: () => getDateFromUser(widget.ignore),
      ),
              ],
            ),

          ),

        ],
      ),

    );
  }
  getDateFromUser( x) async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(2040),
        selectableDayPredicate: x,
        // selectableDayPredicate: (DateTime dateTime) {
        //   if (dateTime == DateTime(2022, 8, 2) || dateTime == DateTime(2022, 8, 5) || dateTime == DateTime(2022, 8, 14) || dateTime == DateTime(2022, 8, 18) || dateTime == DateTime(2022, 8, 23) || dateTime == DateTime(2022, 8, 29))  {
        //     return false;
        //   }
        //   return true;
        // },
    );
    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;
      });
    } else
      print('it\'s null or something is wrong ');
  }
}
