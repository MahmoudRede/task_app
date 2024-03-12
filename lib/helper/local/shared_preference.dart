import 'package:shared_preferences/shared_preferences.dart';


class UserDataFromStorage {

  static late String driverUserName;
  static late String driverEmail;
  static late String driverPhone;
  static late String driverAbout;
  static late String driverAddress;
  static late String driverKind;
  static late String driverCarImage;
  static late String driverPersonalImage;
  static late String driverCity;
  static late bool userIsGuest;
  static late bool userIsCompany;
  static late bool themeIsDarkMode;
  static late bool onBoardingIsOpen;
  static String languageCodeFromStorage='en';
  static String languageNameFromStorage="langEnglish";



  static late int userIdFromStorage;
  static late String userUIdFromStorage;
  static late String userGroupId;
  static late String userBoard;
  static late String userSession;
  static late String userParentName;
  static late String userParentPhone;
  static late String organizationNameFromStorage;
  static late String firstNameFromStorage;
  static late String lastNameFromStorage;
  static late String phoneNumberFromStorage;
  static late String userEmileFromStorage;
  static late String userTokenFromStorage;
  static late int countryIdFromStorage;
  static late int userTypeFromStorage;
  static late String countryNameFromStorage;
  static late String userCountryCodeFromStorage;
  static late String dateOfBirthFromStorage;
  static late String userImageFromStorage;
  static late bool allowNotifications;
  static late bool profileIsPublishedFromStorage;


  static late int signInClickCountFromStorage;
  static late int verifySignUpSeekerClickCount;
  static late int verifySignUpRecruiterClickCount;
  static late int verifyForgetPasswordClickCount;
  static late int forgetPasswordEmailClickCount;
  static late int changePasswordEmailClickCount;

  static late int userGender;

  static late String signInLimitDateFromStorage;
  static late String verifySignUpSeekerLimitDate;
  static late String verifySignUpRecruiterLimitDate;
  static late String verifyForgetPasswordLimitDate;
  static late String forgetPasswordEmailLimitDate;
  static late String changePasswordEmailLimitDate;


  static setDriverUserName(String value) {
    driverUserName=value;
    _setData();
  }

  static setDriverEmail(String value) {
    driverEmail=value;
    _setData();
  }

  static setDriverPhone(String value) {
    driverPhone=value;
    _setData();
  }

  static setDriverAbout(String value) {
    driverAbout=value;
    _setData();
  }

  static setDriverKind(String value) {
    driverKind=value;
    _setData();
  }

  static setDriverCity(String value) {
    driverCity=value;
    _setData();
  }

  static setDriverCarImage(String value) {
    driverCarImage=value;
    _setData();
  }

  static setDriverPersonalImage(String value) {
    driverPersonalImage=value;
    _setData();
  }


  static setOnBoardingOpened(bool value) {
    onBoardingIsOpen=value;
    _setData();
  }


 static setIsPublished(bool value) {
   profileIsPublishedFromStorage=value;
    _setData();
  }
 static setIsCompany(bool value) {
   userIsCompany=value;
    _setData();
  }


  static setSignInClickCount(int count) {
    signInClickCountFromStorage=count;
    _setData();
  }

  static setUserGender(int count) {
    userGender=count;
    _setData();
  }

  static setForgetPasswordClickCount(int count) {
    forgetPasswordEmailClickCount=count;
    _setData();
  }
  static setChangePasswordClickCount(int count) {
    changePasswordEmailClickCount=count;
    _setData();
  }

  static setUserId(int count) {
    userIdFromStorage=count;
    _setData();
  }

  static setUserUId(String count) {
    userUIdFromStorage=count;
    _setData();
  }
  static setUserGroupId(String count) {
    userGroupId=count;
    _setData();
  }
  static setStudentBoard(String count) {
    userBoard=count;
    _setData();
  }
  static setStudentSession(String count) {
    userSession=count;
    _setData();
  }

  static setStudentParentName(String count) {
    userParentName=count;
    _setData();
  }
  static setStudentParentPhone(String count) {
    userParentPhone=count;
    _setData();
  }

  static setUserType(int count) {
    userTypeFromStorage=count;
    _setData();
  }

  static setCountryId(int count) {
    countryIdFromStorage=count;
    _setData();
  }

  static setCountryName(String value) {
    countryNameFromStorage=value;
    _setData();
  }
  static setDateOfBirth(String value) {
    dateOfBirthFromStorage=value;
    _setData();
  }

  static setVerifySignUpSeekerClickCount(int count) {
    verifySignUpSeekerClickCount=count;
    _setData();
  }

  static setVerifySignUpRecruiterClickCount(int count) {
    verifySignUpRecruiterClickCount=count;
    _setData();
  }

  static setVerifyForgetPasswordClickCount(int count) {
    verifyForgetPasswordClickCount=count;
    _setData();
  }

  static  setSignInLimitDateFromStorage(String value)  {
    signInLimitDateFromStorage=value;
    _setData();
  }

  static setChangePasswordLimitDateFromStorage(String value)  {
    changePasswordEmailLimitDate=value;
    _setData();
  }

  static setForgetPasswordEmailLimitDate(String value)  {
    forgetPasswordEmailLimitDate=value;
    _setData();

  }

  static  setVerifySignUpSeekerLimitDate(String value)  {
    verifySignUpSeekerLimitDate=value;
    _setData();
  }

  static  setVerifySignUpRecruiterLimitDate(String value)  {
    verifySignUpRecruiterLimitDate=value;
    _setData();
  }

  static  setVerifyForgetPasswordLimitDate(String value)  {
    verifyForgetPasswordLimitDate=value;
    _setData();
  }

  static setUserIsGuest(bool block) {
    userIsGuest = block;
    _setData();
  }
  static setThemeIsDarkMode(bool darkMode) {
    themeIsDarkMode = darkMode;
    _setData();
  }


  static  setAppLanguageCode(String value)  {
    languageCodeFromStorage=value;
    _setData();
  }

  static  setUserCountryCode(String value)  {
    userCountryCodeFromStorage=value;
    _setData();
  }

  static setOrganizationNameFromStorage(String value)  {
    organizationNameFromStorage=value;
    _setData();
  }

  static  setAppLanguageName(String value)  {
    languageNameFromStorage=value;
    _setData();
  }
  static  setUserImage (String value)  {
    userImageFromStorage=value;
    _setData();
  }


  static setFirstName(String value) {
    firstNameFromStorage = value;
    _setData();
  }

  static setLastName(String value) {
    lastNameFromStorage = value;
    _setData();
  }

  static setAllowNotifications(bool allow) {
    allowNotifications = allow;
    _setData();
  }

  static  setToken(String value)  {
    userTokenFromStorage=value;
    _setData();
  }
  static  setEmail(String value)  {
    userEmileFromStorage=value;
    _setData();
  }
  static  setPhoneNumber(String value)  {
    phoneNumberFromStorage=value;
    _setData();
  }



  /// this function to remove all storage
  static removeAllDataFromStorage() async{
    final prefs= await SharedPreferences.getInstance();
    await prefs.clear();
  }
  /// this function to remove any data from local storage by key
  static removeDataFromStorage(String key) async{
    final prefs= await SharedPreferences.getInstance();
    await prefs.remove(key);
  }


  //#region private
  static void _setData()async {

    final prefs= await SharedPreferences.getInstance();
    prefs.setBool("userIsGuest",userIsGuest);
    prefs.setBool("userIsCompany",userIsCompany);

    prefs.setString('driverUserName',driverUserName);
    prefs.setString('driverEmail',driverEmail);
    prefs.setString('driverPhone',driverPhone);
    prefs.setString('driverAbout',driverAbout);
    prefs.setString('driverAddress',driverAddress);
    prefs.setString('driverKind',driverKind);
    prefs.setString('driverCarImage',driverCarImage);
    prefs.setString('driverPersonalImage',driverPersonalImage);
    prefs.setString('driverCity',driverCity);



    prefs.setBool("themeIsDarkMode",themeIsDarkMode);
    prefs.setBool("onBoardingIsOpen",onBoardingIsOpen);
    prefs.setString("userImageFromStorage",userImageFromStorage);
    prefs.setString("userSession",userSession);
    prefs.setString("userGroupId",userGroupId);
    prefs.setString("userBoard",userBoard);
    prefs.setString("userParentPhone",userParentPhone);
    prefs.setString("userParentName",userParentName);
    prefs.setString("languageCodeFromStorage",languageCodeFromStorage);
    prefs.setString("languageNameFromStorage",languageNameFromStorage);
    prefs.setString("firstNameFromStorage",firstNameFromStorage);
    prefs.setString("userTokenFromStorage",userTokenFromStorage);
    prefs.setString("phoneNumberFromStorage",phoneNumberFromStorage);
    prefs.setString("lastNameFromStorage",lastNameFromStorage);
    prefs.setString("userEmileFromStorage",userEmileFromStorage);
    prefs.setBool("allowNotifications",allowNotifications);
    prefs.setString("userCountryCodeFromStorage",userCountryCodeFromStorage);
    prefs.setInt("signInClickCountFromStorage",signInClickCountFromStorage);
    prefs.setInt("verifySignUpSeekerClickCount",verifySignUpSeekerClickCount);
    prefs.setInt("verifySignUpRecruiterClickCount",verifySignUpRecruiterClickCount);
    prefs.setInt("verifyForgetPasswordClickCount",verifyForgetPasswordClickCount);
    prefs.setInt("forgetPasswordEmailClickCount",forgetPasswordEmailClickCount);
    prefs.setInt("changePasswordEmailClickCount",changePasswordEmailClickCount);
    prefs.setInt("userGender",userGender);
    prefs.setString("organizationNameFromStorage",organizationNameFromStorage);
    prefs.setString("signInLimitDateFromStorage",signInLimitDateFromStorage);
    prefs.setString("verifySignUpSeekerLimitDate",verifySignUpSeekerLimitDate);
    prefs.setString("verifySignUpRecruiterLimitDate",verifySignUpRecruiterLimitDate);
    prefs.setString("verifyForgetPasswordLimitDate",verifyForgetPasswordLimitDate);
    prefs.setString("forgetPasswordEmailLimitDate",forgetPasswordEmailLimitDate);
    prefs.setString("changePasswordEmailLimitDate",changePasswordEmailLimitDate);
    prefs.setString("userUIdFromStorage",userUIdFromStorage);

    prefs.setInt("userIdFromStorage",userIdFromStorage);
    prefs.setInt("countryIdFromStorage",countryIdFromStorage);
    prefs.setInt("userTypeFromStorage",userTypeFromStorage);
    prefs.setString("countryNameFromStorage",countryNameFromStorage);
    prefs.setString("dateOfBirthFromStorage",dateOfBirthFromStorage);
    prefs.setBool("profileIsPublishedFromStorage",profileIsPublishedFromStorage);



  }


  static   getData() async {


    final prefs = await SharedPreferences.getInstance();
    userIsGuest = prefs.getBool("userIsGuest")?? true;
    userIsCompany = prefs.getBool("userIsCompany")?? true;
    themeIsDarkMode = prefs.getBool("themeIsDarkMode")?? false;
    onBoardingIsOpen = prefs.getBool("onBoardingIsOpen")?? false;
    languageCodeFromStorage = prefs.getString("languageCodeFromStorage")??'en';
    languageNameFromStorage = prefs.getString("languageNameFromStorage")??'langEnglish';
    userCountryCodeFromStorage = prefs.getString("userCountryCodeFromStorage")??'+2';
    userImageFromStorage = prefs.getString("userImageFromStorage")??'';
    firstNameFromStorage = prefs.getString("firstNameFromStorage")??'';


    driverUserName = prefs.getString("driverUserName")??'';
    driverEmail = prefs.getString("driverEmail")??'';
    driverPhone = prefs.getString("driverPhone")??'';
    driverKind = prefs.getString("driverKind")??'';
    driverAddress = prefs.getString("driverAddress")??'';
    driverPersonalImage = prefs.getString("driverPersonalImage")??'';
    driverCarImage = prefs.getString("driverCarImage")??'';
    driverAbout = prefs.getString("driverAbout")??'';
    driverCity = prefs.getString("driverCity")??'';


    userTokenFromStorage = prefs.getString("userTokenFromStorage")??'null';
    phoneNumberFromStorage = prefs.getString("phoneNumberFromStorage")??'';
    lastNameFromStorage = prefs.getString("lastNameFromStorage")??'';
    userEmileFromStorage = prefs.getString("userEmileFromStorage")??'';
    allowNotifications = prefs.getBool("allowNotifications")?? true;
    signInClickCountFromStorage = prefs.getInt("signInClickCountFromStorage")?? 0;
    verifySignUpSeekerClickCount = prefs.getInt("verifySignUpSeekerClickCount")?? 0;
    verifySignUpRecruiterClickCount = prefs.getInt("verifySignUpRecruiterClickCount")?? 0;
    verifyForgetPasswordClickCount = prefs.getInt("verifyForgetPasswordClickCount")?? 0;
    forgetPasswordEmailClickCount = prefs.getInt("forgetPasswordEmailClickCount")?? 0;
    changePasswordEmailClickCount = prefs.getInt("changePasswordEmailClickCount")?? 0;
    userGender = prefs.getInt("userGender")?? 0;
    organizationNameFromStorage = prefs.getString("organizationNameFromStorage")?? "";
    signInLimitDateFromStorage = prefs.getString("signInLimitDateFromStorage")??DateTime.now().toString();
    verifySignUpSeekerLimitDate = prefs.getString("verifySignUpSeekerLimitDate")??DateTime.now().toString();
    verifySignUpRecruiterLimitDate = prefs.getString("verifySignUpRecruiterLimitDate")??DateTime.now().toString();
    verifyForgetPasswordLimitDate = prefs.getString("verifyForgetPasswordLimitDate")??DateTime.now().toString();
    forgetPasswordEmailLimitDate = prefs.getString("forgetPasswordEmailLimitDate")??DateTime.now().toString();
    changePasswordEmailLimitDate = prefs.getString("changePasswordEmailLimitDate")??DateTime.now().toString();
    userUIdFromStorage = prefs.getString("userUIdFromStorage")??DateTime.now().toString();

    userIdFromStorage = prefs.getInt("userIdFromStorage")?? 0;
    countryIdFromStorage = prefs.getInt("countryIdFromStorage")?? 0;
    userTypeFromStorage = prefs.getInt("userTypeFromStorage")?? 0;
    countryNameFromStorage = prefs.getString("countryNameFromStorage")?? "";
    dateOfBirthFromStorage = prefs.getString("dateOfBirthFromStorage")??DateTime.now().toString();
    profileIsPublishedFromStorage = prefs.getBool("profileIsPublishedFromStorage")?? false;


  }

//#endregion

}
