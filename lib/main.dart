import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'g_nav_bar.dart';
import 'dart:async';

void main() => runApp(new myapp());

class  myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new design_one()
    );
  }
}


class design_one extends StatefulWidget {
  @override
  _design_oneState createState() => _design_oneState();
}

class _design_oneState extends State<design_one> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 5),()=>
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => GNavBar())),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
              color: Colors.grey[400],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart,size:100,color: Colors.black87,),
                SizedBox(height: 25),
                Text("Shadamata Shopping",style: TextStyle(fontSize: 30,color: Colors.black87)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SpinKitHourGlass(
                  color: Colors.black87,
                  size: 50,
                ),
                SizedBox(height: 25),
                Text(
                  "Loading...",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 25),
              ],
            )
          ],
        ),
      );
  }
}

