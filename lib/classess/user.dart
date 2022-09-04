
class Users{
  String name;
  String avatar = "default";
  int score=0;
  String time = "";
  List<String> avatars = ["cat.jpg", "cat2.jpg","coder.jpg","console.jpg","elephant.jpg","astronaut.jpg"];
  static int counter = 0;

  Users ({required this.name});

  Future<void> getUser() async{
    try{
      counter++;
      avatar = avatars[counter%6];
      //print(avatars);
    }
    catch(e){}
  }
}