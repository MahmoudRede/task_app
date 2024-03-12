import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_app/business_logic/auth_cubit/auth_cubit.dart';
import 'package:task_app/helper/local/shared_preference.dart';
import 'package:task_app/styles/asset_manager.dart';
import 'package:task_app/styles/colors/color_manager.dart';
import 'package:task_app/styles/size_config/app_size_config.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.primaryColor,
      child: SafeArea(
        child: Container(
          margin:  EdgeInsets.symmetric(
              horizontal: SizeConfig.height * 0.03,
              vertical: SizeConfig.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// image
              CircleAvatar(
                radius: SizeConfig.height * 0.05,
                backgroundImage: const AssetImage(AssetsManager.user),
              ),

              SizedBox(height: SizeConfig.height * 0.02,),

              /// userName
              Text(
                UserDataFromStorage.firstNameFromStorage,style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: ColorManager.white,
                  fontWeight: FontWeight.w300,
                  fontSize: SizeConfig.height*0.025,
              ),),

              ///email
              Text(
                UserDataFromStorage.userEmileFromStorage,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: ColorManager.grey,
                fontWeight: FontWeight.w300,
                fontSize: SizeConfig.height*0.017,
              ),),

              SizedBox(height: SizeConfig.height * 0.02,),

              const Divider(color: ColorManager.white,),

              SizedBox(height: SizeConfig.height * 0.04,),

              /// home
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// icon
                    const Icon(
                      Icons.home_filled,
                      color: ColorManager.white,
                    ),

                    SizedBox(width: SizeConfig.height * 0.01,),

                    ///text
                    Text(
                      'Home',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ColorManager.white,
                      fontWeight: FontWeight.w300,
                      fontSize: SizeConfig.height*0.02,
                    ),),
                  ]
                ),
              ),

              SizedBox(height: SizeConfig.height * 0.03,),

              /// Sign out
              GestureDetector(
                onTap: (){
                  AuthCubit.get(context).signOut(context:context);
                },
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// icon
                      const Icon(
                        Icons.logout_sharp,
                        color: ColorManager.white,
                      ),

                      SizedBox(width: SizeConfig.height * 0.01,),

                      ///text
                      Text(
                        'Sign out',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ColorManager.white,
                        fontWeight: FontWeight.w300,
                        fontSize: SizeConfig.height*0.02,
                      ),),
                    ]
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
