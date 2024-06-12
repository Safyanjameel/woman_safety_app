import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woman_safety_app/widget/home_widget/LiveSafe/busStation_card.dart';
import 'package:woman_safety_app/widget/home_widget/LiveSafe/firebrigade.dart';
import 'package:woman_safety_app/widget/home_widget/LiveSafe/hospital_card.dart';
import 'package:woman_safety_app/widget/home_widget/LiveSafe/pharmacy_card.dart';
import 'package:woman_safety_app/widget/home_widget/LiveSafe/policeStation_card.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({super.key});

  static Future<void> onpenMap(String location) async {
    String googleUrl = "https://www.google.com/maps/search/$location";
    final Uri _url = Uri.parse(googleUrl);

    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong! call emergancy number");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const [
          PoliceStationCard(
            onMapFuntion: onpenMap,
          ),
          HospitalCard(
            onMapFuntion: onpenMap,
          ),
          PharmacyCard(
            onMapFuntion: onpenMap,
          ),
          BusStationCard(
            onMapFuntion: onpenMap,
          ),
          Firebrigade(
            onMapFuntion: onpenMap,
          ),
        ],
      ),
    );
  }
}
