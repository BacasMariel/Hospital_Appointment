// ignore_for_file: deprecated_member_use, unnecessary_new, prefer_const_literals_to_create_immutables, unnecessary_const, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/authentication/authentication.dart';
import 'package:hospital_app/dashboard/bloc/dashboard_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../screens/appointment.dart';
import '../../screens/utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<TotalPatient> _chartData;
  late List<PatientGender>? _circleData;
  // late List<TotalBedUsed>? _circleTotalBed;
  late List<WithCovid>? _withCovidData;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _circleData = getChart();
    // _withCovidData = totalWithCovid();
    _tooltipBehavior = TooltipBehavior(enable: true);
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(
          child: Menu(),
        ),
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Dashboard'),
            elevation: 5),
        body: Center(
          child: BlocListener<DashboardBloc, DashboardState>(
            listener: (context, state) {
              if (state is DataError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              } else if (state is DataMessage) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                if (state is DashboardInitial) {
                  return const CircularProgressIndicator(
                    color: Colors.orange,
                  );
                }
                if (state is DataLoaded) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                            Colors.white,
                            Colors.blue.shade200,
                            Colors.blue,
                            Colors.white
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //TOTAL NO. OF PATIENTS
                              Card(
                                elevation: 5,
                                //margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    height: 190,
                                    width: 140,
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data.num_of_total_patient
                                              .toString(),
                                          style: const TextStyle(fontSize: 32),
                                        ),
                                        const Text(
                                          'Total Number of Patients',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.blue),
                                        )
                                      ],
                                    )),
                              ),
                              
                              //No. of Patients per division
                              Card(
                                elevation: 5,
                                //margin: const EdgeInsets.fromLTRB(10, 20, 35, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    height: 190,
                                    width: 140,
                                    margin: const EdgeInsets.all(10),
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Number of Patients per Division',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5,),
                                          Text(
                                            'Cardiology: ${state.data.cardiology_patient_count}',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            'Telemetry: ${state.data.telemetry_patient_count}',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            'Oncology: ${state.data.oncology_patient_count}',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            'Emergency: ${state.data.emergency_patient_count}',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            'Orthopedic: ${state.data.orthopedic_patient_count}',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            'Others: ${state.data.other_division_count}',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              
                            ],
                          ),
                          const SizedBox(
                            height: 0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //TOTAL NO OF PATIENTS WITH COVID
                              Card(
                                elevation: 5,
                                //margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    height: 190,
                                    width: 140,
                                    margin: const EdgeInsets.all(10),
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:<Widget> [
                                          Text(
                                            state.data.num_of_total_covid_cases
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 32),
                                          ),
                                          const Text(
                                            'Total Number of Patients with Covid',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.redAccent),
                                          ),
                                          const SizedBox(height: 0,),
                                          //Sample chart
                                          SfCircularChart(
                                            margin: const EdgeInsets.all(0),
                                            annotations: <CircularChartAnnotation>[
                                              CircularChartAnnotation(
                                                  height: '75%', // Setting height and width for the circular chart annotation
                                                  width: '75%',
                                                  widget: Container(
                                                      child: PhysicalModel(
                                                          child: Container(),
                                                          shape: BoxShape.circle,
                                                          elevation: 10,
                                                          shadowColor: Colors.black,
                                                          color: const Color.fromRGBO(230, 230, 230, 1)))),
                                              // CircularChartAnnotation(
                                              //     widget: Container(
                                              //         child: const Text('62%',
                                              //             style: TextStyle(
                                              //                 color: Color.fromRGBO(0, 0, 0, 0.5),
                                              //                 fontSize: 25))))
                                            ],
                                            centerY: '90',
                                            tooltipBehavior: _tooltipBehavior,
                                            legend: Legend(
                                              itemPadding: 5,
                                              iconHeight: 15,
                                              position: LegendPosition.bottom,
                                              isVisible: true,
                                              isResponsive:true,
                                              overflowMode: LegendItemOverflowMode.wrap
                                              ),
                                            series: <CircularSeries>[
                                              DoughnutSeries<WithCovid, String>(
                                                  dataSource: totalWithCovid(
                                                      state.data
                                                          .num_of_covid_deaths,
                                                      state.data
                                                          .num_of_covid_recovery,
                                                      state.data
                                                          .num_of_active_cases,
                                                      state.data
                                                          .num_of_new_covid_cases),
                                                  xValueMapper:
                                                      (WithCovid data, _) =>
                                                          data.description,
                                                  yValueMapper:
                                                      (WithCovid data, _) =>
                                                          data.cases,
                                                  dataLabelSettings:
                                                      const DataLabelSettings(
                                                          isVisible: true),
                                                  radius: '100%',
                                                  innerRadius: '35%',
                                                  enableTooltip: true)
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              //TOTAL NO OF PATIENTS WITHOUT COVID
                              Card(
                                elevation: 5,
                                //margin: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    height: 190,
                                    width: 140,
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (state.data.num_of_total_patient -
                                                  state.data
                                                      .num_of_total_covid_cases)
                                              .toString(),
                                          style: const TextStyle(fontSize: 32),
                                        ),
                                        const Text(
                                          'Total Number of Patients without Covid',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.blue),
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),

                          //Graph
                          Card(
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SfCartesianChart(
                              title: ChartTitle(text: 'Covid and Non Covid Patients'),
                              legend: Legend(
                                position: LegendPosition.bottom,
                                isResponsive: true,
                                isVisible: true),
                              primaryXAxis: CategoryAxis(
                                  // Edge labels will be shifted
                                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                                  crossesAt: 0),
                              primaryYAxis: CategoryAxis(crossesAt: 0,
                                interval: 10,),
                              series: <ChartSeries<TotalPatient, String>>[
                                SplineSeries<TotalPatient, String>(
                                    name: 'Non Covid Patient',
                                    dataSource: _chartData,
                                    xValueMapper: (TotalPatient patientData, _) =>
                                        patientData.month,
                                    yValueMapper: (TotalPatient patientData, _) =>
                                        patientData.nonCovidPatient,
                                    // ignore: prefer_const_constructors
                                    markerSettings:
                                        const MarkerSettings(isVisible: true)),
                                SplineSeries<TotalPatient, String>(
                                  name: 'Covid Patient',
                                    dataSource: _chartData,
                                    xValueMapper: (TotalPatient patientData, _) =>
                                        patientData.month,
                                    yValueMapper: (TotalPatient patientData, _) =>
                                        patientData.covidPatient,
                                    // ignore: prefer_const_constructors
                                    markerSettings:
                                        const MarkerSettings(isVisible: true)),
                                  
                              ],
                            ),
                          ),

                          //Total Number of Beds
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 5,
                                //margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    height: 120,
                                    width: 150,
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data.total_num_of_beds
                                              .toString(),
                                          style: const TextStyle(fontSize: 32),
                                        ),
                                        const Text(
                                          'Total Number of Beds',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.blue),
                                        ),
                                      ],
                                    )),
                              ),

                              //Total Number of ICU beds
                              Card(
                                elevation: 5,
                                //margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    height: 120,
                                    width: 150,
                                    margin: const EdgeInsets.all(10),
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.data.total_icu_bed.toString(),
                                            style:
                                                const TextStyle(fontSize: 32),
                                          ),
                                          const Text(
                                            'Total Number of ICU beds',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blue),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          LinearPercentIndicator(
                                            animation: true,
                                            animationDuration: 1000,
                                            lineHeight: 10,
                                            percent: (0.01 *
                                                state.data
                                                    .percent_of_icu_bed_used),
                                            barRadius:
                                                const Radius.circular(10),
                                            progressColor: Colors.blue,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 0, 5),
                                            child: Text(
                                                '${state.data.percent_of_icu_bed_used}% occupied'),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 0,
                          ),

                          //Total Number of Isolation Beds
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 5,
                                //margin: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    height: 130,
                                    width: 150,
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Text(
                                          state.data.total_isolation_bed
                                              .toString(),
                                          style: const TextStyle(fontSize: 32),
                                        ),
                                        const Text(
                                          'Total Number of Isolation Beds',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.redAccent),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        LinearPercentIndicator(
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: 10,
                                          percent: (0.01 *
                                              state.data
                                                  .percent_of_isolation_bed_used),
                                          barRadius: const Radius.circular(10),
                                          progressColor: Colors.red,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 5),
                                          child: Text(
                                              '${state.data.percent_of_isolation_bed_used}% Occupied'),
                                        )
                                      ],
                                    )),
                              ),

                              //Total Number of Ward Beds
                              Card(
                                elevation: 5,
                                //margin: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    height: 130,
                                    width: 150,
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data.total_wards_bed.toString(),
                                          style: const TextStyle(fontSize: 32),
                                        ),
                                        const Text(
                                          'Total Number of Ward Beds',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.blue),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        LinearPercentIndicator(
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: 10,
                                          percent: (0.01 *
                                              state.data
                                                  .percent_of_wards_bed_used),
                                          barRadius: const Radius.circular(10),
                                          progressColor: Colors.green,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 5),
                                          child: Text(
                                              '${state.data.percent_of_wards_bed_used}% Occupied'),
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),

                          //Circular Chart
                          Card(
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SfCircularChart(
                              annotations: <CircularChartAnnotation>[
                                CircularChartAnnotation(
                                    height: '80%', // Setting height and width for the circular chart annotation
                                    width: '80%',
                                    widget: Container(
                                        child: PhysicalModel(
                                            child: Container(),
                                            shape: BoxShape.circle,
                                            elevation: 10,
                                            shadowColor: Colors.black,
                                            color: const Color.fromRGBO(230, 230, 230, 1)))),
                                // CircularChartAnnotation(
                                //     widget: Container(
                                //         child: const Text('62%',
                                //             style: TextStyle(
                                //                 color: Color.fromRGBO(0, 0, 0, 0.5),
                                //                 fontSize: 25))))
                              ],
                              title: ChartTitle(text: 'Bed Percentage'),
                              tooltipBehavior: _tooltipBehavior,
                              legend: Legend(
                                position: LegendPosition.bottom,
                                isVisible: true,
                                isResponsive:true,
                                overflowMode: LegendItemOverflowMode.wrap),
                              series: <CircularSeries>[
                                DoughnutSeries<TotalBed, String>(
                                    dataSource: getTotalChart(
                                        state.data.total_icu_bed,
                                        state.data.total_wards_bed,
                                        state.data.total_isolation_bed),
                                    xValueMapper: (TotalBed data, _) =>
                                        data.bed_type,
                                    yValueMapper: (TotalBed data, _) =>
                                        data.total,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: true),
                                    radius: '100%',
                                    innerRadius: '40%',
                                    enableTooltip: true)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Text('Something is Wrong');
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  List<TotalPatient> getChartData() {
    final List<TotalPatient> chartData = [
      TotalPatient('January',40, 30),
      TotalPatient('February', 60, 10),
      TotalPatient('March', 24, 25),
      TotalPatient('April', 18, 19),
      TotalPatient('May', 30, 29),
    ];
    return chartData;
  }

  List<PatientGender> getChart() {
    final List<PatientGender> circleData = [
      PatientGender('Female', 30),
      PatientGender('Male', 50),
      PatientGender('Others', 5),
    ];
    return circleData;
  }

  List<TotalBed> getTotalChart(icu, wards, isolation) {
    final List<TotalBed> circleData = [
      TotalBed('ICU', icu),
      TotalBed('Wards', wards),
      TotalBed('Isolation', isolation)
    ];

    return circleData;
  }

  List<WithCovid> totalWithCovid(deaths, recovery, active, newCases) {
    final List<WithCovid> withCovidData = [
      WithCovid('Deaths', deaths),
      WithCovid('Recoveries', recovery),
      WithCovid('Active Cases', active),
      WithCovid('New Cases', newCases),
    ];
    return withCovidData;
  }
}

class TotalPatient {
  TotalPatient(this.month, this.covidPatient, this.nonCovidPatient);
  final String month;
  final double covidPatient;
  final double nonCovidPatient;
}

class PatientGender {
  PatientGender(this.gender, this.total);
  final String gender;
  final int total;
}

class TotalBed {
  TotalBed(this.bed_type, this.total);
  final String bed_type;
  final int total;
}

class WithCovid {
  WithCovid(this.description, this.cases);
  final String description;
  final int cases;
}

//MENU
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.blue, Color(0xFF64B5F6)]),
                ),
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Material(
                      elevation: 10,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(60.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/profile.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Admin',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ))),
            CustomListTile(Icons.dashboard, 'Dashboard', () {
              Navigator.of(context).pop();
            }),
            CustomListTile(Icons.build, 'Utilities', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Utility()));
            }),
            CustomListTile(Icons.date_range_sharp, 'Appoinment', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Appointment()));
            }),
          ],
        );
      },
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onClicked;

  CustomListTile(this.icon, this.text, this.onClicked);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          splashColor: Colors.blue,
          onTap: onClicked,
          child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          text,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
