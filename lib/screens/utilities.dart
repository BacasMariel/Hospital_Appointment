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
    _controllerTotalPatient.text =
        "0"; // Setting the initial value for the field.
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Total Number of Patients',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerTotalPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerTotalPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerTotalPatient
                                                            .text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerTotalPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerTotalPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//==============================WITH COVID=======================================================
                        const SizedBox(
                          height: 15,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Number of Patients with Covid',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerCovidPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerCovidPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerCovidPatient
                                                            .text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerCovidPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerCovidPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//==============================WITHOUT COVID=======================================================

                        const SizedBox(
                          height: 15,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Number of Patients without Covid',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller:
                                              _controllerNonCovidPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerNonCovidPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerNonCovidPatient
                                                            .text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerNonCovidPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerNonCovidPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//==============================IN ER=======================================================
                        const SizedBox(
                          height: 15,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Number of Patients in ER',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerERPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerERPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerERPatient.text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerERPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerERPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//==============================OB-ER====================================================
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Number of Patients in OB-ER',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerOBERPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerOBERPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerOBERPatient
                                                            .text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerOBERPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerOBERPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),

//===============================OB=====================================================
                        const SizedBox(
                          height: 15,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Number of Patients in OB',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerOBPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerOBPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerOBPatient.text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerOBPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerOBPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
                        const SizedBox(height: 10,),
                        const Divider(
                          height: 12,
                          thickness: 1,
                          color: Color.fromARGB(255, 26, 25, 25),
                        ),
                        const SizedBox(height: 10,),
//=================================================================================
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Cardiology Patients',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerCardiologyPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerCardiologyPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerCardiologyPatient
                                                            .text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerCardiologyPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerCardiologyPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//================================================================================
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Telemetry Patients',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerTelemetryPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerTelemetryPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerTelemetryPatient
                                                            .text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerTelemetryPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerTelemetryPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//=================================================================================
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Oncology Patients',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerOncologyPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerOncologyPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerOncologyPatient
                                                            .text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerOncologyPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerOncologyPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//==============================================================================
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Orthopedic Patients',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerOrthopedicPatient,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerOrthopedicPatient
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerOrthopedicPatient
                                                            .text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerOrthopedicPatient
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerOrthopedicPatient
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Total Number of Beds',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerTotalBed,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerTotalBed.text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerTotalBed.text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerTotalBed.text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerTotalBed
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//==============================ICU BEDS=======================================================
                        const SizedBox(
                          height: 15,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Total Number of ICU Beds',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerICUBed,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerICUBed.text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerICUBed.text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerICUBed.text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerICUBed
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//====================================ISOLATION BEDS=======================================================

                        const SizedBox(
                          height: 15,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Total Number of Isolation Beds',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerIsolationBed,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerIsolationBed
                                                          .text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerIsolationBed
                                                            .text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerIsolationBed
                                                          .text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerIsolationBed
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),
//====================================WARD BEDS=======================================================

                        const SizedBox(
                          height: 15,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Total Number of Ward Beds',
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
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllerWardBed,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '84',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ], // Only numbers can be entered
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                minWidth: 5.0,
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  int currentValue = int.parse(
                                                      _controllerWardBed.text);
                                                  setState(() {
                                                    currentValue++;
                                                    _controllerWardBed.text =
                                                        (currentValue)
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
                                                  int currentValue = int.parse(
                                                      _controllerWardBed.text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _controllerWardBed
                                                        .text = (currentValue >
                                                                0
                                                            ? currentValue
                                                            : 0)
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
                        ),

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
