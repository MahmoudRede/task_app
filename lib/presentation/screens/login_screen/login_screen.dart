import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/business_logic/app_cubit/app_cubit.dart';
import 'package:task_app/business_logic/auth_cubit/auth_cubit.dart';
import 'package:task_app/business_logic/auth_cubit/auth_states.dart';
import 'package:task_app/helper/navigation/material_navigation.dart';
import 'package:task_app/presentation/screens/home_screen/home_screen.dart';
import 'package:task_app/presentation/screens/register_screen/register_screen.dart';
import 'package:task_app/presentation/widgets/default_button.dart';
import 'package:task_app/presentation/widgets/default_text_field.dart';
import 'package:task_app/styles/asset_manager.dart';
import 'package:task_app/styles/colors/color_manager.dart';
import 'package:task_app/styles/size_config/app_size_config.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
        listener: (context,state){
          if(state is LoginWithFirebaseSuccessState){
            AppCubit.get(context).getCurrentWeather(country: 'Cairo');
            AuthCubit.get(context).getUserInfo(uId: state.uId).then((value) {
              customPushAndRemoveUntil(context, const HomeScreen());
            });
          }
        },
        builder: (context,state){
          var cubit=AuthCubit.get(context);
            return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 0.0,
                ),
                body: SizedBox(
                  width: SizeConfig.width,
                  height: SizeConfig.height,
                  child: Form(
                    key: loginFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          /// image
                          Image(
                            height:SizeConfig.height*.32,
                            width: SizeConfig.width,
                            fit: BoxFit.cover,
                            image: const AssetImage(AssetsManager.background),
                          ),

                          ///body
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.height*.025,
                            ),
                            decoration: const BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60)
                                )
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: SizeConfig.height *.05,),

                                /// login text
                                Text(
                                  'Login',
                                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                      color: ColorManager.primaryColor,
                                      fontSize: SizeConfig.height*0.042,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),

                                SizedBox(height: SizeConfig.height *.01,),

                                /// content text
                                Text(
                                  'Please, sign in to continue',
                                  style:Theme.of(context).textTheme.headlineMedium!.copyWith(
                                      color: ColorManager.grey,
                                      fontSize: SizeConfig.height*0.02,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),

                                SizedBox(height: SizeConfig.height *.05,),

                                /// email
                                DefaultTextField(
                                    controller: emailController,
                                    hintText: "Email",
                                    isPassword: false,
                                    validator: (validator) {
                                      if (validator!.trim()=="") {
                                        return "Please,Enter your email";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    onTap: () {}),

                                SizedBox(height: SizeConfig.height * .03,),

                                /// password
                                DefaultTextField(
                                    controller: passwordController,
                                    hintText: "Password",
                                    isPassword: true,
                                    validator: (validator) {
                                      if (validator!.trim()=="") {
                                        return "Please,Enter your password";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    onTap: () {}),

                                SizedBox(
                                  height: SizeConfig.height * .04,
                                ),

                                /// login button

                                state is LoginWithFirebaseLoadingState?
                                const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorManager.primaryColor,
                                  ),
                                ):
                                DefaultButton(
                                  onPressed: () {
                                    if(loginFormKey.currentState!.validate()){

                                      cubit.loginWithFirebase(
                                          email: emailController.text,
                                          password: passwordController.text
                                      );

                                    }
                                  },
                                  backGroundColor: ColorManager.primaryColor,
                                  height: SizeConfig.height * .06,
                                  width: SizeConfig.height * .5,
                                  content: Text("Sign in", style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                      color: ColorManager.white,
                                      fontSize: SizeConfig.height*0.022,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),

                                SizedBox(height: SizeConfig.height * .04,),

                                /// don't have an account - sign up
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    /// don't have an account
                                    const Text(
                                      "Don't have an account ?",
                                    ),

                                    /// sign up
                                    InkWell(
                                      onTap: () {
                                        customPushNavigator(context,  RegisterScreen());
                                      },
                                      child:  const Text(
                                        " Sign up",
                                        style: TextStyle(
                                            color: ColorManager.primaryColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )

            );
        },
    );
  }
}
