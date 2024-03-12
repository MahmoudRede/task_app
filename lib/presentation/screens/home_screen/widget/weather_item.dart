import 'package:flutter/material.dart';
import 'package:task_app/styles/asset_manager.dart';
import 'package:task_app/styles/colors/color_manager.dart';
import 'package:task_app/styles/size_config/app_size_config.dart';

class WeatherItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const WeatherItem({super.key,
   required this.title,required this.description,required this.image
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        /// image
        Image(
          image: AssetImage(image),
          height: SizeConfig.height * .07,
          width: SizeConfig.height * .07,
        ),
        SizedBox(height: SizeConfig.height * .01,),

        /// text
        Text(
          title,style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: ColorManager.white,
          fontWeight: FontWeight.w300,
          fontSize: SizeConfig.height*0.02,
        ),),

        SizedBox(height: SizeConfig.height * .01,),

        ///text
        Text(
          description,style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: ColorManager.white,
          fontWeight: FontWeight.w300,
          fontSize: SizeConfig.height*0.02,
        ),),

      ],
    );
  }
}
