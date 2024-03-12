import 'package:flutter/material.dart';
import 'package:task_app/styles/colors/color_manager.dart';
import 'package:task_app/styles/size_config/app_size_config.dart';
import 'package:task_app/styles/theme_manager/font_manager.dart';



class DefaultTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  bool withSuffix;
  bool isPassword;
  bool? enable;
  IconData? suffixIcon;
  final Function() onTap;
  int? maxLines;

   DefaultTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    required this.textInputAction,
    this.withSuffix = false,
    this.isPassword = false,
    this.suffixIcon,
    this.enable = true,
    this.maxLines = 1,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      enabled: widget.enable,
      style: TextStyle(
        fontSize: FontSize.headline4Size,
        color: ColorManager.black,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: FontSize.headline6Size,
          color: ColorManager.red,
        ),

        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: FontSize.headline4Size,
          color: ColorManager.lightGrey,
        ),
        suffixIcon: widget.isPassword==true ? isPasswordVisible ? InkWell(
          onTap: (){
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          child: Icon(
            Icons.visibility,
            color: ColorManager.border,
            size: SizeConfig.height*0.022,
          ),
        ): InkWell(
          onTap: (){
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
            child: Icon(Icons.visibility_off, color: ColorManager.border, size: SizeConfig.height*0.022,)) :null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.height*0.01,
          vertical: SizeConfig.height*0.016
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.gray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.gray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.gray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.border,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
        ),
        fillColor: Colors.blue,
      ),
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      maxLines: widget.maxLines,
      obscureText: isPasswordVisible ? false : widget.isPassword,
    );
  }
}
