import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspection_app/common_widgets/common_widget.dart';
import 'package:inspection_app/modules/login/login_screen.dart';
import 'package:inspection_app/utility/assets_utility.dart';

import '../../common_widgets/common_textfield.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          title: "Forgot Password",
        ),
        child: commonCircularWidget(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Image(image: forgotPasswordImage,height: 144,width: 144),
                    commonVerticalSpacing(spacing: 40),
                    commonHeaderTitle(title: "Please enter your registered email id.",
                        isChangeColor: true,
                        fontWeight: 3,color: blackColor,fontSize: 1),
                    commonVerticalSpacing(spacing: 20),
                    commonHeaderTitle(title: "We will send a verification code to your registered email id.",
                        isChangeColor: true,
                        fontWeight: 0,color: blackColor,fontSize: 0.95),
                    commonVerticalSpacing(spacing: 50),
                    CommonTextFiled(
                      fieldTitleText: "Email Id",
                      hintText: "Email Id",
                      borderColor: subFontColor.withOpacity(0.5),
                      textEditingController: userNameController,
                      onChangedFunction: (String value){
                      },
                      preFixIcon: const Icon(Icons.email_outlined),
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      },
                    ),
                    commonVerticalSpacing(spacing: 50),
                  ],
                ),
              ),
              
              Positioned(
                bottom: 15,
                  child: commonFillButtonView(
                  context: context, title: "Send", tapOnButton: (){
                    Get.offAll(() => const LoginScreen());
                  }, isLoading: false))
            ],
          )
        )
    );
  }
}
