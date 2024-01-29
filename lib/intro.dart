import 'package:school/webview.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "abyssinia school system",
        body:
            "this is completed school information managment system used to manage every school information like student information managment,teacher information managment,acadamical information managment system,finance information ,liberary information managment and other ",
        image: Image.asset("assets/logo.JPG"),
        decoration: const PageDecoration(
       pageColor: Colors.green,
          bodyTextStyle: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
      PageViewModel(
        title: "what it include",
        body: "This school management system is designed for various users, including administrators, students, teachers, parents, finance personnel, and librarians. It encompasses both mobile and computer applications, functioning seamlessly in both online and offline modes. it works by amharic and english,and also it has mobile application for admin student teacher and parents",
        image: Image.asset("assets/logo.JPG"),
        decoration: const PageDecoration(
          pageColor: Colors.green,
          bodyTextStyle: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
      PageViewModel(
        title: "what to do ",
        body: "if you want to use this completed features of this system contact 0951050364 or contact us on telegram @abyssiniasoftware1",
        image: Image.asset("assets/logo.JPG"),
        decoration: const PageDecoration(
          pageColor: Colors.green,
          bodyTextStyle: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return IntroductionScreen(
      key: introKey,

      pages: getPages(),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>WebviewTwo (url:'https://school.asfagroindustry.com/index.php/login'),
          ),
        );
      },
      onSkip: () async {
         SharedPreferences prefs = await SharedPreferences.getInstance();
         prefs.setBool('seen', true);
         if(prefs.getBool('seen')==true)
       Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WebviewTwo(url:"https://school.abyssniasoftware.com"),
          ),
        );
        else  Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ),
        );
      },
      showSkipButton: true,
      skip: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: const Text(
          "እለፍ",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 16,
          ),
        ),
      ),
      next: const Icon(Icons.arrow_forward,color: Colors.red,size: 21,),
      done: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green,
        ),
        child: const Text(
          "ቀጣይ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeColor: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
