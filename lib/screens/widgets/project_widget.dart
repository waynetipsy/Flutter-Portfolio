import 'package:flutter/material.dart';
import 'package:ifeanyi_portfolio/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/project_model.dart';

class ProjectWidget extends StatelessWidget {
  Project projectData;
  ProjectWidget({Key? key, required this.projectData}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        elevation: 5,
      //margin: EdgeInsets.all(10),
        color: Colors.black,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.build,
                  color: kGrey,
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  projectData.name,
                  style: kSectionTitleText,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              projectData.description,
              style: const TextStyle(color: Colors.blue,
              fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Spacer(),
          const Divider(),
          Expanded(
            child: Row(
            
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                GestureDetector(
                    onTap: () async{
          
                      final Uri url = Uri.parse(projectData.playstore);
                        await launchUrl(url);
                    
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
                        child: Image.asset('asset/google_play.png'),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () async{
                  final Uri url = Uri.parse(projectData.link);
                        await launchUrl(url);
                    
                    },
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 70,
                        height: 40,
                      
                         child: DecoratedBox(
                          child:  const Center(
                            child: 
                             Text('Project', style: 
                            TextStyle(
                              fontWeight: FontWeight.bold),),
                          ),
                          decoration: BoxDecoration(
                            
                            borderRadius: BorderRadius.circular(8),
                           color: Colors.white
                          )
                          )
                      ),
                    ),
                  ),
              
               /* Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      //style: ,
                      onPressed: () async {
                        //Launch project on GitHub
                        final Uri url = Uri.parse(projectData.link);
                        await launchUrl(url);
                      },
                      child: Text(
                        "View Project",
                        style: kSubTitleText.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ), */
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
