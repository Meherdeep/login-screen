import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  
  @override
  void initState() { 
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800)
    );
    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.fastLinearToSlowEaseIn);
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(image: AssetImage("assets/agora_bg2.png"),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/agora_logo.png"),
              height: _iconAnimation.value * 100,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.blue,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 20,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.blueAccent, width: 2)
                      ), 
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40),
                    child: TextFormField(
                      decoration: InputDecoration(
                      labelText: "Enter Channel Name",
                      hintText: "test",
                      ),
                    keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top:60)),
              MaterialButton(
                color: Colors.blue[600],
                textColor: Colors.white,
                onPressed: () => {},//Enter the function to be called over here when the Join button is pressed
                child: Text("Join"),
                )
            ], 
          ),
        ],
      ),
    );
  }
}