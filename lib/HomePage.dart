import 'dart:io';
import 'package:flutter/material.dart';
import 'Model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List qList = [
    Quiz("1.", "A.", "B.", "C.", 1),
    Quiz("2.", "A.", "B.", "C.", 3),
    Quiz("3.", "A.", "B.", "C.", 2),
    Quiz("4.", "A.", "B.", "C.", 1),
    Quiz("5.", "A.", "B.", "C.", 2),
    Quiz("6.", "A.", "B.", "C.", 1),
    Quiz("7.", "A.", "B.", "C.", 1),
    Quiz("8.", "A.", "B.", "C.", 2),
    Quiz("9.", "A.", "B.", "C.", 1),
    Quiz("10.", "A.", "B.", "C.", 2),
  ];

  var counter = 0;
  var score = 0;

  checkWin(int userChoice, BuildContext context){
    if(userChoice == qList[counter].userAnswere){
      print("correct");
      score = score + 10;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 200),
        backgroundColor: Colors.green,
        content: Text("Jawaban Anda Benar"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }else{
      print("false");
      score = score + 0;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 200),
        backgroundColor: Colors.red,
        content: Text("Jawaban Anda Salah"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if(counter < 9) {
        counter = counter += 1;
      }else if (counter > 10) {
        score = counter > 10 as int;
      }else{
        counter = counter > score as int;
      }
    });
  }

  reset()
  {
    setState(() {
      counter = 0;
      score =0;
    });
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Dilanjutkan Lagi atau tidak permainan game ini ?"),
            content: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(onPressed: (){
                    reset();
                    Navigator.of(context).pop();
                  },
                    child: Text("IYA"),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 2.5)),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                    child: Text("TIDAK"),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Future<void> _showDialogScore() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Hasil Nilai Anda"),
            backgroundColor: Color.fromRGBO(85, 100, 75, 1),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 245,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black87, style: BorderStyle.solid),
                    ),
                    child: Text("\n   Hasil Nilai Latihan Anda : $score", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(bottom: 10.0),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("OKE", style: TextStyle(fontSize: 14.0),),
                        color: Colors.black87,
                        colorBrightness: Brightness.dark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Flutter', style: TextStyle(),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.yellow[900],
      body: Builder(
        builder: (BuildContext context)=>SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
            alignment: Alignment.center,
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1.2, color: Colors.black87, style: BorderStyle.solid),
              ),
              child: Text("Quiz Flutter Indonesia", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "ARIAL"),
                textAlign: TextAlign.center,),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: Text("Hasil Score", style: TextStyle(fontSize: 18, color: Colors.greenAccent, fontWeight: FontWeight.bold),),
                    onTap: _showDialogScore,
                  ),
                  InkWell(
                    child: Text("Reset Game",style: TextStyle(fontSize: 18,color: Colors.redAccent,fontWeight: FontWeight.bold),),
                    onTap: _showDialog,
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.black26, width: 1.5 ,style: BorderStyle.solid),
              ),
              height: 90.0,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                    child: Text(qList[counter].Question,
                      style: TextStyle(fontSize: 18.0,),
                    textAlign: TextAlign.start,),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RaisedButton(onPressed:()=> checkWin(1, context),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(qList[counter].AnswereA,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  color:  Color.fromRGBO(47, 79, 79, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.only(bottom: 2.5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RaisedButton(onPressed: ()=> checkWin(2,context),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(qList[counter].AnswereB,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  color: Color.fromRGBO(105, 105, 105, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.only(bottom: 2.5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RaisedButton(onPressed: ()=> checkWin(3,context),
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Text(qList[counter].AnswereC,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      color: Color.fromRGBO(105, 105, 105, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.logout),
              trailing: Icon(Icons.arrow_right),
              title: Text('Exit Game'),
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