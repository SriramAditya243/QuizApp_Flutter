import 'package:flutter/material.dart';
import 'package:quiz/classess/user.dart';
import 'package:quiz/pages/home.dart';
import 'package:intl/intl.dart';


class endPage extends StatefulWidget {
  final Users user;
  const endPage({Key? key,required this.user}) : super(key: key);

  @override
  State<endPage> createState() => _endPageState();
}

class _endPageState extends State<endPage> {

  static List<Users> users=[];
  DateFormat dateFormat = DateFormat("dd-MM-yyy HH:mm:ss");
  String currentTime = DateFormat.jm().format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.user.time = currentTime;
    users.add(widget.user);
  }

  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BG3.jpg"),
            fit: BoxFit.cover,
          )
      ),

      child: Center(
        child: Container(
          width: 0.3*w, height: 0.5*h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
            children: <Widget> [

              const SizedBox(height: 30,),

              const Text(
                "Your Score is",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: "Cursive",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 60,
                ),
              ),

              const SizedBox(height: 35,),

              Text(
                "${widget.user.score}",
                style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Normal",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 70
                ),
              ),

              const SizedBox(height: 30,),
//Start Button

              const SizedBox(height: 15,),
//LeaderBoard Button
              ElevatedButton.icon(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Home(user: users)));
                } ,
                icon: const Icon(Icons.home,size: 35,),
                label: const Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily:"Normal",
                    //fontStyle: FontStyle.italic,
                  ),
                ),
                style:  ElevatedButton.styleFrom(
                    elevation: 20.0,
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  primary: Colors.deepPurple[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}