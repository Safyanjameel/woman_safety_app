import 'package:flutter/material.dart';

class BusStationCard extends StatelessWidget {
  final Function? onMapFuntion;

  const BusStationCard({super.key,this.onMapFuntion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: [
          InkWell(
             onTap: () {
              onMapFuntion!('Bus stop near me');
            },
            child: Card(
              elevation: 4,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.14,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/busL.jpeg',
                    fit: BoxFit.cover,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
          const Text('Bus Station')
        ],
      ),
    );
  }
}
