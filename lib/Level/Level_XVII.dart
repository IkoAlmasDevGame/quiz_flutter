import 'package:flutter/material.dart';
import 'package:quiz_flutter/Model.dart';

class Level_XVII_ extends StatefulWidget {
  @override
  Level_XVII_State createState() => Level_XVII_State();
}

class Level_XVII_State extends State<Level_XVII_> {
  List qList = [
    Quiz("1. ", "", "", "", "", 1),
    Quiz("2. ", "", "", "", "", 2),
    Quiz("3. ", "", "", "", "", 3),
    Quiz("4. ", "", "", "", "", 4),
    Quiz("5. ", "", "", "", "", 1),
    Quiz("6. ", "", "", "", "", 2),
    Quiz("7. ", "", "", "", "", 3),
    Quiz("8. ", "", "", "", "", 4),
    Quiz("9. ", "", "", "", "", 1),
    Quiz("10. ", "", "", "", "", 2),
  ];

  var score = 0;
  var counter = 0;
  var width = 400;
  var height = 100;

  checkWin(int userIdChoise, BuildContext context){
    if(userIdChoise == qList[counter].AnswereId){
      print('Correct');
      score = score + 10;
      final snackbar = SnackBar(
        content: Text('Anda Benar Menjawab', style: TextStyle(color: Colors.green),),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 5),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }else{
      print('InCorrect !');
      score = score + 0;
      final snackbar = SnackBar(
        content: Text('Anda Salah Menjawab', style: TextStyle(color: Colors.red),),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 5),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if(counter < 9){
        counter = counter += 1;
      }else{
        score = counter > 10 as int;
      }
    });
  }

  reset(BuildContext context){
    setState(() {
      score = 0;
      counter = 0;
      final snackbar = SnackBar(
        content: Text('Telah di reset game', style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 3),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    });
  }

  Future<void> scoreShow() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Hasil Score Anda',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontStyle: FontStyle.normal),
            ),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Colors.black26, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Text('Socre Anda : $score/100', style: TextStyle(),
                      textAlign: TextAlign.start,),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 5.0)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        child: Text('OKE'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
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
        title: Text('Level - 17', style: TextStyle(),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.yellow[800],
      body: Builder(
        builder: (BuildContext context)=>SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30, left: 5),
                  child: Container(
                    width: width.toDouble(),
                    height: height.toDouble(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      border: Border.all(width: 2.0, color: Colors.black, style: BorderStyle.solid),
                    ),
                    child: FittedBox(
                      child: Text(qList[counter].Exercise,
                        style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, fontFamily: "Times New Roman"),
                        textAlign: TextAlign.start,),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        child: Text('Reset Game', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        onTap: ()=>reset(context)
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    InkWell(
                      child: Text('Score Game', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onTap: (){
                        scoreShow();
                      },
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      child: Text("A.",
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      onPressed: ()=> checkWin(1, context),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(qList[counter].AnswereA,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      child: Text("B.",
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      onPressed: ()=> checkWin(2, context),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(qList[counter].AnswereB,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      child: Text("C.",
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      onPressed: ()=> checkWin(3, context),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(qList[counter].AnswereC,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      child: Text('D.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                      onPressed: ()=> checkWin(4, context),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(qList[counter].AnswereD,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
