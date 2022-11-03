import 'package:flutter/material.dart';
import 'package:ifeanyi_portfolio/constants/constants.dart';
import 'package:ifeanyi_portfolio/data/data.dart';
import 'package:ifeanyi_portfolio/main.dart';
import 'package:ifeanyi_portfolio/screens/widgets/project_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final Uri emailLaunchUri =
      Uri(
             scheme: 'mailto',
            path: contactEmail,
                      );

  var _isLoading = false;

  void _launchUrl() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Future.delayed(const Duration(seconds: 2));
      await launchUrl(
        emailLaunchUri,
      );
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.greenAccent,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          elevation: 30,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              }),
          content: Text('An error occured. ${error.toString()}'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(
              Icons.circle_sharp,
              size: 12,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Ifeanyi's Portfolio",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        // foregroundColor: Colors.black,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    kGradient1,
                    kGradient2,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
              ),
            ),
           const SizedBox(height: 50,),
            Center(
                child: Text(
              name,
              style: kTitleText,
            )),

           const Center(
                child: Text( 'Flutter App Developer',
              style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
              ),
            )),
            
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
               side: const BorderSide(width: 1.0,
                  color: Colors.black
                  )
                  ),
                    onPressed: () async {
                      //Code to launch resume
                      final Uri url = Uri.parse(resumeLink);
                      await launchUrl(url);
                    },
                    child:  const Text(
                      "View Resume",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                        )
                    )),
                const SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  
                    onPressed: () async {
                      //Call to launch email
                      _launchUrl();
                    },
                    child: Row(
                      children:  [
                        const Icon(
                          Icons.add,
                          size: 16,
                          color: Colors.black,
                        ),
                       const  SizedBox(
                          width: 5,
                        ),
                      _isLoading ? 
                      const CircularProgressIndicator(
                        strokeWidth: 3,
                      color: Colors.black,
                      ) 
                      : const Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.black
                          )
                        )
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: screenSize.width > 1200
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Text(
                                  "Experience",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25
                                    )
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(aboutWorkExperience,
                                style: const TextStyle(color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                                ),
                                ),
                               const SizedBox(height: 40,),
                                const Divider(color: Colors.black,),
                               const SizedBox(height: 40,),
                               const Text("About Me", 
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                                )
                              ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(aboutMeSummary, 
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                               const Text
                          ('🚀 Skills:  Flutter, Dart, Firebase, Git, Kotlin, Restful Api, Graph Ql, State Management, App Lifecycle, Architecture Approaches, Flutter Framework.',
                                style: TextStyle(color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                                ),
                                ),
                              const SizedBox(height: 40,),
                              const Divider(color: Colors.black,),
                               const SizedBox(height: 40,),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                Card(
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 40),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Location",
                                            style: kSubTitleText,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
            
                                                Icons.circle,
                                                size: 16,
                                                color: Colors.blue,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                location,
                                                style: const TextStyle(color: Colors.blue),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Linkedin",
                                            style: kSubTitleText,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(linkedin, 
                                              style: const TextStyle(color: Colors.blue),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              IconButton(
                                                color: Colors.white,
                                                onPressed: () async{
                                               final Uri url = Uri.parse('https://www.linkedin.com/in/ifeanyietoniru/');
                                           await launchUrl(url);
                                                },
                                               icon: const Icon(Icons.launch),
                                              
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Github",
                                            style: kSubTitleText,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(github, 
                                              
                                              style: const TextStyle(color: Colors.blue)
                                              ),
                                              const SizedBox(
                                                width: 38,
                                              ),
                                              IconButton(
                                                color: Colors.white,
                                                onPressed: ()async {
                                            final Uri url = Uri.parse('https://github.com/waynetipsy');
                                           await launchUrl(url);
                                                },
                                              icon: const Icon(Icons.launch),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                         const Text(
                                            "Phone number",
                                            style: TextStyle(
                                            fontWeight: FontWeight.bold,  
                                              color: Colors.white)
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(phonenumber, 
                                              style: const TextStyle(color: Colors.blue),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.launch,
                                                size: 16,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const Text(
                                "Experience",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                                )
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(aboutWorkExperience,
                               style: const TextStyle(fontWeight: FontWeight.bold), 
                              ),
                              const Divider(),
                             const SizedBox(height: 30,),
                             const Text("About Me", 
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                                )
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(aboutMeSummary, 
                              style: const TextStyle(fontWeight: FontWeight.bold)
                              ),

                              const Text
                          ('🚀 Skills:  Flutter, Dart, Firebase, Git, Kotlin, Restful Api, Graph Ql, State Management, App Lifecycle, Architecture Approaches, Flutter Framework.',
                                style: TextStyle(color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                                ),
                                ),
                              const SizedBox(height: 40,),
                              const Divider(color: Colors.black,),
                               const SizedBox(height: 40,),
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 40, horizontal: 40),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                      const  Text(
                                          "Location",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          )
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              
                                              Icons.circle,
                                              color: Colors.blue,
                                              size: 16,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              location,
                                              style: const TextStyle(color: Colors.blue),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                       const Text(
                                          "Linkedin",
                                          style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(linkedin, 
                                            style: const TextStyle(color: Colors.blue),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            IconButton(
                                              color: Colors.white,
                                              onPressed: () async {
                                                final Uri url = 
                                                Uri.parse('https://www.linkedin.com/in/ifeanyietoniru/');
                                           await launchUrl(url); 
                                              },
                                          icon: const Icon(Icons.launch),
                                              
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                       const Text(
                                          "Github",
                                          style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold
                                          )
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(github, 
                                            style: const TextStyle(color: Colors.blue,
                                            )
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                             IconButton(
                                              color: Colors.white,
                                            onPressed: () async{
                                               final Uri url = Uri.parse('https://github.com/waynetipsy');
                                           await launchUrl(url);
                                            },
                                             icon: const Icon(Icons.launch),
                                            )
                                          ],
                                        ),

                                    const SizedBox(
                                          height: 10,
                                        ),
                                       const Text(
                                          "Twitter",
                                          style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold
                                          )
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(twitter, 
                                            style: const TextStyle(color: Colors.blue,
                                            )
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                             IconButton(
                                              color: Colors.white,
                                            onPressed: () async{
                                               final Uri url = Uri.parse('https://twitter.com/Waynetipsy');
                                           await launchUrl(url);
                                            },
                                             icon: const Icon(Icons.launch),
                                            )
                                          ],
                                        ),

                                        const SizedBox(
                                          height: 10,
                                        ),
                                       const Text(
                                          "Phone number",
                                          style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold
                                          )
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(phonenumber, style: const TextStyle(color: Colors.blue),),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.launch,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 80,
                                        ),
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
              ),
            
            ),
           const SizedBox(height: 30,),
           const Center(
              child: Text('Flutter Projects',
              style: TextStyle(color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              ),
              )
            ),
           const SizedBox(height: 20,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: screenSize.width > 1000
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 3),
                        itemCount: projectList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProjectWidget(
                            projectData: projectList[index],
                            
                          );
                        }
                        )
                        
                    : GridView.builder(
                        shrinkWrap: true,
                        
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, childAspectRatio: 2),
                        itemCount: projectList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProjectWidget(
                            projectData: projectList[index],
                          );
                         }
                        ),
              ),
              
            ),
           const SizedBox(height: 100,),
            Center(
              child: Text(
                "Copyright (c) ${DateTime.now().year} Etoniru Ifeanyi. All rights Reserved",
                style: const TextStyle(fontWeight: FontWeight.bold,
                fontSize: 10
                ),
              ),
            ),
           const SizedBox(height: 100,)
          ],
        ),
      ),
      backgroundColor: Colors.greenAccent
    );
  }
}
