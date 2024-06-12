import 'package:flutter/material.dart';
import 'package:woman_safety_app/widget/home_widget/emergancies/ambulance_emergancy.dart';
import 'package:woman_safety_app/widget/home_widget/emergancies/army_emergancy.dart';
import 'package:woman_safety_app/widget/home_widget/emergancies/firebrigade_emergancy.dart';
import 'package:woman_safety_app/widget/home_widget/emergancies/police_emergancy.dart';

class Emergancy extends StatelessWidget {
  const Emergancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          PoliceEmergancy(),
          ArmyEmergancy(),
          FirebrigadeEmergancy(),
          AmbulanceEmergancy(),
        ],
      ),
    );
  }
}
