import 'package:flutter/material.dart';
import 'package:quiz/classess/user.dart';
import 'package:quiz/classess/questions.dart';
import 'dart:async';
import 'package:quiz/pages/endPage.dart';

class Quiz extends StatefulWidget {
  final Users user;
  const Quiz({Key? key, required this.user}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<Questions> questions = [
    Questions(
        question : "Capital Of India is ",
        options: {
          1: ["Delhi", true],
          2: ["Agra", false],
          3: ["Kolkata" , false],
          4: ["Hyderabad", false]
        }
    ),

    Questions(
        question : "Capital Of Australia is",
        options: {
          1: ["Delhi", false],
          2: ["Canberra", true],
          3: ["London" , false],
          4: ["Beijing", false]
        }
    ),

    Questions(
        question : "Capital Of China is",
        options: {
          1: ["Delhi", false],
          2: ["Sydney", false],
          3: ["London" , false],
          4: ["Beijing", true]
        }
    ),

    Questions(
        question : "Capital Of England is ",
        options: {
          1: ["Delhi", false],
          2: ["Sydney", false],
          3: ["London" , true],
          4: ["Beijing", false]
        }
    ),

    Questions(
        question : "India got independence in",
        options: {
          1: ["1942", false],
          2: ["1937", false],
          3: ["1945" , false],
          4: ["1947", true]
        }
    ),

    Questions(
        question : "Republic day is on January",
        options: {
          1: ["26", true],
          2: ["31", false],
          3: ["1" , false],
          4: ["6", false]
        }
    ),

    Questions(
        question : "Father of nation is",
        options: {
          1: ["Gandhi", true],
          2: ["Nehru", false],
          3: ["Bose" , false],
          4: ["Valabhai patel", false]
        }
    ),

    Questions(
        question : "Capital Of Telangana is",
        options: {
          1: ["Warangal", false],
          2: ["Hyderabad", true],
          3: ["Karimnagar" , false],
          4: ["Beijing", false]
        }
    ),

    Questions(
        question : "Symbol of gold is ",
        options: {
          1: ["Au", true],
          2: ["Ag", false],
          3: ["Mn" , false],
          4: ["Cd", false]
        }
    ),

    Questions(
        question : "Light travels in",
        options: {
          1: ["curved line", false],
          2: ["zig-zag line", false],
          3: ["straight line" , true],
          4: ["randomly", false]
        }
    ),
  ];

  static  const maxTime = 15;
  static int index = 0;
  static int score = 0;
  String sIndex = index.toString();
  String currTime = maxTime.toString();
  Timer? time;
  bool active = true;
  bool reveal = false;
  Color c = Colors.blueGrey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index=0;
    score=0;
    startTimer();
  }

  void verify( bool Verify){
    //changeColors();
    setState(() {
      currTime = (0).toString();
      Verify?(score++):(score);
    });
    if(index>9) endQuiz();
  }

  Widget Option(String opt, bool active,bool Verify,int x){
    return SizedBox(
      height: 70,width: 320,
      child: ElevatedButton(
        onPressed: active ? (){
          verify(Verify);
        } : (){},
        style: ElevatedButton.styleFrom(
            elevation: 20.0,
            //padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            primary: reveal?
            (questions[index].options[x]?[1])? Colors.green:Colors.red
            : Colors.deepPurple[400],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)
            )
        ),
        child:  Text(
          opt,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: "Normal",
          ),
        ),
      ),
    );
  }

  void startTimer() {
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(int.parse(currTime)<=0 && index<10) {
        timer.cancel();
        setState(() {
          active = false;
          reveal = true;
          Timer(const Duration(seconds: 2), () {
            setState(() {
              verify(false);
              if(index < 9) { index++ ; currTime = maxTime.toString();
              startTimer();}
              else {
                timer.cancel();
                endQuiz();
              }
              active = true;
              reveal = false;
            });
          });

        });
      }
      else if(index==10) {
        endQuiz();
      } else{
        index==10? endQuiz()
        : setState(() {
          int x =((int.parse(currTime)-1));
          currTime = x.toString();
        });
      }
    });
  }


  void nextQuestion(){
    setState(() {
      active = false;
      currTime = (maxTime-15).toString();
      Timer(const Duration(seconds: 2),(){
        if(index==9) {
          endQuiz();
        } else{
        setState(() {
          currTime=maxTime.toString();
          active = true;
        });
      }
      });
  });
  }

void endQuiz(){
    setState(() {
      widget.user.score=score;
      //score=0;
      //index=0;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => endPage(user: widget.user)));
    });
}

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/BG3.jpg"),
                fit: BoxFit.cover)
        ),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(200, 30, 200, 60),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Card(
              shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white70,
                        Colors.pinkAccent.shade100,
                        Colors.blue.shade100,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Score $score/10",
                        style: const TextStyle(
                          fontFamily: "Normal",
                          fontSize: 15,
                          letterSpacing: 2,
                          //backgroundColor: Colors.red,
                          height: 3,
                        ),
                      ),

                      const SizedBox(height: 20,),


                  SizedBox(
                    height: 150,width: 150,
                    child: Stack(
                      fit: StackFit.expand,
                      children:  [
                        CircularProgressIndicator(
                          value: int.parse(currTime)/maxTime ,
                          strokeWidth: 10,
                          color: Colors.green,
                          backgroundColor: Colors.red[500],
                        ),

                            Center(
                          child: Text(
                          currTime,
                          style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          fontFamily: "Normal",
                      ),
                      ),
                        ),]
                    ),
                  ),

                      const SizedBox(height: 40,),

                      Text(
                        "Question ${index+1}/10",
                        style: const TextStyle(
                          fontFamily: "Normal",
                          fontSize: 20,
                        ),
                      ),

                      const Divider(height: 40,),

                      Text(
                        "${index+1}. ${questions[index].question}",
                        style: const TextStyle(
                          fontFamily: "Normal",
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),

                      const SizedBox(height: 35,),

                      Card(
                        shadowColor: Colors.transparent,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Option("${questions[index].options[1]?[0]}",active, questions[index].options[1]?[1],1),
                            Option("${questions[index].options[2]?[0]}",active, questions[index].options[2]?[1],2),
                          ],
                        ),
                      ),

                      const SizedBox(height: 39,),

                      Card(
                        shadowColor: Colors.transparent,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Option("${questions[index].options[3]?[0]}",active, questions[index].options[3]?[1] ,3),
                            Option("${questions[index].options[4]?[0]}",active, questions[index].options[4]?[1] ,4),
                          ],
                        ),
                      ),

                      const SizedBox(height: 60,),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(860,0,0,0),
                        child: ElevatedButton.icon(
                          onPressed: (){
                            nextQuestion();
                          } ,
                          icon: const Icon(Icons.arrow_circle_right_outlined,size: 25,),
                          label: const Text(
                            "Next Question",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily:"Normal",
                              //fontStyle: FontStyle.italic,
                            ),
                          ),
                          style:  ElevatedButton.styleFrom(
                              //elevation: 20.0,
                              padding: const EdgeInsets.fromLTRB(10, 15, 30, 15),
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        )
    );
  }
}
