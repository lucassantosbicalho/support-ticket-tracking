import 'dart:core';
import 'package:flutter/material.dart';
import 'src/suport_analyst_class.dart';
import 'src/functions.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'src/board.dart';


double screenscalepadding = 0.0002;
double screenscalewidth = 0.96;
double cardheight = 10.0;
var bgColor = const Color(0xff32434F);
var barBgColor = const Color(0xFF3B505E);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<SuporteStats> suportestats = [
    SuporteStats(
      analyst: 'Lucas',
      amount: 20.0,
      used: 19.0,
      avatar: 'images/av1.png',
    ),
    SuporteStats(
      analyst: 'Carl',
      amount: 25.0,
      used: 5.0,
      avatar: 'images/av2.png',
    ),
    SuporteStats(
      analyst: 'Mark',
      amount: 20.0,
      used: 25.0,
      avatar: 'images/av3.png',
    ),
    SuporteStats(
      analyst: 'John',
      amount: 25.0,
      used: 3.0,
      avatar: 'images/av4.png',
    ),
    SuporteStats(
      analyst: 'Angelo',
      amount: 20.0,
      used: 14.0,
      avatar: 'images/av5.png',
    ),
  ];

  final List<BoardListObject> boards = [
    BoardListObject(title: 'Level 1', items: [
      BoardItemObject(title: 'Issue 1', owner: 'Lucas', from: 'Bruna'),
      BoardItemObject(title: 'Issue 2', owner: 'Angelo', from: 'Jess'),
    ]),
    BoardListObject(title: 'Level 2', items: [
      BoardItemObject(
          title: 'Issue 3', owner: 'Mark', from: 'Juliana'),

    ]),
    BoardListObject(title: 'Level 3', items: []),
    BoardListObject(title: 'PO Analysis', items: [
      BoardItemObject(
          title: 'Issue 4', owner: 'Lucas', from: 'Karl'),
    ]),
    BoardListObject(title: 'IT Manager Analysis', items: [
      BoardItemObject(title: 'Issue 5', owner: 'Lucas', from: 'Tysson'),
      BoardItemObject(title: 'Issue 6', owner: 'Karl', from: 'John'),
      BoardItemObject(title: 'Issue 7', owner: 'Mark', from: 'Elis'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    double totalUsed = 0;

    suportestats.forEach((element) {
      totalAmount += element.amount!;
      totalUsed += element.used!;
    });
    final barPercent = (totalUsed / totalAmount);
    var barColor = colorProgressBar(barPercent);
    var barFontColor = barPercent > 0.5 && barPercent < 0.8
        ? const Color(0xFF362A12)
        : Colors.white;

    // Full screen width and height
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        // primary: false,
        backgroundColor: bgColor,
        shadowColor: Colors.black,
        title: Text('Support ticket tracking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: screenwidth > 1600.00 ? 300 : 200,
                  width: screenwidth - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xFF25323b),
                  ),
                  child: Column(
                    children: <Widget>[
                      /* Total bar progress */
                      Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(25.0, 35.0, 15.0, 35.0),
                            child: new LinearPercentIndicator(
                              width: screenwidth - 100,
                              animation: true,
                              lineHeight: 30.0,
                              animationDuration: 500,
                              percent: barPercent > 1.0 ? 1.0 : barPercent,
                              center: Text(
                                  "${(totalUsed / totalAmount * 100).toStringAsFixed(0)}%",
                                  style: TextStyle(
                                      color: barFontColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: barColor,
                              backgroundColor: barBgColor,
                            ),
                          ),
                        ],
                      ),
                      /* Analysts */
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: suportestats.map((st) {
                            final avatarPercent = (st.used! / st.amount!);
                            var avatarColor = colorProgressBar(avatarPercent);

                            return Column(children: <Widget>[
                              Row(children: [
                                Text(
                                  st.analyst.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Container(
                                        width: screenwidth > 1600.00
                                            ? ((screenwidth * 0.55) /
                                                suportestats.length)
                                            : ((screenwidth * 0.35) /
                                                suportestats.length),
                                        child: screenwidth > 1600.00
                                            ? CircularPercentIndicator(
                                                radius: 100.0,
                                                lineWidth: 10.0,
                                                percent: avatarPercent > 1.0
                                                    ? 1.0
                                                    : avatarPercent,
                                                center: new CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      st.avatar.toString()),
                                                  radius: 30,
                                                  backgroundColor: Colors.white,
                                                ),
                                                progressColor: avatarColor,
                                                backgroundColor: bgColor,
                                              )
                                            : Text(
                                                '${(st.used! / st.amount! * 100).toStringAsFixed(0)}%',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: avatarPercent > 1.0
                                                        ? Colors.white
                                                        : avatarColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                        margin: EdgeInsets.symmetric(
                                            vertical: cardheight),
                                      ),
                                      screenwidth > 1600.00
                                          ? Text(
                                              '${(st.used! / st.amount! * 100).toStringAsFixed(0)}%',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: avatarPercent > 1.0
                                                      ? Colors.white
                                                      : avatarColor,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text('')
                                    ],
                                  ),
                                ],
                              ),
                            ]);
                          }).toList()),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                ),
                Container(
                  height: screenheight * 0.7,
                  width: screenwidth - 50,
                  // color: const Color(0xFF25323b),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xFF25323b),
                  ),
                  /* Boards */
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: boards.map((bo) {
                        return Column(children: <Widget>[
                          Row(
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    '${bo.title} (${bo.items!.length} tickets)',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                height: 40,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: screenheight * 0.65,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: const Color(0xFF374957),
                                    ),
                                    child:


                                    ListView(
                                      children: bo.items!.map((ibo) {
                                        return Card(
                                          elevation: 5,
                                          margin: EdgeInsets.all(10),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(''),
                                                Text('Title: ${ibo.title.length > 25 ? ibo.title.substring(0,25) : ibo.title}', style: TextStyle(fontWeight: FontWeight.bold, color: bgColor, fontSize: 15),),
                                                Text('Requester: ${ibo.from!.length > 15 ? ibo.from!.substring(0,15) : ibo.from}', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.blueGrey),),
                                                Text('Analyst: ${ibo.owner.length > 15 ? ibo.owner.substring(0,15) : ibo.owner}', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.blueGrey),),
                                                Text(''),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]);
                      }).toList()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
