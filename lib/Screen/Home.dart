import 'package:flutter/material.dart';

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool darkMode = false;
  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;
  dynamic title2 = "0";
dynamic color2 = const Color(0x282c35);
  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }
  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Color.fromRGBO(41, 45, 54, 100) : Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             // width: MediaQuery.of(context).size.width-117,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          darkMode ? darkMode = false : darkMode = true;
                        });
                      },
                      child: _switchMode()),
                  SizedBox(height: 80),
                   Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                           '$title2',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                           '$text',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   '=',
                      //   style: TextStyle(
                      //       fontSize: 35,
                      //       color: darkMode ? Colors.green : Colors.grey),
                      // ),
                      // Text(
                      //   '$title2',
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       color: darkMode ? Colors.black : Colors.black),
                      // )
                    ],
                  ),
                
                ],
              ),
            ),
            Container(
              
              decoration: BoxDecoration(
                color: darkMode ? Color.fromRGBO(41, 45, 54, 100) : Color.fromRGBO(248, 248, 248, 100),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                
                
                
                
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buttonRounded(
                            title: 'AC',
                            textColor:
                                darkMode ? Color.fromRGBO(53, 213, 183, 100) : Color.fromRGBO(53, 213, 183, 100)),
                        _buttonRounded(title: '+/-',  textColor:
                                darkMode ? Color.fromRGBO(53, 213, 183, 100) : Color.fromRGBO(53, 213, 183, 100)),
                        _buttonRounded(title: '%',  textColor:
                                darkMode ? Color.fromRGBO(53, 213, 183, 100) : Color.fromRGBO(53, 213, 183, 100)),
                        _buttonRounded(
                            title: '/',
                            textColor: darkMode ? Colors.redAccent : Colors.redAccent)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buttonRounded(title: '7'),
                      _buttonRounded(title: '8'),
                      _buttonRounded(title: '9'),
                      _buttonRounded(
                          title: 'x',
                          textColor: darkMode ? Color.fromRGBO(233, 102, 104, 100) : Color.fromRGBO(233, 102, 104, 100))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buttonRounded(title: '4'),
                      _buttonRounded(title: '5'),
                      _buttonRounded(title: '6'),
                      _buttonRounded(
                          title: '-',
                          textColor: darkMode ? Color.fromRGBO(233, 102, 104, 100): Color.fromRGBO(233, 102, 104, 100))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buttonRounded(title: '1'),
                      _buttonRounded(title: '2'),
                      _buttonRounded(title: '3'),
                      _buttonRounded(
                          title: '+',
                          textColor: darkMode ? Color.fromRGBO(233, 102, 104, 100) : Color.fromRGBO(233, 102, 104, 100))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        _buttonRounded(
                          icon: Icons.replay,
                          iconColor:
                              darkMode ? Color.fromRGBO(241, 241, 241, 100) : Colors.black),
                      _buttonRounded(title: '0'),
                      _buttonRounded(title: '.'),
                    
                      _buttonRounded(
                          title: '=',
                          textColor: darkMode ? Color.fromRGBO(233, 102, 104, 100) :Color.fromRGBO(233, 102, 104, 100))
                    ],
                  )
                ]),
              ),
            ),
         
          ],
        ),
      ),
    );
  }

  Widget _buttonRounded(
      {String title,
      double padding = 17,
      IconData icon,
      Color iconColor,
      Color textColor}) {
    return GestureDetector(
      onTap: (){
      setState(() {
        if(title=="AC"){
          title2="0";
         
        }else if(title== "="){
          title2 = title;
        }
        else 
              title2= title2 + title;
            });
        calculation(title);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 2, bottom: 10),
        child: MyCalc(
         darkMode: darkMode,
         borderRadius: BorderRadius.circular(10),
          padding: EdgeInsets.all(padding),
          child: Container(
            width: padding * 2,
           // height: //padding * 2,
            child: Center(
                child: title != null
                    ? Text(
                        '$title',
                        style: TextStyle(
                            color: textColor != null
                                ? textColor
                                : darkMode
                                    ? Color.fromRGBO(241, 241, 241, 100)
                                    : Colors.black,
                            fontSize: 20),
                      )
                    : Icon(
                        icon,
                        color: iconColor,
                        size: 20,
                      )),
          ),
        ),
      ),
    );
  }

  Widget _buttonOval({String title, double padding = 17}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MyCalc(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(50),
        padding:
            EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        child: Container(
          width: padding * 2,
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return MyCalc(
      darkMode: darkMode,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 70,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            Icons.wb_sunny,
            color: darkMode ? Colors.grey : Colors.black,
          ),
          Icon(
            Icons.nightlight_round,
            color: darkMode ? Colors.white : Colors.white,
          ),
        ]),
      ),
    );
  }
}

class MyCalc extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  MyCalc(
      {this.darkMode = false, this.child, this.borderRadius, this.padding});

  @override
  _MyCalcState createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          
            color: darkMode ? Color.fromRGBO(39, 43, 51, 100) : Color.fromRGBO(247, 247, 247, 0.4),
            borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
            color: darkMode ? Color.fromRGBO(39, 43, 51, 100) : Color.fromRGBO(214, 214, 214, 0.4),
            width: .0,
          ),
            boxShadow: _isPressed
                ? null
                : 
                [
                    // BoxShadow(
                    //   color:
                    //       darkMode ? Colors.black12 : Colors.grey.shade100,
                    //   offset: Offset(0.0, 0.0),
                    //  // blurRadius: 1.0,
                    //  // spreadRadius: 0.0,
                    // ),
                    // BoxShadow(
                    //     color:
                    //         darkMode ? Colors.black12 : Color.fromRGBO(247, 247, 247, 100),
                    //     offset: Offset(1.0, 6.0),
                    //     blurRadius: .0,
                    //     spreadRadius: 1.0
                    //     )
                  ]
                  ),
        child: widget.child,
      ),
    );
  }
}