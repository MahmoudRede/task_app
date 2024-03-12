import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/business_logic/app_cubit/app_states.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/data/models/weather_model.dart';
import 'package:task_app/helper/remote/dio_helper.dart';

class AppCubit extends Cubit<AppState>{

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherModel;

  Future<void> getCurrentWeather({
   required String country,
  })async{

    emit(GetCurrentWeatherLoadingState());
    await DioHelper.getDate(
        url: Constants.currentWeatherUrl,
        query: {
          'key':Constants.apiKey,
          'q':country,
          'aqi':'yes',
        }
    ).then((value) {

      weatherModel = WeatherModel.fromJson(value.data);

      debugPrint(weatherModel!.location!.country);
      debugPrint('Get Current Weather Success');
      emit(GetCurrentWeatherSuccessState());
    }).catchError((error){

      debugPrint('Error in getCurrentWeather ${error.toString()}');
      emit(GetCurrentWeatherErrorState());
    });

}

  String ?image='';

  String selectWeatherImage(String description){

    if(description=='Sunny'){
      image='https://assets4.lottiefiles.com/packages/lf20_i7ixqfgx.json';
    }
    else if(description=='Clear'){
      image='https://assets7.lottiefiles.com/temp/lf20_y6mY2A.json';
    }
    else if(description=='Partly cloudy'){
      image='https://assets7.lottiefiles.com/packages/lf20_7TJBhihA6C.json';
    }
    else if(description=='Thundery outbreaks possible'){
      image='https://assets3.lottiefiles.com/private_files/lf30_22gtsfnq.json';
    }
    else if(description=='Patchy light drizzle' || description=='Light drizzle' || description=='Light rain shower' || description=='Light rain'){
      image='https://assets9.lottiefiles.com/private_files/lf30_rb778uhf.json';
    }
    else if(description=='Patchy rain possible' || description=='Moderate rain' || description=='Moderate or heavy rain shower' || description=='Moderate rain at times' || description=='Heavy rain'){
      image='https://assets9.lottiefiles.com/private_files/lf30_jr9yjlcf.json';
    }
    else{
      image='https://assets7.lottiefiles.com/temp/lf20_y6mY2A.json';
    }

    emit(SelectWeatherImageState());
    return image!;
  }

}