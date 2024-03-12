abstract class AuthState{}

class InitialState extends AuthState{}

class LoginWithFirebaseLoadingState extends AuthState{}
class LoginWithFirebaseSuccessState extends AuthState{
  final String uId;
  LoginWithFirebaseSuccessState({required this.uId});
}
class LoginWithFirebaseErrorState extends AuthState{}

class SignUpWithFirebaseLoadingState extends AuthState{}
class SignUpWithFirebaseSuccessState extends AuthState{}
class SignUpWithFirebaseErrorState extends AuthState{}

class SaveUserInfoToFirebaseLoadingState extends AuthState{}
class SaveUserInfoToFirebaseSuccessState extends AuthState{}
class SaveUserInfoToFirebaseErrorState extends AuthState{}

class GetUserInfoFromFirebaseLoadingState extends AuthState{}
class GetUserInfoFromFirebaseSuccessState extends AuthState{}
class GetUserInfoFromFirebaseErrorState extends AuthState{}

class SignOutWithFirebaseLoadingState extends AuthState{}
class SignOutWithFirebaseSuccessState extends AuthState{}
class SignOutWithFirebaseErrorState extends AuthState{}