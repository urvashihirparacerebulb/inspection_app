import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspection_app/common_widgets/common_widget.dart';
import 'package:inspection_app/modules/login/login_screen.dart';
import '../../utility/assets_utility.dart';
import '../../utility/color_utility.dart';
import '../../utility/screen_utility.dart';
import '../../utility/theme_utility.dart';

class LoginIntroductionView extends StatefulWidget {
  const LoginIntroductionView({Key? key}) : super(key: key);

  @override
  State<LoginIntroductionView> createState() => _LoginIntroductionViewState();
}

class _LoginIntroductionViewState extends State<LoginIntroductionView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
        child: SizedBox(
            width: MediaQuery.of(context).size.width - (commonHorizontalPadding * 2),
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: blackColor.withOpacity(0.8),
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(borderRadius: commonButtonBorderRadius),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  elevation: 5.0,
                ),
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: Text(
                        "Log in",
                        style: black15PxW800.copyWith(
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                          child: Image(image: arrowForwardImage,height: 30,width: 30,)),
                    ))
                  ],
                )
            )
        ),
      ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image(image: splashBgImage,
                width: getScreenWidth(context),
                height: getScreenHeight(context),
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 50,
              left: 10,right: 10,
              child: Image(image: appLogoWithNameImage,
                  width: getScreenWidth(context),
                  height: 90
              ),
            )
          ],
        )
    );
  }
}
