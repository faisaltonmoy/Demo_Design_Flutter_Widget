import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:screen/screen.dart';

int ind = 0;
int leftTextColor = 0;
int leftBackgroundColor = 0;
double brightness = 0.3;
final List<Color> colorPallete = <Color>[
  Colors.grey[400], Colors.blueGrey[500], Colors.brown[400], Colors.amber,
  Colors.teal[300], Colors.pink[300], Colors.purple[200], Colors.lime[600],
];

class GNavBar extends StatefulWidget {
  @override
  _GNavBarState createState() => _GNavBarState();
}

class _GNavBarState extends State<GNavBar> {

  int s_index = 0;
  FSBStatus dw_status;
  Icon ic = Icon(Icons.menu);

  static List<Widget> _wiz = <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.home),
        Text('Home'),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.shopping_cart),
        Text('Cart'),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.message),
        Text('Inbox'),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.settings),
        Text('Settings'),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: colorPallete[leftTextColor],
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1)
              )]
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                duration: Duration(milliseconds: 1000),
                tabBackgroundColor: Colors.grey[700],
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.shopping_cart,
                    text: 'Cart',
                  ),
                  GButton(
                    icon: Icons.message,
                    text: 'Inbox',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ],
                selectedIndex: s_index,
                onTabChange: (index)
                {
                  setState(() {
                    s_index = index;
                  });
                }),
          ),
        ),
      ),
      body: Stack(
        children: [
          FoldableSidebarBuilder(
            drawer: CD(closeDrawer: (){
              setState(() {
                dw_status = FSBStatus.FSB_CLOSE;
              });
            },),
            screenContents: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 21),
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  color: colorPallete[leftTextColor],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 10),
                      FloatingActionButton(
                        backgroundColor: Colors.grey[700],
                        child: ic,
                        onPressed: (){
                          setState(() {
                            if(dw_status == FSBStatus.FSB_OPEN)
                              {
                                dw_status = FSBStatus.FSB_CLOSE;
                                ic = Icon(Icons.menu,color: Colors.white);
                              }
                            else
                              {
                                dw_status = FSBStatus.FSB_OPEN;
                                ic = Icon(Icons.close,color: Colors.white);
                              }
                          });
                        },
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.7,
                          child: ScaleAnimatedTextKit(
                            isRepeatingAnimation: true,
                            duration: Duration(seconds: 4),
                            text: ["Shadamata Shopping"],
                            textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                            textAlign: TextAlign.center,
                            alignment: AlignmentDirectional.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Slider(
                      label: brightness.abs().toString(),
                      activeColor: Colors.grey[600],
                      inactiveColor: Colors.grey[400],
                      min: 0.0,
                      max: 1.0,
                      //divisions: 10,
                      value: brightness,
                      onChanged: (value) {
                        Screen.setBrightness(brightness);
                        setState((){ brightness = value; });
                      }
                    ),
                    SizedBox(height: 25),
                    SliderTheme(
                        child: Slider(
                          label: "Header & Footer Color",
                          activeColor: colorPallete[leftTextColor],
                          inactiveColor: Colors.grey[400],
                          min: 0,
                          max: colorPallete.length.toDouble()-1.0,
                          divisions: colorPallete.length,
                          value: leftTextColor.toDouble(),
                          onChanged: (value) => setState((){ leftTextColor = value.toInt();}),
                        ),
                        data: SliderThemeData(
                            valueIndicatorTextStyle: TextStyle(color: Colors.white70)
                        )
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: _wiz.elementAt(s_index),
                ),
              ],
            ),
            status: dw_status,
          ),
        ],
      ),
    );
  }
}

class CD extends StatelessWidget {

  final Function closeDrawer;

  const CD ({Key key , this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPallete[leftTextColor],
      width:  MediaQuery.of(context).size.width*0.6,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_circle,size: 100),
                SizedBox(height: 20),
                Text("Faisal Ahmmed Tonmoy",style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
          Divider(height: 2.5,color: Colors.white),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("Your Bio"),
          ),
          Divider(height: 2.5,color: Colors.white),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Balance"),
          ),
          Divider(height: 2.5,color: Colors.white),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
          ),Divider(height: 2.5,color: Colors.white),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text("Help"),
          ),Divider(height: 2.5,color: Colors.white),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sign out"),
          ),
          Divider(height: 2.5,color: Colors.white),
        ],
      ),
    );
  }
}

