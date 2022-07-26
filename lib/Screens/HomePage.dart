import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prise/widgets/Switch.dart';
import 'package:prise/widgets/Time.dart';
import 'package:prise/widgets/Uploadfile.dart';

import '../Controller/varcontroller.dart';
import '../widgets/Calendar.dart';
import '../widgets/Dropdown.dart';
import '../widgets/GroupRadiobutton.dart';
import '../widgets/InputField.dart';
import 'package:fluttertoast/fluttertoast.dart';

final Controller c = Get.put(Controller());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          return InputField(

                            title: c.items.value[index]["name"],
                            hint: 'entrer votre ' +
                                c.items.value[index]["name"],


                          );
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
                            //_items[index]["Dates"][c.select.value],
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
                          return Calendar( title: c.items.value[index]["name"],);
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
                          return Container();
                        }
                        break;
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            if (c.indexdata.value < c.items.length){
              c.indexdata.value++;
              print(c.indexdata.value);
            }
          });

          if(_formkey.currentState!.validate()){
            print('success');
          }
          if(c.selectDate.value==""){
             ShowToast();
          }
          //ShowToast();
        },
        icon: const Icon(Icons.navigate_next),
        label: const Text('Next Step'),
      ),
    );
  }
  void ShowToast(){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        //timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }
}
