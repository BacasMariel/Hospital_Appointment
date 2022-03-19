// ignore_for_file: deprecated_member_use, unnecessary_new, prefer_const_literals_to_create_immutables, unnecessary_const, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'appointment.dart';
import 'firstPage.dart';
import 'utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<TotalPatient> _chartData;
  late List<PatientGender> _circleData;
  late List<WithCovid> _withCovidData;
  TooltipBehavior? _tooltipBehavior;


  @override
  void initState() {
    _chartData = getChartData();
    _circleData = getChart();
    _withCovidData = totalWithCovid();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
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
        body: SingleChildScrollView(
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
                ])
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '84',
                                style: TextStyle(fontSize: 32),
                              ),
                              const Text(
                                'Total Number of Patients',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
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
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Number of Patients per Division',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'Cardiology: 5',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const Text(
                                  'Telemetry: 4',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const Text(
                                  'Oncology: 9',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const Text(
                                  'Emergency: 7',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const Text(
                                  'Orthopedic: 3',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const Text(
                                  'Others: 6',
                                  style: TextStyle(fontSize: 12),
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
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '40',
                                  style: TextStyle(fontSize: 32),
                                ),
                                const Text(
                                  'Total Number of Patients with Covid',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.redAccent),
                                ),
                                //SizedBox(height: 0,),
                                //Sample chart
                                SfCircularChart(
                                  centerY: '50',
                                  tooltipBehavior: _tooltipBehavior,
                                  // legend: Legend(
                                  //   position: LegendPosition.bottom,
                                  //   isVisible: true,
                                  //   isResponsive:true,
                                  //   overflowMode: LegendItemOverflowMode.wrap),
                                  series: <CircularSeries>[
                                    DoughnutSeries<WithCovid, String>(
                                        dataSource: _withCovidData,
                                        xValueMapper: (WithCovid data, _) =>
                                            data.death,
                                        yValueMapper: (WithCovid data, _) =>
                                            data.cases,
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '44',
                                style: TextStyle(fontSize: 32),
                              ),
                              const Text(
                                'Total Number of Patients without Covid',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
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
                    title: ChartTitle(text: 'Title'),
                    primaryXAxis: NumericAxis(
                        // Edge labels will be shifted
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        crossesAt: 0),
                    primaryYAxis: NumericAxis(crossesAt: 0),
                    series: <ChartSeries>[
                      SplineSeries<TotalPatient, double>(
                          dataSource: _chartData,
                          xValueMapper: (TotalPatient sales, _) => sales.year,
                          yValueMapper: (TotalPatient sales, _) => sales.sales,
                          // ignore: prefer_const_constructors
                          markerSettings: MarkerSettings(isVisible: true))
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '45',
                                style: TextStyle(fontSize: 32),
                              ),
                              const Text(
                                'Total Number of Beds',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
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
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '15',
                                  style: TextStyle(fontSize: 32),
                                ),
                                const Text(
                                  'Total Number of ICU beds',
                                  style:
                                      TextStyle(fontSize: 14, color: Colors.blue),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 1000,
                                  lineHeight: 10,
                                  percent: 0.4,
                                  barRadius: const Radius.circular(10),
                                  progressColor: Colors.blue,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                                  child: Text('40% na occupy ni sya?'),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ignore: prefer_const_constructors
                              Text(
                                '20',
                                style: TextStyle(fontSize: 32),
                              ),
                              const Text(
                                'Total Number of Isolation Beds',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.redAccent),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              LinearPercentIndicator(
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 10,
                                percent: 0.7,
                                barRadius: const Radius.circular(10),
                                progressColor: Colors.red,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                                child: Text('70% na occupy ni sya?'),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '20',
                                style: TextStyle(fontSize: 32),
                              ),
                              const Text(
                                'Total Number of Ward Beds',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              LinearPercentIndicator(
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 10,
                                percent: 0.8,
                                barRadius: const Radius.circular(10),
                                progressColor: Colors.green,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                                child: Text('80% na occupy ni sya?'),
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
                    title: ChartTitle(text: 'Title'),
                    tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries>[
                      DoughnutSeries<PatientGender, String>(
                          dataSource: _circleData,
                          xValueMapper: (PatientGender data, _) => data.gender,
                          yValueMapper: (PatientGender data, _) => data.total,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                          enableTooltip: true)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  

  List<TotalPatient> getChartData() {
    final List<TotalPatient> chartData = [
      TotalPatient(2017, 25),
      TotalPatient(2018, 12),
      TotalPatient(2019, 24),
      TotalPatient(2020, 18),
      TotalPatient(2021, 30),
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

  List<WithCovid> totalWithCovid() {
    final List<WithCovid> withCovidData = [
      WithCovid('Deaths', 30),
      WithCovid('Recoveries', 50),
      WithCovid('Active Cases', 5),
      WithCovid('New Cases', 5),
    ];
    return withCovidData;
  }
}

class TotalPatient {
  TotalPatient(this.year, this.sales);
  final double year;
  final double sales;
}

class PatientGender {
  PatientGender(this.gender, this.total);
  final String gender;
  final int total;
}

class WithCovid{
  WithCovid(this.death, this.cases);
  final String death;
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
    return ListView(
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                  Colors.blue, 
                  Color(0xFF64B5F6)]),
            ),
            child: Container(
              child: Column(
                children: <Widget> [
                  Material(
                    elevation: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/profile.png', width: 70,height: 70,),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Admin', style: TextStyle(color: Colors.white, fontSize: 25),)
                ],
              ))),
        CustomListTile(Icons.dashboard, 'Dashboard', () {
          Navigator.of(context).pop();
        }),
        CustomListTile(Icons.build, 'Utilities', () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Utility()));
        }),
        CustomListTile(Icons.date_range_sharp, 'Appoinment', () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Appointment()));
        }),
        CustomListTile(Icons.logout, 'Log Out', () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FirstPage()));})
      ],
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
