import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspection_app/common_widgets/common_widget.dart';
import 'package:inspection_app/modules/login/login_screen.dart';
import 'package:inspection_app/utility/assets_utility.dart';
import 'package:inspection_app/utility/screen_utility.dart';
import 'package:inspection_app/utility/theme_utility.dart';

import '../../common_widgets/common_textfield.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';

class SupportView extends StatefulWidget {
  const SupportView({Key? key}) : super(key: key);

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController issueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          title: "Support",
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
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonFillButtonView(
                            width: getScreenWidth(context) / 3,
                              context: context, title: "Call", tapOnButton: (){
                          }, isLoading: false),
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      Text.rich(
                          TextSpan(text: "Use the area below to show your issue, or email cat inspect support at ", style: black15PxW800.copyWith(color: subFontColor,fontWeight: FontWeight.w400,fontSize: 14), children: <InlineSpan>[
                            TextSpan(
                                text: "solution@cerebulb.com",
                                style: black15PxW800.apply(color: subFontColor,fontWeightDelta: 0),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                  }
                                  ),
                          ])),
                      commonVerticalSpacing(spacing: 20),
                      CommonTextFiled(
                        fieldTitleText: "Subject",
                        hintText: "Subject",
                        borderColor: subFontColor.withOpacity(0.5),
                        textEditingController: subjectController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        },
                      ),
                      commonVerticalSpacing(spacing: 20),
                      CommonTextFiled(
                        maxLine: 4,
                        fieldTitleText: "Describe your issue",
                        hintText: "Describe your issue",
                        borderColor: subFontColor.withOpacity(0.5),
                        textEditingController: issueController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        },
                      ),
                      commonVerticalSpacing(spacing: 30),
                      imageAndVideoView(context,callback: (File file){}),
                      commonVerticalSpacing(spacing: 70),
                    ],
                  ),
                ),

                Positioned(
                    bottom: 15,
                    child: commonFillButtonView(
                        context: context, title: "Send", tapOnButton: (){
                      Get.offAll(() => const LoginScreen());
                    }, isLoading: false)
                )
              ],
            )
        )
    );
  }
}
