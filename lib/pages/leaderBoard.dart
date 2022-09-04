import 'package:flutter/material.dart';
import 'package:quiz/classess/user.dart';
import 'package:quiz/pages/home.dart';


class LeaderBoard extends StatefulWidget {
  List<Users> users = [];
  LeaderBoard({Key? key,required this.users}) : super(key: key);
  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.users.add(
    //   Users(name: "sriram "),
    // );
    // widget.users.add(
    //   Users(name: "aditya"),
    // );
    // widget.users.add(
    //   Users(name: "manje"),
    // );
    // widget.users.add(
    //   Users(name: "aneesh"),
    // );
  }
  @override
  Widget build(BuildContext context) {
    //
    // var we = MediaQuery.of(context).size.width;
    // var he = MediaQuery.of(context).size.height;

    //String img,String name,String time,int score
    Widget userTile(String name,String img,int score,String time){

      return Padding(
        padding:  const EdgeInsets.fromLTRB(50,0,50,0),
        child: Container(
          decoration:  const BoxDecoration(
          ),
          //height: 0.11*he,

          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [

                  const SizedBox(width: 180,),

                  SizedBox(
                    width: 75,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/$img"),
                      radius: 80,
                    ),
                  ),

                  const SizedBox(width: 50,),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,620,0),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Normal",
                        color: Colors.purple.shade600
                      ),
                    ),
                  ),

                  const SizedBox(width: 80,),

                  Text(
                    "$score",
                    style: const TextStyle(
                        fontSize: 30,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(width: 50,),

                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const Divider(height: 20,)
            ],
          ),

        ),
      );
    }

    return
          Scaffold(
            appBar: AppBar(
              title: const Text("SCOREBOARD",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 33),),
              centerTitle: true,
              backgroundColor: Colors.purple.shade400,
              shadowColor: Colors.transparent,
            ),
            body: Card(
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
                  children: [

                    Padding(
                      padding:  const EdgeInsets.all(10.0),
                      child: Row( crossAxisAlignment: CrossAxisAlignment.center,children:
                       const [
                        SizedBox(width: 350,),
                        Text("NAME",style: TextStyle(fontFamily: "Normal",fontSize: 25),),
                        SizedBox(width: 690,),
                        Text("SCORE",style: TextStyle(fontFamily: "Normal",fontSize: 25),),
                        SizedBox(width: 20,),
                        Text("SUBMITTED ON",style: TextStyle(fontFamily: "Normal",fontSize: 25),),
                      ],),
                    ),

                    const Divider(height: 10,thickness: 2,color: Colors.black38,),

                    Expanded(
                      child: Card(
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        child: ListView.builder(
                          itemCount : widget.users.length,
                          itemBuilder: (context,index){
                        return userTile(widget.users[index].name,widget.users[index].avatar,widget.users[index].score,widget.users[index].time);
                                                                      }
                                                                      ),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    ElevatedButton.icon(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Home(user: widget.users)));
                      } ,
                      icon:  const Icon(Icons.home,size: 35,),
                      label:  const Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily:"Normal",
                          //fontStyle: FontStyle.italic,
                        ),
                      ),
                      style:  ElevatedButton.styleFrom(
                        primary: Colors.purple.shade400,
                          elevation: 20.0,
                          padding:  const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      ),
                    ),
                    const SizedBox(height: 40,),
                  ]
                ),
              ),
            ),
          );
}}

