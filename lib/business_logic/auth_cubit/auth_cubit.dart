import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/business_logic/auth_cubit/auth_states.dart';
import 'package:task_app/data/models/user_model.dart';
import 'package:task_app/helper/local/shared_preference.dart';
import 'package:task_app/helper/navigation/material_navigation.dart';
import 'package:task_app/presentation/screens/login_screen/login_screen.dart';
import 'package:task_app/presentation/widgets/custom_toast.dart';
import 'package:task_app/styles/colors/color_manager.dart';

class AuthCubit extends Cubit<AuthState>{

  AuthCubit() : super(InitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  /// login
  Future<void> loginWithFirebase({
    required String email,
    required String password,
   })async{

    emit(LoginWithFirebaseLoadingState());
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {

      debugPrint('Login With Firebase Success');
      emit(LoginWithFirebaseSuccessState(uId: value.user!.uid));
    }).catchError((error){
      customToast(title: 'Email or password is incorrect', color: ColorManager.error);
      debugPrint('Error in loginWithFirebase ${error.toString()}');
      emit(LoginWithFirebaseErrorState());
    });
  }


  /// sign up
  Future<void> signUpWithFirebase({
    required String email,
    required String phone,
    required String userName,
    required String password,
  })async{

    emit(SignUpWithFirebaseLoadingState());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {

      saveUserInfoToFirebase(
          email: email,
          phone: phone,
          userName: userName,
          uId: value.user!.uid,
      );
      debugPrint('Login With Firebase Success');
      emit(SignUpWithFirebaseSuccessState());
    }).catchError((error){
      customToast(title: 'Failed to sign up,Try again later!', color: ColorManager.error);
      debugPrint('Error in loginWithFirebase ${error.toString()}');
      emit(SignUpWithFirebaseErrorState());
    });
  }


  /// save user info
  Future<void> saveUserInfoToFirebase({
    required String email,
    required String phone,
    required String userName,
    required String uId,
  })async{

    UserModel userModel=UserModel(
      userName: userName,
      phone: phone,
      email: email,
      uId:uId
    );

    emit(SaveUserInfoToFirebaseLoadingState());
    await FirebaseFirestore.instance.
    collection('users').
    doc(uId).
    set(userModel.toMap()
    ).then((value) {

      debugPrint('Save User Info To Firebase Success');
      emit(SaveUserInfoToFirebaseSuccessState());

    }).catchError((error){

      debugPrint('Error in saveUserInfoToFirebase ${error.toString()}');
      emit(SaveUserInfoToFirebaseErrorState());
    });
  }

  UserModel ?userModel;

  /// get user info
  Future<void> getUserInfo({
    required String uId,
  })async{

    emit(GetUserInfoFromFirebaseLoadingState());
    await FirebaseFirestore.instance.
    collection('users').
    doc(uId).
    get().then((value) {

      userModel=UserModel.fromJson(value.data()!);
      UserDataFromStorage.setFirstName(userModel!.userName);
      UserDataFromStorage.setEmail(userModel!.email);
      UserDataFromStorage.setPhoneNumber(userModel!.phone);
      debugPrint('get User Info To Firebase Success');
      emit(GetUserInfoFromFirebaseSuccessState());

    }).catchError((error){

      debugPrint('Error in getUserInfoFromFirebase ${error.toString()}');
      emit(GetUserInfoFromFirebaseErrorState());
    });
  }

  /// sign out
  Future<void> signOut({
    required context,
  })async{

    emit(SignOutWithFirebaseLoadingState());
    await FirebaseAuth.instance.signOut().then((value) {

      UserDataFromStorage.firstNameFromStorage='';
      UserDataFromStorage.userEmileFromStorage='';
      UserDataFromStorage.phoneNumberFromStorage='';
      customPushAndRemoveUntil(context, LoginScreen());

      debugPrint('Sign Out With Firebase Success');
      emit(SignOutWithFirebaseSuccessState());
    }).catchError((error){

      debugPrint('Error in Sign Out ${error.toString()}');
      emit(SignOutWithFirebaseErrorState());
    });
  }


}