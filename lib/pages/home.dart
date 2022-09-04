import 'package:flutter/material.dart';
import 'package:quiz/classess/user.dart';
import 'package:quiz/pages/leaderBoard.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Home extends StatefulWidget {
  List<Users> user ;
  Home({Key? key, required this.user}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Map<int,Users> m = ModalRoute.of(context)?.settings.arguments as Map;
  @override
  Widget build(BuildContext context) {
    
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
        )
      ),

      child: Center(
        child: Container(
          width: 0.3*w, height: 0.5*h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(
              color: Colors.black45,
              offset: Offset(10, 10),
            )]
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [

              const SizedBox(height: 30,),

              const AutoSizeText(
                  "Welcome to",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Cursive",
                    color: Colors.blueGrey,
                    fontSize: 60,
                  ),
                maxLines: 1,
                minFontSize: 2,
              ),

              const SizedBox(height: 10,),

              const Text(
                "Quiz",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: "Raleway",
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 70
                ),
              ),

              const SizedBox(height: 30,),
//Start Button              
              ElevatedButton.icon(
                  onPressed: (){ Navigator.pushReplacementNamed(context, '/registration');} ,
                  icon: const Icon(Icons.not_started_outlined,size: 28,),
                  label: const Text(
                      "Start Quiz",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily:"Normal",
                        fontStyle: FontStyle.italic,
                      ),
                  ),
                  style:  ElevatedButton.styleFrom(
                    elevation: 20.0,
                    padding: const EdgeInsets.fromLTRB(50, 15, 50, 15)
                  ),
              ),

              const SizedBox(height: 20,),
//LeaderBoard Button
              ElevatedButton.icon(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  LeaderBoard(users: widget.user,)));
                } ,
                icon: const Icon(Icons.list,size: 35,),
                label: const Text(
                  "ScoreBoard",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily:"Normal",
                    //fontStyle: FontStyle.italic,
                  ),
                ),
                style:  ElevatedButton.styleFrom(
                    elevation: 20.0,
                    padding: const EdgeInsets.fromLTRB(35, 15, 35, 15)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
