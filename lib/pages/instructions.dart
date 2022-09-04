import 'package:flutter/material.dart';
import 'package:quiz/classess/user.dart';
import 'package:quiz/pages/quiz.dart';

class Instructions extends StatefulWidget {
  final Users user;
  const Instructions({Key? key, required this.user}) : super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  //final arguments = ModalRoute.of(context)!.settings.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/background.jpg"),
          //   fit: BoxFit.cover,
        color: Colors.black12,
          ),

          child:  Padding(
            padding: const EdgeInsets.all(90.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Instructions",
                  style: TextStyle(
                    fontSize: 30
                  ),),
                  centerTitle: true,
                ),

                body: Padding(
                  padding: const EdgeInsets.fromLTRB(50.0,50,0,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                          "Instructions to follow during quiz",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Normal",
                          ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(35,30,0,0),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children:  [
                            instructs(instruction: "Each question will be given only 15secs to answer"),
                            const SizedBox(height: 20,),
                            instructs(instruction: "Once a question is answered, the answer cant be changed"),
                            const SizedBox(height: 20,),
                            instructs(instruction: "No negative points for wrong answer"),
                            const SizedBox(height: 20,),
                            instructs(instruction: "After 15secs automatically next question will be displayed "),
                            const SizedBox(height: 40,),
                          ],
                        ),
                      ),
                      const Text(
                        "All The Best 👍",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(height: 40,),
                      const Divider(height: 30,),
                      const SizedBox(height: 20,),

                      ElevatedButton.icon(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Quiz(user: widget.user)));
                          //Navigator.pushReplacementNamed(context, '/instructions', arguments: user);
                        } ,
                        icon: const Icon(Icons.play_circle,size: 35,),
                        label: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily:"Normal",
                            //fontStyle: FontStyle.italic,
                          ),
                        ),
                        style:  ElevatedButton.styleFrom(
                            elevation: 20.0,
                            padding: const EdgeInsets.fromLTRB(10, 15, 30, 15),
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      );
  }
}

class instructs extends StatelessWidget {
  String instruction;
  int counter=1;
  instructs({Key? key, required this.instruction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      ("$counter .  $instruction"),
      style: const TextStyle(
          fontSize: 25
      ),
    );
  }
}


//Todo change instructions and receive user object from Reg page

