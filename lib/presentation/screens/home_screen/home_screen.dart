import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:task_app/business_logic/app_cubit/app_cubit.dart';
import 'package:task_app/business_logic/app_cubit/app_states.dart';
import 'package:task_app/presentation/screens/home_screen/widget/my_drawer.dart';
import 'package:task_app/presentation/screens/home_screen/widget/weather_item.dart';
import 'package:task_app/styles/asset_manager.dart';
import 'package:task_app/styles/colors/color_manager.dart';
import 'package:task_app/styles/size_config/app_size_config.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key,}) ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getCurrentWeather(country: 'Cairo' );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state){

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(),
            backgroundColor: ColorManager.primaryColor,

            /// drawer
            drawer: const MyDrawer(),

            body: cubit.weatherModel!=null?
            Builder(
                builder: (context) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.height*0.03
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [

                              /// temp
                              Expanded(
                                child: Text(
                                    '${cubit.weatherModel!.current!.tempC}'+'\u00B0',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: SizeConfig.height*0.085,
                                    ),
                                ),
                              ),

                              /// image
                              Lottie.network(
                                  height: SizeConfig.height*0.15,
                                  width: SizeConfig.height*0.15,
                                  cubit.selectWeatherImage('${AppCubit.get(context).weatherModel!.current!.condition!.text}')
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.height*0.047
                          ),
                          child: Row(
                            children: [

                              /// city
                              Text(
                                '${cubit.weatherModel!.location!.name}',
                                   style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: SizeConfig.height*0.04,
                                   ),
                              ),

                              /// icon
                              const Icon(
                                    Icons.location_on,
                                    color: ColorManager.white,
                              ),

                            ],
                          ),
                        ),

                        SizedBox(height: SizeConfig.height*0.02,),

                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.height*0.047
                              ),
                              child: Row(
                                children: [

                                  ///tempC
                                  Text(
                                      '${cubit.weatherModel!.current!.tempC}\u00B0',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                        color: ColorManager.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: SizeConfig.height*0.02,
                                  ),),

                                  const Text(
                                      '/',
                                  ),

                                  /// tempF
                                  Text(
                                      '${cubit.weatherModel!.current!.tempF}\u00B0',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                        color: ColorManager.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: SizeConfig.height*0.02,
                                  ),),

                                  /// text
                                  Text(
                                      ' Feels like ${cubit.weatherModel!.current!.feelslikeC}\u00B0',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                        color: ColorManager.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: SizeConfig.height*0.02,
                                  ),),
                                ],
                              ),
                            ),
                             SizedBox(height: SizeConfig.height*0.01,),
                            Padding(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: SizeConfig.height*0.047
                              ),
                              child: Row(
                                children: [
                                  /// date
                                  Text(
                                      DateFormat('EE, HH:mm').format(DateTime.now()),style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                        color: ColorManager.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: SizeConfig.height*0.02,
                                  ),),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: SizeConfig.height * .05,),

                        /// weather condition
                        Container(
                            height: SizeConfig.height * .25,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.height * .025
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.height * .025,
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0xff494949),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                ///UV Index
                                const WeatherItem(
                                  image: AssetsManager.uvIcon,
                                  title: 'UV Index',
                                  description: 'Low',
                                ),

                                 SizedBox(width: SizeConfig.height * .02),

                                ///divider
                                VerticalDivider(
                                  color: ColorManager.white,
                                  indent: SizeConfig.height * .04,
                                  endIndent: SizeConfig.height * .04,
                                ),

                                SizedBox(width: SizeConfig.height * .02),

                                ///wind
                                WeatherItem(
                                  image: AssetsManager.windIcon,
                                  title: 'Wind',
                                  description: '${cubit.weatherModel!.current!.windKph} km/h',
                                ),

                                SizedBox(width: SizeConfig.height * .02),

                                ///divider
                                VerticalDivider(
                                  color: ColorManager.white,
                                  indent: SizeConfig.height * .04,
                                  endIndent: SizeConfig.height * .04,
                                ),

                                SizedBox(width: SizeConfig.height * .02),

                                ///humidity
                                WeatherItem(
                                  image: AssetsManager.humidityIcon,
                                  title: 'Humidity',
                                  description: '${cubit.weatherModel!.current!.humidity} %',
                                ),


                              ],
                            )
                        ),
                      ],
                    ),
                  );
                }
            ):
            const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            )
        );
      },


    );
  }



}