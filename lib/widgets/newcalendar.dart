import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:intl/intl.dart';

import '../theme/Theme.dart';

class Calandernew extends StatefulWidget {
   Calandernew({Key? key,  this.controller,  this.times, this.slot}) : super(key: key);
  final CalendarController? controller ;
   List<TimeRegion>? times;
  final int? slot ;


  @override
  State<Calandernew> createState() => _CalandernewState();
}

class _CalandernewState extends State<Calandernew> {
  final Color b =const  Color.fromRGBO(30, 144, 255, 1);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Date and Hour :" ,style: titleStyle,),
            const SizedBox(height: 10,),
            Container(


              height:h/1.4 ,
                child: SfCalendar(
                  controller: widget.controller ,
                  view: CalendarView.week,
                  headerStyle:const  CalendarHeaderStyle(
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 5,

                          fontWeight: FontWeight.w500)),

                  minDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,DateTime.now().hour,30,0,0),
                  maxDate: DateTime.now().add(const Duration(days: 7)),
                  selectionDecoration: BoxDecoration(
                    color: Colors.cyan,
                    border: Border.all(color: b, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    shape: BoxShape.rectangle,
                  ),
                  backgroundColor:const  Color.fromRGBO(0, 250, 154, 1),
                  todayHighlightColor: Colors.cyan,
                  showNavigationArrow: true,
                  showCurrentTimeIndicator: false,
                  firstDayOfWeek: 1,
                  cellBorderColor: b,

                  specialRegions: widget.times,
                  timeSlotViewSettings:  TimeSlotViewSettings( timeInterval: Duration(minutes: widget.slot?? 60), timeIntervalHeight: 60,timeIntervalWidth: 60, timeFormat: "HH:mm" ,startHour: 5),

                  //dataSource: MeetingDataSource(_getDataSource()),
                )
            ),
          ],
        ),
      ),
    );
  }
  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];
    regions.add(TimeRegion(
        startTime: DateTime(2022,8,23,12),
        endTime: DateTime(2022,8,23,12).add(const Duration(minutes: 30)),
        enablePointerInteraction: false,
        textStyle: TextStyle(color: b, fontSize: 15),
        color: Colors.black38,
        iconData: Icons.block));

    return regions;
  }
  // List<Meeting> _getDataSource() {
  //   final List<Meeting> meetings = <Meeting>[];
  //   final DateTime today = DateTime.now();
  //   final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
  //   final DateTime endTime = startTime.add(const Duration(hours: 2));
  //   meetings.add(Meeting(
  //       'Conference', startTime, endTime, Colors.black38, false));
  //   return meetings;
  // }
}
