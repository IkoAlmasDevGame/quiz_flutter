import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quiz_flutter/Level/Level_I.dart';
import 'package:quiz_flutter/Level/Level_II.dart';
import 'package:quiz_flutter/Level/Level_III.dart';
import 'package:quiz_flutter/Level/Level_IV.dart';
import 'package:quiz_flutter/Level/Level_IX.dart';
import 'package:quiz_flutter/Level/Level_V.dart';
import 'package:quiz_flutter/Level/Level_VI.dart';
import 'package:quiz_flutter/Level/Level_VII.dart';
import 'package:quiz_flutter/Level/Level_VIII.dart';
import 'package:quiz_flutter/Level/Level_X.dart';
import 'package:quiz_flutter/Level/Level_XII.dart';
import 'package:quiz_flutter/Level/Level_XIII.dart';
import 'package:quiz_flutter/Level/Level_XIV.dart';
import 'package:quiz_flutter/Level/Level_XV.dart';
import 'package:quiz_flutter/Level/Level_XVI.dart';
import 'package:quiz_flutter/Level/Level_XVII.dart';
import 'package:quiz_flutter/Level/Level_XVIII.dart';

import 'Level/Level_XI.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController _controller = CarouselController();
  int _current = 0;

  List<String> TextScreen = ["Quiz Flutter", "", "", "", "Remake Quiz Flutter", "By IndoDevGame"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Quiz',
          style: TextStyle(fontSize: 21, fontFamily: "Times New Romans", fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10),
                child: Text('News', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "ARIAL"),
                textAlign: TextAlign.left,),
              ),
              Padding(padding: EdgeInsets.only(top: 5, left: 10),
                child: Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3.3, color: Colors.black26, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: Builder(
                    builder: (BuildContext context)=>
                      CarouselSlider(
                        items: TextScreen.map((i){
                          return Text('\n\n$i',
                            style: TextStyle(fontFamily: "Times New Romans", fontSize: 18, fontWeight: FontWeight.bold),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason){
                            setState(() {
                              _current = index;
                            });
                          }
                        ),
                      ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: TextScreen.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              Padding(padding: EdgeInsets.only(top:40, left: 30),
                child: Text('Pilih Level dibawah ini :', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10, left: 20),
                child: Container(
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 2, color: Colors.black, style: BorderStyle.solid),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blueAccent, Colors.black38],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 2.0)),
                      FloatingActionButton(
                        child: Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        onPressed: (){
                          var LevelI = Level_I_();
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelI));
                        },
                        backgroundColor: Colors.transparent,
                        splashColor: Colors.white,
                      ),
                      FloatingActionButton(
                        child: Text('2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        onPressed: (){
                          var LevelII = Level_II_();
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelII));
                        },
                        backgroundColor: Colors.transparent,
                        splashColor: Colors.white,
                      ),
                      FloatingActionButton(
                        child: Text('3', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        onPressed: (){
                          var LevelIII = Level_III_();
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelIII));
                        },
                        backgroundColor: Colors.transparent,
                        splashColor: Colors.white,
                      ),
                      FloatingActionButton(
                        child: Text('4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        onPressed: (){
                          var LevelIV = Level_IV_();
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelIV));
                        },
                        backgroundColor: Colors.transparent,
                        splashColor: Colors.white,
                      ),
                      FloatingActionButton(
                        child: Text('5', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        onPressed: (){
                          var LevelV = Level_V_();
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelV));
                        },
                        backgroundColor: Colors.transparent,
                        splashColor: Colors.white,
                      ),
                      FloatingActionButton(
                        child: Text('6', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        onPressed: (){
                          var LevelVI = Level_VI_();
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelVI));
                        },
                        backgroundColor: Colors.transparent,
                        splashColor: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 2, top: 4)),
                          FloatingActionButton(
                            child: Text('7', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelVII = Level_VII_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelVII));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('8', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelVIII = Level_VIII_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelVIII));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('9', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelIX = Level_IX_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelIX));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('10', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelX = Level_X_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelX));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('11', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelXI = Level_XI_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelXI));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelXII = Level_XII_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelXII));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 2, top: 4)),
                          FloatingActionButton(
                            child: Text('13', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelXIII = Level_XIII_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelXIII));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('14', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelXIV = Level_XIV_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelXIV));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('15', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelXV = Level_XV_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelXV));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('16', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelXVI = Level_XVI_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelXVI));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('17', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelXVII = Level_XVII_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelXVII));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                          FloatingActionButton(
                            child: Text('18', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            onPressed: (){
                              var LevelXVIII = Level_XVIII_();
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LevelXVIII));
                            },
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 80, left: 18),
                child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Selamat Datang Di Game Quiz Flutter Remake',
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    speed: Duration(milliseconds: 100),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  totalRepeatCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 600)),
               ListTile(
                title: Text('Exit Game', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: Icon(Icons.exit_to_app),
                trailing: Icon(Icons.arrow_right),
                onTap: (){
                  exit(0);
                },
              ),
          ],
        ),
      ),
    );
  }
}
