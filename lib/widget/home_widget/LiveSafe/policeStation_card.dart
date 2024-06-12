import 'package:flutter/material.dart';

class PoliceStationCard extends StatelessWidget {
  final Function? onMapFuntion;
  const PoliceStationCard({super.key, this.onMapFuntion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFuntion!('police station near me');
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.078,
                width: MediaQuery.of(context).size.width * 0.14,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/policeL.png',
                    fit: BoxFit.cover,
                    height: 25,
                  ),
                ),
              ),
            ),
          ),
          const Text('Police Station')
        ],
      ),
    );
  }
}
