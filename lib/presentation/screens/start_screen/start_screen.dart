import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/business_logic/app_cubit/app_cubit.dart';
import 'package:task_app/helper/navigation/material_navigation.dart';
import 'package:task_app/presentation/screens/login_screen/login_screen.dart';
import 'package:task_app/presentation/screens/start_screen/widgets/circle_view.dart';
import 'package:task_app/presentation/widgets/default_button.dart';
import 'package:task_app/styles/colors/color_manager.dart';
import 'package:task_app/styles/size_config/app_size_config.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// images
          const Expanded(
              child: CircleView()
          ),

          /// title
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.height*.03,
            ),
            child: Text(
              'Let\'s Get\nStarted',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.sizeOf(context).height*.07
            )),
          ),

          /// content
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: SizeConfig.height*.04,
            ),
            child: Text('Everything works better together',style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ColorManager.grey,
                fontWeight: FontWeight.normal,
                fontSize: MediaQuery.sizeOf(context).height*.02
            )),
          ),

          SizedBox(height: SizeConfig.height*.04,),

          /// sign in button
          Padding(
            padding:EdgeInsets.symmetric(
              horizontal: SizeConfig.height*.04,
            ),
            child: DefaultButton(
                onPressed: (){
                  customPushNavigator(context,  LoginScreen());
                },
                backGroundColor: ColorManager.primaryColor,
                height: SizeConfig.height*.06,
                width: double.infinity,
                content: Text('Sign in',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: ColorManager.white,
                  fontSize: SizeConfig.height*0.022,
                ),)
            ),
          ),

          SizedBox(height: SizeConfig.height*.04,),


        ],
      ),
    );
  }
}