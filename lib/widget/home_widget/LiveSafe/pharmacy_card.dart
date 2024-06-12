import 'package:flutter/material.dart';

class PharmacyCard extends StatelessWidget {
  final Function? onMapFuntion;

  const PharmacyCard({super.key,this.onMapFuntion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: [
          InkWell(
             onTap: () {
              onMapFuntion!('Pharmacies near me');
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
                    'assets/pharmacyL.png',
                    fit: BoxFit.fill,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
          const Text('Pharmacy')
        ],
      ),
    );
  }
}
