
import 'package:flutter/material.dart';
import 'package:woman_safety_app/utils/quotes.dart';

class CustomAppbar extends StatelessWidget {
  //const CustomAppbar({Key? key}) : super(key: key);
  VoidCallback? ontap;
  int? quotesIndex;
  CustomAppbar({
     this.ontap,
     this.quotesIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Text(
        sweetSaying[quotesIndex!],
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
