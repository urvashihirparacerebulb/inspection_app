import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utility/color_utility.dart';
import '../utility/theme_utility.dart';
import 'common_widget.dart';

OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent),
  borderRadius: commonBorderRadius,
);

class CommonTextFiled extends StatefulWidget {
  final String fieldTitleText;
  final String hintText;
  final bool isPassword;
  final bool isRequired;
  final TextEditingController textEditingController;
  final Function? validationFunction;
  final int? maxLength;
  final Function? onSavedFunction;
  final Function? onFieldSubmit;
  final TextInputType? keyboardType;
  final Function? onTapFunction;
  final Function? onChangedFunction;
  final List<TextInputFormatter>? inputFormatter;
  final bool isEnabled;
  final bool isReadOnly;
  final int? errorMaxLines;
  final int? maxLine;
  final FocusNode? textFocusNode;
  final GlobalKey<FormFieldState>? formFieldKey;
  final TextAlign align;
  final Widget? suffixIcon;
  final Color fontColor;
  final Color borderColor;
  final Widget? preFixIcon;
  final bool isShowTitle;
  final Color? fillColor;
  final bool isChangeFillColor;

  const CommonTextFiled(
      {required this.fieldTitleText,
        required this.hintText,
        this.isPassword = false,
        this.isRequired = true,
        required this.textEditingController,
        this.validationFunction,
        this.maxLength,
        this.onSavedFunction,
        this.onFieldSubmit,
        this.keyboardType,
        this.onTapFunction,
        this.onChangedFunction,
        this.isChangeFillColor = false,
        this.inputFormatter,
        this.isEnabled = true,
        this.isReadOnly = false,
        this.errorMaxLines,
        this.maxLine,
        this.textFocusNode,
        this.formFieldKey,
        this.align = TextAlign.start,
        this.suffixIcon,
        this.preFixIcon,
        this.isShowTitle = false,
        this.fontColor = subFontColor,
        this.borderColor = subFontColor,
        this.fillColor});

  @override
  _CommonTextFiledState createState() => _CommonTextFiledState();
}

class _CommonTextFiledState extends State<CommonTextFiled> {
  bool? passwordVisible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        passwordVisible = widget.isPassword;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return TextFormField(
        enabled: !widget.isEnabled ? false : true,
        textAlign: widget.align,
        textInputAction: TextInputAction.done,
        controller: widget.textEditingController,
        showCursor: !widget.isReadOnly,
        maxLines: widget.maxLine ?? 1,
        keyboardType: widget.keyboardType,
        key: widget.key,
        cursorColor: widget.fontColor,
        obscureText: passwordVisible!,
        onTap: () {
          if (widget.onTapFunction != null) {
            widget.onTapFunction!();
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: widget.fontColor,fontWeight: FontWeight.w400,fontSize: 14),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorMaxLines: widget.errorMaxLines ?? 1,
          contentPadding: const EdgeInsets.only(left: 15,top: 13),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:widget.borderColor),
          ),
          prefixIcon: widget.preFixIcon,
          suffixIcon: widget.isPassword
              ? InkWell(
              onTap: () {
                setState(() {
                  passwordVisible = !passwordVisible!;
                });
              },
              child: passwordVisible!
                  ? Icon(
                Icons.visibility_off,
                color: widget.fontColor,
              )
                  : const Icon(
                Icons.remove_red_eye_sharp,
                size: 16,
                color: blackColor,
              ))
              : widget.suffixIcon,

        ),
        onChanged: (value) {
          if (widget.onChangedFunction != null) {
            widget.onChangedFunction!(value);
          }
        },
        validator: (value) {
          return widget.validationFunction != null
              ? widget.validationFunction!(value)
              : null;
        },
        onSaved: (value) {
          // ignore: void_checks
          return widget.onSavedFunction != null
              ? widget.onSavedFunction!(value)
              : null;
        },
        onFieldSubmitted: (value) {
          // ignore: void_checks
          return widget.onFieldSubmit != null
              ? widget.onFieldSubmit!(value)
              : null;
        },
        style: black15PxW800.copyWith(
            color: widget.fontColor,fontWeight: FontWeight.normal),
        inputFormatters: widget.inputFormatter,
        // enabled: !widget.isEnabled ? false : true,
        // textAlign: widget.align,
        // textInputAction: TextInputAction.done,
        // showCursor: !widget.isReadOnly,
        // onTap: () {
        //   if (widget.onTapFunction != null) {
        //     widget.onTapFunction!();
        //   }
        // },
        // key: widget.key,
        // focusNode: widget.textFocusNode,
        // onChanged: (value) {
        //   if (widget.onChangedFunction != null) {
        //     widget.onChangedFunction!(value);
        //   }
        // },
        // validator: (value) {
        //   return widget.validationFunction != null
        //       ? widget.validationFunction!(value)
        //       : null;
        // },
        // // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
        // onSaved: (value) {
        //   // ignore: void_checks
        //   return widget.onSavedFunction != null
        //       ? widget.onSavedFunction!(value)
        //       : null;
        // },
        // onFieldSubmitted: (value) {
        //   // ignore: void_checks
        //   return widget.onFieldSubmit != null
        //       ? widget.onFieldSubmit!(value)
        //       : null;
        // },
        // maxLines: widget.maxLine ?? 1,
        // keyboardType: widget.keyboardType,
        // controller: widget.textEditingController,
        // cursorColor: widget.fontColor,
        // // initialValue: initialText,
        // obscureText: passwordVisible!,
        // style: black15PxW800.copyWith(
        //     color: primaryColor,fontWeight: FontWeight.normal),
        // inputFormatters: widget.inputFormatter,
        // decoration: InputDecoration(
        //   labelStyle: black15PxW800.copyWith(
        //       fontWeight: FontWeight.w500,
        //       color: primaryColor.withOpacity(0.4)),
        //   labelText: widget.fieldTitleText,
        //   alignLabelWithHint: true,
        //   floatingLabelBehavior: FloatingLabelBehavior.never,
        //   errorMaxLines: widget.errorMaxLines ?? 1,
        //   contentPadding: const EdgeInsets.only(left: 15,bottom: 10),
        //   enabledBorder: const UnderlineInputBorder(
        //     borderSide: BorderSide(color: Colors.cyan),
        //   ),
        //   focusedBorder: const UnderlineInputBorder(
        //     borderSide: BorderSide(color: Colors.cyan),
        //   ),
        //   hintText: widget.hintText,
        //   fillColor: widget.isChangeFillColor ? bgColor.withOpacity(0.8) : ConvertTheme.convertTheme.getTextFiledBackGroundColor(),
        //   hintStyle: white14PxNormal.copyWith(
        //       color: primaryColor,fontSize: 16),
        //   suffixIcon: widget.isPassword
        //       ? InkWell(
        //       onTap: () {
        //         setState(() {
        //           passwordVisible = !passwordVisible!;
        //         });
        //       },
        //       child: passwordVisible!
        //           ? const Icon(
        //         Icons.visibility_off,
        //         color: blackColor,
        //       )
        //           : const Icon(
        //         Icons.remove_red_eye_sharp,
        //         color: blackColor,
        //       ))
        //       : widget.suffixIcon,
        //   prefixIcon: widget.preFixIcon != null
        //       ? Padding(
        //     padding: const EdgeInsets.all(6.0),
        //     child: widget.preFixIcon,
        //   )
        //       : null,
        // ),
      );
  }
}

