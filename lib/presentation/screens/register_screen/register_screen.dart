import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/business_logic/auth_cubit/auth_cubit.dart';
import 'package:task_app/business_logic/auth_cubit/auth_states.dart';
import 'package:task_app/helper/navigation/material_navigation.dart';
import 'package:task_app/presentation/screens/login_screen/login_screen.dart';
import 'package:task_app/presentation/widgets/default_button.dart';
import 'package:task_app/presentation/widgets/default_text_field.dart';
import 'package:task_app/styles/asset_manager.dart';
import 'package:task_app/styles/colors/color_manager.dart';
import 'package:task_app/styles/size_config/app_size_config.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key}) ;

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
        listener: (context,state){
          if(state is SignUpWithFirebaseSuccessState){
            customPushNavigator(context, LoginScreen());
          }
        },
      builder: (context,state){
        var cubit=AuthCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 0.0,
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///image
                    Image(
                      height:SizeConfig.height*.22,
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
                          Column(
                            children: [
                              SizedBox(height: SizeConfig.height *.04,),

                              /// login text
                              Text(
                                'Sign UP',
                                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                    color: ColorManager.primaryColor,
                                    fontSize: SizeConfig.height*0.042,
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: SizeConfig.height *.01,),

                              /// content text
                              Text(
                                'Please, sign up to continue',
                                style:Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    color: ColorManager.grey,
                                    fontSize: SizeConfig.height*0.02,
                                    fontWeight: FontWeight.normal
                                ),
                              ),

                              SizedBox(height: SizeConfig.height *.05,),

                              /// UserName
                              DefaultTextField(
                                  controller: nameController,
                                  hintText: "UserName",
                                  isPassword: false,
                                  validator: (validator) {
                                    if (validator!.trim()=="") {
                                      return "Please,Enter your name";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  onTap: () {}),

                              SizedBox(height: SizeConfig.height * .03,),

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
                                  controller: passController,
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

                              SizedBox(height: SizeConfig.height * .03,),

                              /// phone number
                              DefaultTextField(
                                  controller: phoneController,
                                  hintText: "Phone Number",
                                  isPassword: false,
                                  validator: (validator) {
                                    if (validator!.trim()=="") {
                                      return "Please,Enter your phone number";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  onTap: () {}),

                              SizedBox(height: SizeConfig.height * .04,),

                              /// Sign up button

                              state is SignUpWithFirebaseLoadingState?
                              const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primaryColor,
                                ),
                              ):
                              DefaultButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate()){

                                    cubit.signUpWithFirebase(
                                        email: emailController.text,
                                        phone: phoneController.text,
                                        userName: nameController.text,
                                        password: passController.text
                                    );

                                  }
                                },
                                backGroundColor: ColorManager.primaryColor,
                                height: SizeConfig.height * .06,
                                width: SizeConfig.height * .5,
                                content: Text("Sign up", style: Theme.of(context).textTheme.headlineLarge!.copyWith(
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

                                  /// You have an account
                                  const Text(
                                    "You have an account ?",
                                  ),

                                  /// sign up
                                  InkWell(
                                    onTap: () {
                                      customPushNavigator(context, LoginScreen());
                                    },
                                    child:  const Text(
                                      " Sign in",
                                      style: TextStyle(
                                          color: ColorManager.primaryColor,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: SizeConfig.height * .04,),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )

        );
      }
    );
  }
}
