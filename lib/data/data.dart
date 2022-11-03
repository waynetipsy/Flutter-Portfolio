
import 'package:flutter/material.dart';
import 'package:ifeanyi_portfolio/models/project_model.dart';

//Update with colors of your choice for dp background gradient
Color kGradient1 = Colors.blue;
Color kGradient2 = Colors.black;


String imagePath = "asset/myimage.png";

//String data to modify
String name = "Ifeanyi Etoniru";
String username = "waynetipsy";

//Link to resume on Google Drive
String resumeLink =
    "https://drive.google.com/file/d/1TGo-rM_tmVaRP7cdQwbRkoXOfms_dGZt/view?usp=sharing";

//Contact Email
String contactEmail = "jacketoniru@gmail.com";

String aboutWorkExperience = '''
Hello, I'm a Flutter/Dart Developer 💻

I have proven success with developing applications with flutter and in my current position, I design mobile applications and publish them for android smartphones. I am highly skilled as a mobile developer, creating innovative and useful apps that work well. 

I keep abreast with all technological changes and update myself to fit improving mobile phone offerings and I am always ready to learn wherever I may fall short.
I have terrific attention to detail, am organized, and efficient, and possess suitable application development skills and would love the opportunity to be a part of your mobile app development team as I believe I would offer a lot and also learn a lot.
''';

String aboutMeSummary = '''
Mobile app developer skilled in working as a team and incorporating input into projects. 
I have a strong eye for detail and tenacity to never quit on something until it is absolutely perfect.
Effective in analyzing relevant information and guiding product cycle from conception to completion.

''';

String location = "Abuja, Nigeria";
String linkedin = "linkedin link:";
String github = "github link:";
String twitter = "twitter link:";
String phonenumber = "+234 6369 5777";

List<Project> projectList = [
  Project(
      name: "Cop Todo",
      description:
          "A Todo Note App 📝",
      link: "https://github.com/waynetipsy/Cop_Todo", 
      playstore: 'https://play.google.com/store/apps/details?id=com.cop.cop_todo'),
  Project(
      name: "Text Genie",
      description:
          "Optical Character Recognition app📜 ",
      link: "https://github.com/waynetipsy/OCR-Voice-App",
       playstore: 'https://github.com/waynetipsy/OCR-Voice-App'),
  Project(
      name: "Tic Toe Game",
      description:
          "A Tic Toe Game app 🎮",
      link: "https://github.com/Ikechukwu-etoniru/tic_tac_toe_game", 
      playstore: 'https://play.google.com/store/apps/details?id=com.ilated.tic_toe_game'),
  Project(
      name: "GraphQl Flutter",
      description: "Flutter app built with graph Ql 🕹️",
      link: "https://github.com/waynetipsy/GraphQl_Futter", 
      playstore: 'https://github.com/waynetipsy/GraphQl_Futter')
];
