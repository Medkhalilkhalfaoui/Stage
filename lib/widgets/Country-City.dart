import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class SelectCountryCity extends StatefulWidget {
  const SelectCountryCity({Key? key}) : super(key: key);

  @override
  State<SelectCountryCity> createState() => _SelectCountryCityState();
}

class _SelectCountryCityState extends State<SelectCountryCity> {

  late String countryValue;
  late String stateValue;
  late String cityValue;
  @override
  Widget build(BuildContext context) {
    return Container(

        child:
        Column(
          children: [
            SelectState(
              // style: TextStyle(color: Colors.red),
              onCountryChanged: (value) {
                setState(() {
                  countryValue = value;
                });
              },
              onStateChanged:(value) {
                setState(() {
                  stateValue = value;
                });
              },
              onCityChanged:(value) {
                setState(() {
                  cityValue = value;
                });
              },

            ),
            // InkWell(
            //   onTap:(){
            //     print('country selected is $countryValue');
            //     print('country selected is $stateValue');
            //     print('country selected is $cityValue');
            //   },
            //   child: Text(' Check')
            // )
          ],
        )
    );

  }
}
