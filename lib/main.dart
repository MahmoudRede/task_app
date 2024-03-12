import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/business_logic/app_cubit/app_cubit.dart';
import 'package:task_app/business_logic/auth_cubit/auth_cubit.dart';
import 'package:task_app/business_logic/auth_cubit/auth_states.dart';
import 'package:task_app/firebase_options.dart';
import 'package:task_app/helper/local/shared_preference.dart';
import 'package:task_app/helper/remote/dio_helper.dart';
import 'package:task_app/presentation/screens/start_screen/start_screen.dart';
import 'package:task_app/styles/theme_manager/theme_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await UserDataFromStorage.getData();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => AppCubit()..getCurrentWeather(country: 'Cairo')

        ),
        BlocProvider(
            create: (BuildContext context) =>
            AuthCubit()),

      ],
      child: BlocConsumer<AuthCubit,AuthState>(
          listener: (context,state){

          },
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getApplicationTheme(context),
            home: const  StartScreen(),
          );
        }
      ),
    );
  }
}
