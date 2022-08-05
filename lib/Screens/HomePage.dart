import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prise/widgets/Switch.dart';
import 'package:prise/widgets/Time.dart';
import 'package:prise/widgets/Uploadfile.dart';

import '../Controller/varcontroller.dart';
import '../main.dart';
import '../widgets/Calendar.dart';
import '../widgets/Dropdown.dart';
import '../widgets/GroupRadiobutton.dart';
import '../widgets/InputField.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:shared_preferences/shared_preferences.dart';

final Controller c = Get.put(Controller());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


 var controllers = [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rendez-Vous'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Obx(() => Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              c.items.value.isNotEmpty
                  ? Expanded(
                child: ListView.builder(
                  itemCount: c.items.value.length,
                  itemBuilder: (context, index) {
                    switch (c.items.value[index]["type"]) {

                      case "edittext":
                        {

                          return Obx(() => InputField(

                            title: c.items.value[index]["name"],
                            hint: 'entrer votre  ${c.items.value[index]["name"]}',
                            required: c.items.value[index]["required"],
                            formatter: c.items.value[index]["formater"],
                            valid: c.items.value[index]["valid"] ,
                            keybordtype:  c.items.value[index]["keybord"],
                            controller: controllers[index],





                          ));
                        }
                      case "Time":
                        {
                          return Time(title: c.items.value[index]["name"]);
                        }
                      case "dropdown":
                        {
                          return Dropdown(
                            title: c.items.value[index]["name"],
                            items: c.items.value[index]["Dates"],
                            selectval: c.items.value[index]
                            ["initialval"],
                          );
                        }
                      case "heure":
                        {
                          return Obx(() => Dropdown(
                            title: c.items.value[index]["name"],
                            items: c.items.value[index]["Heures"]
                            [c.selectDate.value],
                            selectval: c.items.value[index]
                            ["initialval"],
                          ));
                        }
                      case "GroupRadio":
                        {
                          return GroupRadio(
                            title: c.items.value[index]["name"],
                            status: c.items.value[index]["sites"],
                            selected: c.items.value[index]["selected"],
                          );
                        }
                      case "Calendar":
                        {
                          var l = c.items.value[index]["ignore"].map((e) => e.toString()).toList();
                          return Calendar( title: c.items.value[index]["name"],
                              ignore: (DateTime dt){

                                  for(var i in l ){
                                    if(i== DateFormat('dd-MM-yyyy').format(dt)  ){
                                      return false;
                                    }

                                  }
                                  return true;
                              },

                         );
                        }

                      case"Switch":
                        {
                          return Switchwidget(title:  c.items.value[index]["text"]);
                        }
                      case "Importation":{
                        return UploadFile(title:c.items.value[index]["name"] ,);
                      }
                      default:
                        {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  c.indexdata==0?Container():FloatingActionButton.extended(
                                    onPressed: () {
                                      setState(() {
                                        if (c.indexdata.value >0){
                                          c.indexdata.value--;
                                          readJson();
                                          print(c.indexdata.value);
                                        }
                                      });


                                    },
                                    icon: const Icon(Icons.navigate_before),
                                    label: const Text('Back'),
                                  ),

                                  SizedBox(width: 15,),
                                  c.indexdata== c.data.length-1?Container():FloatingActionButton.extended(
                                    onPressed: () {

                                      setState(() {
                                        if((c.indexdata.value < c.data.length)&(_formkey.currentState!.validate())) {
                                          c.indexdata.value++;

                                          readJson();
                                          print(c.indexdata.value);
                                           var x =controllers.map((e) => e.text.toString());
                                           print(x);
                                           controllers.map((e) => e.clear());
                                          print('success');
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
                                    icon: const Icon(Icons.navigate_next),
                                    label: const Text('Next Step'),
                                  ),
                                ]
                            ),
                          ) ;
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
  void ShowToast(){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        //timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }
}
