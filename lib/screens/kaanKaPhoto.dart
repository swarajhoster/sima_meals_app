import 'package:flutter/material.dart';

class KaanKaPhoto extends StatelessWidget {
  static String routeName = "/p";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Babu ka photo"),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            child: Image.network(
                "https://res.cloudinary.com/swaraj-cloud/image/upload/v1656498761/kaan/kkaan_qxwyba.jpg"),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            Navigator.of(context).pushNamed("/kaan");
          }, child: Text("Open Karo"))
        ],
      ),
    );
  }
}
