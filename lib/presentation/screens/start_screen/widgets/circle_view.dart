
import 'package:flutter/cupertino.dart';
import 'package:task_app/presentation/screens/start_screen/widgets/circle_item_left.dart';
import 'package:task_app/presentation/screens/start_screen/widgets/circle_item_right.dart';
import 'package:task_app/styles/asset_manager.dart';
import 'package:task_app/styles/size_config/app_size_config.dart';

class CircleView extends StatelessWidget {
  const CircleView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        CircleItemRight(
            top: SizeConfig.height * 0.3,
            right: SizeConfig.height * 0.14,
            radius: SizeConfig.height * 0.09,
          imageUrl: AssetsManager.personImage1,
        ),

        CircleItemLeft(
          top: SizeConfig.height*0.32,
          left: -SizeConfig.height*0.045,
          radius: SizeConfig.height*0.06,
          imageUrl: AssetsManager.personImage2,
        ),

        CircleItemLeft(
          top: SizeConfig.height*0.06,
          left: -SizeConfig.height*0.015,
          radius: SizeConfig.height*0.05,
          imageUrl: AssetsManager.personImage3,
        ),

        CircleItemRight(
          top: SizeConfig.height*0.05,
          right: -SizeConfig.height*0.045,
          radius: SizeConfig.height*0.08,
          imageUrl: AssetsManager.personImage4,
        ),

        CircleItemRight(
          top: SizeConfig.height*0.45,
          right: -SizeConfig.height*0.05,
          radius: SizeConfig.height*0.065,
          imageUrl: AssetsManager.personImage5,
        ),

        CircleItemLeft(
            top: SizeConfig.height*0.1,
            left: SizeConfig.height*0.14,
            radius: SizeConfig.height*0.08,
            imageUrl: AssetsManager.personImage6,
        ),


      ]
    );
  }
}
