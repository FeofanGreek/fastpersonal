import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';



class launchScreen extends StatefulWidget {
  @override
  launchScreenState createState() => launchScreenState();
}

class launchScreenState extends State<launchScreen> {

  //const twentyMillis = const Duration(seconds:2);
  //               new Timer(twentyMillis, () => Navigator.pushReplacement (context,
  //                   MaterialPageRoute(builder: (context) => CameraScreen())));



  @override
  void initState() {
    super.initState();
    const twentyMillis = const Duration(seconds:3);
                   new Timer(twentyMillis, () => Navigator.pushReplacement (context,
                       MaterialPageRoute(builder: (context) => PlayWithComputer())));
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body:Container(
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
            children: <Widget>[
              Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width,
                    ),

                    Container(
                      height: 153, width: 153,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logo.png"),
                            fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                        ),
                      ),),
                    Text('Логистика для бизнеса', style: TextStyle(fontSize: 22,)),
                  ]),

            ]),
      ),

    );
  }

}

