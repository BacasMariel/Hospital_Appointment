// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dashboard.dart';
import '../model/model.dart';

class Utility extends StatefulWidget {
  const Utility({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Utility());
  }

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
          child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        ),
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
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardInitial) {
          return const CircularProgressIndicator(
            color: Colors.orange,
          );
        }
        if (state is DataLoaded) {
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
                              CustomTextFormField(
                                  'Total Number of Patients',
                                  _controllerTotalPatient
                                    ..text = state.data.num_of_total_patient
                                        .toString()),
//==============================WITH COVID=======================================================
                              const SizedBox(
                                height: 15,
                              ),

                              CustomTextFormField(
                                  'Number of Patients with Covid',
                                  _controllerCovidPatient
                                    ..text = state.data.num_of_total_covid_cases
                                        .toString()),
//==============================WITHOUT COVID=======================================================

                              const SizedBox(
                                height: 15,
                              ),

                              CustomTextFormField(
                                  'Number of Patients without Covid',
                                  _controllerNonCovidPatient
                                    ..text = (state.data.num_of_total_patient -
                                            state.data.num_of_total_covid_cases)
                                        .toString()),
//==============================IN ER=======================================================
                              const SizedBox(
                                height: 15,
                              ),

                              CustomTextFormField(
                                  'Number of Patients in ER',
                                  _controllerERPatient
                                    ..text = state.data.emergency_patient_count
                                        .toString()),
//==============================OB-ER====================================================
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextFormField(
                                  'Number of Patients in OB-ER',
                                  _controllerOBERPatient
                                    ..text = state.data.ob_er_patient_count
                                        .toString()),

//===============================OB=====================================================
                              const SizedBox(
                                height: 15,
                              ),

                              CustomTextFormField(
                                  'Number of Patients in OB',
                                  _controllerOBPatient
                                    ..text =
                                        state.data.ob_patient_count.toString()),
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

                              CustomTextFormField(
                                  'Cardiology Patients',
                                  _controllerCardiologyPatient
                                    ..text = state.data.cardiology_patient_count
                                        .toString()),
                              CustomTextFormField(
                                  'Telemetry Patients',
                                  _controllerTelemetryPatient
                                    ..text = state.data.telemetry_patient_count
                                        .toString()),
                              CustomTextFormField(
                                  'Oncology Patients',
                                  _controllerOncologyPatient
                                    ..text = state.data.oncology_patient_count
                                        .toString()),
                              CustomTextFormField(
                                  'Orthopedic Patients',
                                  _controllerOrthopedicPatient
                                    ..text = state.data.orthopedic_patient_count
                                        .toString()),
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
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil<void>(
                            HomePage.route(),
                            (route) => false,
                          );
                        },
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
                        onPressed: () {
                          context.read<DashboardBloc>().add(UpdateData(DataApi(
                                state.data.id,
                                state.data.num_of_current_patient,
                                state.data.num_of_discharge,
                                state.data.num_of_admits,
                                (int.parse(_controllerCovidPatient.text) +
                                    int.parse(_controllerNonCovidPatient.text)),
                                int.parse(_controllerCardiologyPatient.text),
                                state.data.other_division_count,
                                int.parse(_controllerTelemetryPatient.text),
                                int.parse(_controllerOncologyPatient.text),
                                int.parse(_controllerERPatient.text),
                                int.parse(_controllerOrthopedicPatient.text),
                                int.parse(_controllerOBPatient.text),
                                int.parse(_controllerOBERPatient.text),
                                state.data.num_of_new_covid_cases,
                                state.data.num_of_active_cases,
                                state.data.num_of_covid_recovery,
                                state.data.num_of_covid_deaths,
                                int.parse(_controllerCovidPatient.text),
                                state.data.percent_of_icu_bed_used,
                                state.data.percent_of_isolation_bed_used,
                                state.data.percent_of_wards_bed_used,
                                state.data.total_icu_bed,
                                state.data.total_isolation_bed,
                                state.data.total_wards_bed,
                                state.data.total_num_of_beds,
                              )));
                        },
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
        } else {
          return const Text('Something is Wrong');
        }
      },
    );
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
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardInitial) {
          return const CircularProgressIndicator(
            color: Colors.orange,
          );
        }
        if (state is DataLoaded) {
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
                              CustomTextFormField(
                                  'Total Number of Beds',
                                  _controllerTotalBed
                                    ..text = state.data.total_num_of_beds
                                        .toString()),
//==============================ICU BEDS=======================================================
                              const SizedBox(
                                height: 15,
                              ),

                              CustomTextFormField(
                                  'Total Number of ICU Beds',
                                  _controllerICUBed
                                    ..text =
                                        state.data.total_icu_bed.toString()),
//====================================ISOLATION BEDS=======================================================

                              const SizedBox(
                                height: 15,
                              ),

                              CustomTextFormField(
                                  'Total Number of Isolation Beds',
                                  _controllerIsolationBed
                                    ..text = state.data.total_isolation_bed
                                        .toString()),
//====================================WARD BEDS=======================================================

                              const SizedBox(
                                height: 15,
                              ),

                              CustomTextFormField(
                                  'Total Number of Ward Beds',
                                  _controllerWardBed
                                    ..text =
                                        state.data.total_wards_bed.toString()),
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
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil<void>(
                            HomePage.route(),
                            (route) => false,
                          );
                        },
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
                        onPressed: () {
                          context.read<DashboardBloc>().add(UpdateData(DataApi(
                                state.data.id,
                                state.data.num_of_current_patient,
                                state.data.num_of_discharge,
                                state.data.num_of_admits,
                                state.data.num_of_total_patient,
                                state.data.cardiology_patient_count,
                                state.data.other_division_count,
                                state.data.telemetry_patient_count,
                                state.data.oncology_patient_count,
                                state.data.emergency_patient_count,
                                state.data.orthopedic_patient_count,
                                state.data.ob_patient_count,
                                state.data.ob_er_patient_count,
                                state.data.num_of_new_covid_cases,
                                state.data.num_of_active_cases,
                                state.data.num_of_covid_recovery,
                                state.data.num_of_covid_deaths,
                                state.data.num_of_total_covid_cases,
                                state.data.percent_of_icu_bed_used,
                                state.data.percent_of_isolation_bed_used,
                                state.data.percent_of_wards_bed_used,
                                int.parse(_controllerICUBed.text),
                                int.parse(_controllerIsolationBed.text),
                                int.parse(_controllerWardBed.text),
                                int.parse(_controllerTotalBed.text),
                              )));
                        },
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
        } else if (state is DataMessage) {
          return const Text('');
        } else {
          return const Text('Something is Wrong');
        }
      },
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  String text;
  TextEditingController _controllers;
  CustomTextFormField(this.text, this._controllers);

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
