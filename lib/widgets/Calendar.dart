
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../Controller/varcontroller.dart';
import '../theme/Theme.dart';

final Controller c = Get.put(Controller());
class Birth extends StatefulWidget {
  Birth({Key? key,
    required this.title,
    this.ignore




  })
      : super(key: key);

  final String title;
  Function? ignore ;



  @override
  State<Birth> createState() => _InputFieldState();
}


class _InputFieldState extends State<Birth> {
  DateTime _selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
                      child: Obx(()=> TextFormField(
                        autofocus: false,
                        readOnly: true ,
                        cursorColor:  Colors.white,
                        decoration: InputDecoration(
                          hintText: c.birth.value,
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

                      ),)
                    ),
          IconButton(
            icon: const Icon(
              Icons.calendar_today_outlined,
              color: Colors.grey,
            ),
            onPressed: () => getDateFromUser(),
          ),
                  ],
                ),

              ),

            ],
          ),

        ),
      ),
    );
  }
  getDateFromUser( ) async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),

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
        c.birth.value =  DateFormat('dd-MM-yyyy ').format(_selectedDate);
      });
    } else
      print('it\'s null or something is wrong ');
  }
}
