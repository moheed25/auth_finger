import 'package:auth_finger/reusableWidgets/reusable_widgets.dart';
import 'package:auth_finger/screens/homeScreen.dart';
import 'package:auth_finger/screens/loginScreen.dart';
import 'package:auth_finger/sharedPreferences/finger_data.dart';
import 'package:flutter/material.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5),() async {

      bool? check = false;
      check = await SharedPreferencesClass.get_finger();
      print('check is ${check}');

      String condition = check.toString();


      if(condition=='true')
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
          homeScreen()
          ));
        }
      else
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              loginScreen()
          ));
        }
    });
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withBlue(16),
      body: Padding(
        padding:  EdgeInsets.only(left: width*0.2,right: width*0.2,top: height*0.5),
        child: Column(
          children: [
            text("SplashScreen!", Colors.white, FontWeight.w800, 30)
          ],
        ),
      ),
    );
  }
}
