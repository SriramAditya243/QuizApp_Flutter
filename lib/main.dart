
import 'package:flutter/material.dart';
import 'package:quiz/pages/endPage.dart';
import 'package:quiz/pages/home.dart';
import 'package:quiz/pages/Registration.dart';
import 'package:quiz/classess/user.dart';
import 'package:quiz/pages/leaderBoard.dart';

void main() {
  List<Users> l = [];
  Users  users = Users(name: "default");
  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/home": (context)=>Home(user: l),
      "/registration" : (context)=>const Registration(),
     // "/instructions" : (context)=> Instructions(),
      //"/quiz" : (context) => Quiz(user: users,),
      "/endPage" : (context)=> endPage(user: users),
      "/LeaderBoard" : (context) => LeaderBoard(users: l)
    },
  ));
}