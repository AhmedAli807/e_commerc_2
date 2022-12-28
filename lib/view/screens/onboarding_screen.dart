import 'package:e_commerc_2/config/assets_constants.dart';
import 'package:e_commerc_2/config/dimns.dart';
import 'package:e_commerc_2/model/preference_helper.dart';
import 'package:e_commerc_2/view/screens/home_screen.dart';
import 'package:e_commerc_2/view/widgets/animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index =0;
  PageController pageController=PageController();
  List<Widget>pages=[
   AnimationWidgets(AssetConstants.anim1),
   AnimationWidgets(AssetConstants.anim2),
   AnimationWidgets(AssetConstants.anim4),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: Dimns.screenHeight(context)*0.4,
            child: PageView.builder(itemBuilder:(context,index) =>pages[index],
            itemCount: pages.length,
            onPageChanged: (newIndex){
              setState((){
                index=newIndex;
              });
            },
            controller: pageController,),
          ),
       SizedBox
         (
         height: 10,
         width: 60,
         child: ListView.separated(itemBuilder: (context,index)=>doWidget(index),
         itemCount: pages.length,
         scrollDirection: Axis.horizontal,
         separatorBuilder: (context,index)=>SizedBox(width: 5,),
         ),
       ),
          if(index==pages.length-1)...[
          Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: ElevatedButton(onPressed: (){
              PreferencesHelper.instance.setIsOpened(true);
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                 builder: (context)=>HomeScreen()
             )
                 , (route) => false);
            },
                style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
                child: Text("Let's Go")),
          )
         ]
        ],
      ),
    );
  }
  Widget doWidget(int val)=>
    Container(
        height:20,
        width:10,
        decoration:BoxDecoration(
            color:val==index?Colors.lightBlue:Colors.lightBlue.withOpacity(0.5),
            shape: BoxShape.circle
        )
    );
  
}
