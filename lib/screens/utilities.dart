// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utility extends StatefulWidget {
  const Utility({Key? key}) : super(key: key);

  @override
  State<Utility> createState() => _UtilityState();
}

class _UtilityState extends State<Utility> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PatientStat(),
    OtherStat(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Utilities'),
            elevation: 5),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Patients'),
            const BottomNavigationBarItem(icon: Icon(Icons.bed), label: 'Beds'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[400],
          onTap: _onItemTapped,
        ),
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: _widgetOptions.elementAt(_selectedIndex)),
      ),
    );
  }
}

class PatientStat extends StatefulWidget {
  const PatientStat({Key? key}) : super(key: key);

  @override
  State<PatientStat> createState() => _PatientStatState();
}

class _PatientStatState extends State<PatientStat> {
  TextEditingController _controllerTotalPatient = TextEditingController();
  TextEditingController _controllerCovidPatient = TextEditingController();
  TextEditingController _controllerNonCovidPatient = TextEditingController();
  TextEditingController _controllerERPatient = TextEditingController();
  TextEditingController _controllerOBERPatient = TextEditingController();
  TextEditingController _controllerOBPatient = TextEditingController();
  TextEditingController _controllerCardiologyPatient = TextEditingController();
  TextEditingController _controllerTelemetryPatient = TextEditingController();
  TextEditingController _controllerOncologyPatient = TextEditingController();
  TextEditingController _controllerOrthopedicPatient = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerTotalPatient.text = "0"; // Setting the initial value for the field.
    _controllerCovidPatient.text = "0";
    _controllerNonCovidPatient.text = "0";
    _controllerERPatient.text = "0";
    _controllerOBERPatient.text = "0";
    _controllerOBPatient.text = "0";
    _controllerCardiologyPatient.text = "0";
    _controllerTelemetryPatient.text = "0";
    _controllerOncologyPatient.text = "0";
    _controllerOrthopedicPatient.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 20, 0),
              child: Text(
                'Update Patients',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 380,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//=================================TOTAL NUMBER OF PATIENTS============================================================================================================
                        CustomTextFormField('Total Number of Patients',_controllerTotalPatient),
//==============================WITH COVID=======================================================
                        const SizedBox(
                          height: 15,
                        ),

                        CustomTextFormField('Number of Patients with Covid',_controllerCovidPatient),
//==============================WITHOUT COVID=======================================================

                        const SizedBox(
                          height: 15,
                        ),

                        CustomTextFormField('Number of Patients without Covid',_controllerNonCovidPatient),
//==============================IN ER=======================================================
                        const SizedBox(
                          height: 15,
                        ),

                        CustomTextFormField('Number of Patients in ER',_controllerERPatient),
//==============================OB-ER====================================================
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField('Number of Patients in OB-ER',_controllerOBERPatient),

//===============================OB=====================================================
                        const SizedBox(
                          height: 15,
                        ),

                        CustomTextFormField('Number of Patients in OB',_controllerOBPatient),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 12,
                          thickness: 1,
                          color: Color.fromARGB(255, 26, 25, 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        CustomTextFormField('Cardiology Patients',_controllerCardiologyPatient),
                        CustomTextFormField('Telemetry Patients',_controllerTelemetryPatient),
                        CustomTextFormField('Oncology Patients',_controllerOncologyPatient),
                        CustomTextFormField('Orthopedic Patients',_controllerOrthopedicPatient),
                        const SizedBox(
                          height: 10,
                        ),

//===================================BUTTONS========================================================
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15)),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            )
          ],
        ));
  }
}

class OtherStat extends StatefulWidget {
  const OtherStat({Key? key}) : super(key: key);

  @override
  State<OtherStat> createState() => _OtherStatState();
}

class _OtherStatState extends State<OtherStat> {
  TextEditingController _controllerTotalBed = TextEditingController();
  TextEditingController _controllerICUBed = TextEditingController();
  TextEditingController _controllerIsolationBed = TextEditingController();
  TextEditingController _controllerWardBed = TextEditingController();

  void initState() {
    super.initState();
    _controllerTotalBed.text = "0"; // Setting the initial value for the field.
    _controllerICUBed.text = "0";
    _controllerIsolationBed.text = "0";
    _controllerWardBed.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 20, 0),
              child: Text(
                'Update Beds',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                height: 380,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//===========================TOTAL NUMBER OF BEDS=================================
                        CustomTextFormField('Total Number of Beds',_controllerTotalBed),
//==============================ICU BEDS=======================================================
                        const SizedBox(
                          height: 15,
                        ),

                        CustomTextFormField('Total Number of ICU Beds',_controllerICUBed),
//====================================ISOLATION BEDS=======================================================

                        const SizedBox(
                          height: 15,
                        ),

                        CustomTextFormField('Total Number of Isolation Beds',_controllerIsolationBed),
//====================================WARD BEDS=======================================================

                        const SizedBox(
                          height: 15,
                        ),

                        CustomTextFormField('Total Number of Ward Beds',_controllerWardBed),
//===================================BUTTONS========================================================
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15)),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            )
          ],
        ));
  }
}

class CustomTextFormField extends StatefulWidget {
  String text;
  TextEditingController _controllers;
  CustomTextFormField(
      this.text, this._controllers);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.text,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 65,
            //margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: widget._controllers,
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '84',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: MaterialButton(
                            minWidth: 5.0,
                            child: const Icon(
                              Icons.arrow_drop_up,
                              size: 18.0,
                            ),
                            onPressed: () {
                              int currentValue =
                                  int.parse(widget._controllers.text);
                              setState(() {
                                currentValue++;
                                widget._controllers.text = (currentValue)
                                    .toString(); // incrementing value
                              });
                            }),
                      ),
                      Expanded(
                        child: MaterialButton(
                            minWidth: 5.0,
                            child: const Icon(
                              Icons.arrow_drop_down,
                              size: 18.0,
                            ),
                            onPressed: () {
                              int currentValue =
                                  int.parse(widget._controllers.text);
                              setState(() {
                                print("Setting state");
                                currentValue--;
                                widget._controllers.text =
                                    (currentValue > 0 ? currentValue : 0)
                                        .toString(); // decrementing value
                              });
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
