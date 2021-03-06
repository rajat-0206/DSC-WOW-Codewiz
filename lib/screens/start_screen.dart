import 'package:flutter/material.dart';
import 'package:gst_sys/screens/regeister_form.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'main_menu.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  bool checkValue=false;
  String uid;
  void checkkey() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      checkValue = prefs.containsKey('uid');
      if(checkValue==true)
      {
          uid=prefs.getString('uid');
          
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkkey();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.orange,
                Colors.orange[200],
                Colors.white,
                Colors.white,
                Colors.green[400],
                Colors.green[700],
              ]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(45.0),
              child: Container(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/irs.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Text('GST SYSTEM',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Alfa Slab One')),
            SizedBox(
              height: 50.0,
            ),
            MaterialButton(
              color: Colors.brown[300],
              minWidth: MediaQuery.of(context).size.width * 0.7,
              height: 60,
              onPressed: () {
                 if(checkValue==false)
                 {Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: LoginPage(),
                      ctx: context),
                );}
                else{
                  Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: MainMenu(uid:uid),
                      ctx: context),
                );
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              color: Colors.brown[300],
              minWidth: MediaQuery.of(context).size.width * 0.7,
              height: 60,
              onPressed: () {
                 Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: RegisterPage(),
                      ctx: context),
                );
               },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Register",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
