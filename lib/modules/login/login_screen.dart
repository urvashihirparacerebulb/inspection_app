import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspection_app/utility/assets_utility.dart';

import '../../common_widgets/common_textfield.dart';
import '../../common_widgets/common_widget.dart';
import '../../controllers/authentication_controller.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';
import '../../utility/screen_utility.dart';
import '../forgot_password/forgot_password_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRemember = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(context: context,
        bottomNavigation: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: commonFillButtonView(
              context: context,
              title: "Log In",
              tapOnButton: (){
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Map<String, dynamic> params = {
                    "email_address": userNameController.text,
                    "password": passwordController.text,
                  };
                  AuthenticationController.to.loginAPI(params);
                }
              },
              isLoading: false
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Align(
                  alignment: Alignment.center,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      Image(image: appLogoWithNameImage,height: 60,
                        width: getScreenWidth(context)/2,fit: BoxFit.contain),
                      commonVerticalSpacing(spacing: 20),
                      commonHeaderTitle(title: "Welcome",fontSize: 1.7,align: TextAlign.center,height: 1.3,fontWeight: 3),
                      commonVerticalSpacing(spacing: 5),
                      commonHeaderTitle(title: "Enter your credentials to continue",fontSize: 1.0,align: TextAlign.center,
                          height: 1.3,fontWeight: 0),
                      commonVerticalSpacing(spacing: 40),
                      CommonTextFiled(
                        fieldTitleText: "User Name",
                        hintText: "User Name",
                        fontColor: whiteColor,
                        textEditingController: userNameController,
                        preFixIcon: const Icon(Icons.email_outlined,color: whiteColor,),
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        },),
                      commonVerticalSpacing(spacing: 25),
                      CommonTextFiled(
                        fieldTitleText: "Password",
                        hintText: "Password",
                        isPassword: true,
                        fontColor: whiteColor,
                        preFixIcon: const Icon(Icons.lock_open,color: whiteColor,),
                        textEditingController: passwordController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        },),
                      commonVerticalSpacing(spacing: 35),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(() => const ForgotPasswordScreen());
                            },
                            child: commonHeaderTitle(title: "Forgot Password?",fontSize: 1.1,fontWeight: 1),
                          )
                        ],
                      ),
                      commonVerticalSpacing(spacing: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}