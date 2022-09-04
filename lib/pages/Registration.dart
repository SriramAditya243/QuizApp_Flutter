import 'package:flutter/material.dart';
import 'package:quiz/classess/user.dart';
import 'package:quiz/pages/instructions.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  String image="";
  late Users user ;
  final textController = TextEditingController();

  void setupUser() async{
    user = Users(name: "User243");
    await user.getUser();
    //print(user.avatar);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupUser();
  }

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
          width: 0.25*w, height: 0.53*h,
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

//circular avatar
              const SizedBox(height: 30,),
              CircleAvatar(
                backgroundImage: AssetImage("assets/${user.avatar}"),
                radius: 80,
              ),

              const SizedBox(height: 30,),
//please enter ur name
              const Text(
                "Please enter your name",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Raleway",
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900,
                    fontSize: 20
                ),
              ),

              const SizedBox(height: 23,),

              Card(
                margin:const EdgeInsets.fromLTRB(30,0,30,20) ,
                shadowColor: Colors.transparent,

                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: ("    max 10 characters"),
                    border:const OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                    suffixIcon:IconButton(
                      onPressed: () { textController.clear();},
                        icon: const Icon(Icons.clear),
                    )
                    ),
                  maxLength: 10,
                ),
              ),

            const SizedBox(height: 12,),
//StartButton
              ElevatedButton.icon(
                onPressed: (){
                  setState(() {
                    user.name = textController.text;
                    //print("${user.name}");
                  });
                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Instructions(user: user)));
                } ,
                icon: const Icon(Icons.play_circle,size: 35,),
                label: const Text(
                  "Start",
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
                      borderRadius: BorderRadius.circular(40.0)
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
