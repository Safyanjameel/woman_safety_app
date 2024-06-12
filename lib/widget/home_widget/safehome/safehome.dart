import 'package:flutter/material.dart';

class SafeHome extends StatelessWidget {
  const SafeHome({Key? key}) : super(key: key);

  showModelSafehome(BuildContext context) {
    showModalBottomSheet(
      context: (context),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height*1,
          decoration: const BoxDecoration( 
            color: Colors.white,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModelSafehome(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    ListTile(
                      title: Text('Send Location'),
                      subtitle: Text('Shared Location'),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/rout.png'))
            ],
          ),
        ),
      ),
    );
  }
}
