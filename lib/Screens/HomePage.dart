import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:prise/Screens/Success.dart';
import 'package:prise/widgets/Switch.dart';
import 'package:prise/widgets/Time.dart';
import 'package:prise/widgets/Uploadfile.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../Controller/varcontroller.dart';
import '../main.dart';
import '../widgets/Calendar.dart';
import '../widgets/Country-City.dart';
import '../widgets/Dropdown.dart';
import '../widgets/GroupRadiobutton.dart';
import '../widgets/InputField.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/newcalendar.dart';
//import 'package:shared_preferences/shared_preferences.dart';

final Controller c = Get.put(Controller());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  final CalendarController? cont = CalendarController();

  List<TimeRegion> list = [];

  final _formkey = GlobalKey<FormState>();
  var num = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step $num'),
        actions: [
          Image.asset("assets/teamdev-logo.png")
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 5),
        child: Obx(() => Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  c.items.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: c.items.length,
                            itemBuilder: (context, index) {
                              switch (c.items[index]["type"]) {
                                case "edittext":
                                  {
                                    return Obx(() => InputField(
                                          title: c.items[index]["name"],
                                          hint:
                                              'entrer votre  ${c.items[index]["name"]}',
                                          required: c.items[index]["required"],
                                          formatter: c.items[index]["formater"],
                                          valid: c.items[index]["valid"],
                                          keybordtype: c.items[index]
                                              ["keybord"],
                                          controller: controllers[index],
                                        ));
                                  }
                                case "Time":
                                  {
                                    return Time(title: c.items[index]["name"]);
                                  }
                                case "dropdown":
                                  {
                                    return Dropdown(
                                      title: c.items[index]["name"],
                                      items: c.items[index]["Dates"],
                                      selectval: c.items[index]["initialval"],
                                    );
                                  }
                                case "heure":
                                  {
                                    return Obx(() => Dropdown(
                                          title: c.items[index]["name"],
                                          items: c.items[index]["Heures"]
                                              [c.selectDate.value],
                                          selectval: c.items.value[index]
                                              ["initialval"],
                                        ));
                                  }
                                case "GroupRadio":
                                  {
                                    return GroupRadio(
                                      title: c.items[index]["name"],
                                      status: c.items[index]["sites"],
                                      //selected: c.items[index]["selected"],
                                    );
                                  }
                                case "Birth":
                                  {

                                    return Birth(
                                      title: c.items[index]["name"],

                                    );
                                  }

                                case "Switch":
                                  {
                                    return Switchwidget(
                                        title: c.items[index]["text"]);
                                  }
                                case "Importation":
                                  {
                                    return UploadFile(
                                      title: c.items[index]["name"],
                                    );
                                  }
                                case "Country-City":
                                  {
                                    return SelectCountryCity();
                                  }
                                case "c":
                                  {
                                    DateTime temp = DateTime.now();
                                    var data = c.items[index]["ignore"];
                                    var cc = [];
                                    for (var k in data) {
                                      cc.add(k.toString());
                                    }
                                    List<String> strs =
                                        cc.map((e) => e.toString()).toList();

                                    for (var j in strs) {
                                      var x = j.toString().split("-");
                                      DateTime t = DateTime(
                                          int.parse(x[2]),
                                          int.parse(x[1]),
                                          int.parse(x[0]),
                                          int.parse(x[3]));
                                      list.add(TimeRegion(
                                        startTime: t,
                                        endTime: t.add(Duration(
                                            minutes: int.parse(
                                                c.items[index]["Slot"]))),
                                        iconData: Icons.block,
                                        color: Colors.black38,
                                        enablePointerInteraction: false,
                                        textStyle: const TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15),
                                      ));
                                    }

                                    //   List<List<String>> matrice =  List<List<String>>.from(c.items[index]["ignore"]) as List<List<String>> ;
                                    //   for(var i in matrice){
                                    //    // List<String> strs = i.map((e) => e.toString()).toList();
                                    //     for(var j in i){
                                    //       var x = j.toString().split("-");
                                    //       DateTime t = DateTime(int.parse(x[0]),int.parse(x[1]),int.parse(x[2]),int.parse(x[3]));
                                    //       list.add(TimeRegion(startTime: t, endTime: t.add(const Duration(hours: 1)),iconData: Icons.block,color: Colors.black38));
                                    //     }
                                    // }

                                    return Obx(() => Calandernew(
                                          controller: cont,
                                          times: [
                                            ...list,
                                            TimeRegion(
                                              startTime: DateTime(
                                                  temp.year,
                                                  temp.month,
                                                  temp.day,
                                                  temp.hour,
                                                  temp.minute > 30 ? 30 : 0,
                                                  0,
                                                  0),
                                              endTime: DateTime(
                                                  temp.year,
                                                  temp.month,
                                                  temp.day,
                                                  temp.hour,
                                                  temp.minute > 30 ? 60 : 30,
                                                  0,
                                                  0,
                                                  0),
                                              iconData: Icons.block,
                                              color: Colors.black38,
                                              enablePointerInteraction: false,
                                              textStyle: const TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 15),
                                            )
                                          ],
                                          slot:
                                              int.parse(c.items[index]["Slot"]),
                                        ));
                                    // [
                                    //   TimeRegion(
                                    //     startTime: DateTime(2022,8,23,12),
                                    //     endTime: DateTime(2022,8,23,12).add(const Duration(hours: 1)),
                                    //     enablePointerInteraction: false,
                                    //     textStyle: TextStyle(color: Colors.red, fontSize: 15),
                                    //     color: Colors.black38,
                                    //     iconData: Icons.block)
                                    // ]

                                  }
                                default:
                                  {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            c.indexdata == 0
                                                ? Container()
                                                : FloatingActionButton.extended(
                                                    onPressed: () {
                                                      setState(() {
                                                        if (c.indexdata.value >
                                                            0) {
                                                          c.indexdata.value--;
                                                          num--;
                                                          readJson();
                                                          print(c
                                                              .indexdata.value);
                                                        }
                                                      });
                                                    },
                                                    icon: const Icon(
                                                        Icons.navigate_before),
                                                    label: const Text('Back'),
                                                  ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            c.indexdata == c.data.length - 1
                                                ? FloatingActionButton.extended(
                                                    onPressed: () {
                                                      Get.off(() =>
                                                          const Success());
                                                    },
                                                    label:
                                                        const Text('Confirmer'),
                                                    heroTag: "bf",
                                                  )
                                                : FloatingActionButton.extended(
                                                    onPressed: () {
                                                      setState(() {
                                                        if ((c.indexdata.value <
                                                                c.data.length) &
                                                            (_formkey
                                                                .currentState!
                                                                .validate())) {
                                                          c.indexdata.value++;
                                                          num++;

                                                          readJson();
                                                          print(c
                                                              .indexdata.value);
                                                          var x = controllers
                                                              .map((e) => e.text
                                                                  .toString());
                                                          print(x);
                                                          controllers.map(
                                                              (e) => e.clear());
                                                          print('success');
                                                          print(cont
                                                              ?.selectedDate);
                                                          print(c.SelectedRadio);

                                                        }
                                                      });

                                                      // if(_formkey.currentState!.validate()){
                                                      //   print('success');
                                                      // }
                                                      // if(c.selectDate.value==""){
                                                      //   ShowToast();
                                                      // }
                                                      //ShowToast();
                                                    },
                                                    icon: const Icon(
                                                        Icons.navigate_next),
                                                    label:
                                                        const Text('Next Step'),
                                                  ),
                                          ]),
                                    );
                                  }
                              }
                            },
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 4.0,
                            valueColor: AlwaysStoppedAnimation(Colors.black54),
                          ),
                        ),
                ],
              ),
            )),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     FloatingActionButton.extended(
      //       onPressed: () {
      //         setState(() {
      //           if (c.indexdata.value >0){
      //             c.indexdata.value--;
      //             readJson();
      //             print(c.indexdata.value);
      //           }
      //         });
      //
      //         if(_formkey.currentState!.validate()){
      //           print('success');
      //         }
      //         if(c.selectDate.value==""){
      //           ShowToast();
      //         }
      //         //ShowToast();
      //       },
      //       icon: const Icon(Icons.navigate_before),
      //       label: const Text('Back'),
      //     ),
      //
      //     SizedBox(width: 15,),
      //     FloatingActionButton.extended(
      //       onPressed: () {
      //         setState(() {
      //           if (c.indexdata.value < c.data.length){
      //             c.indexdata.value++;
      //             readJson();
      //             print(c.indexdata.value);
      //           }
      //         });
      //
      //         if(_formkey.currentState!.validate()){
      //           print('success');
      //         }
      //         if(c.selectDate.value==""){
      //           ShowToast();
      //         }
      //         //ShowToast();
      //       },
      //       icon: const Icon(Icons.navigate_next),
      //       label: const Text('Next Step'),
      //     ),
      //   ]
      // ),
    );
  }

  void ShowToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        //timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
