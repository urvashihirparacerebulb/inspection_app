import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspection_app/modules/support/support_view.dart';
import 'package:inspection_app/utility/assets_utility.dart';
import 'package:inspection_app/utility/color_utility.dart';
import 'package:inspection_app/utility/screen_utility.dart';

import '../common_widgets/common_widget.dart';
import '../modules/inspect/enter_inspect_detail_screen.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          title: "",
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: getScreenHeight(context),
              child: commonCircularWidget(
                  marginPadding: 60,
                  // padding: 80,
                  isCustomPadding: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        commonHeaderTitle(title: "Andrew",
                            isChangeColor: true,
                            align: TextAlign.center,
                            fontWeight: 3,color: blackColor,fontSize: 1.4),
                        commonVerticalSpacing(spacing: 40),
                        Image(image: emailImage,height: 50,width: 50),
                        commonVerticalSpacing(),
                        commonHeaderTitle(title: "Andrew564@gmail.com",
                            align: TextAlign.center,
                            isChangeColor: true,color: blackColor,fontWeight: 1),
                        commonVerticalSpacing(spacing: 30),
                        InkWell(
                          onTap: (){

                          },
                            child: Image(image: callImage,height: 50,width: 50)),
                        commonVerticalSpacing(),
                        commonHeaderTitle(title: "+91 98765 56413",
                            align: TextAlign.center,
                            isChangeColor: true,color: blackColor,fontWeight: 1),
                        commonVerticalSpacing(spacing: 30),
                        InkWell(
                          onTap: (){
                            Get.to(() => const EnterInspectDetailView());
                          },
                            child: Image(image: inspectImage,height: 50,width: 50)),
                        commonVerticalSpacing(),
                        commonHeaderTitle(title: "Inspector",
                            align: TextAlign.center,
                            isChangeColor: true,color: blackColor,fontWeight: 1),
                        commonVerticalSpacing(spacing: 30),
                        Image(image: logoutImage,height: 40),
                      ],
                    ),
                  )
              ),
            ),

            Positioned(
                top: -8,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: blackColor
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle
                    ),
                  ),
                )
            )
          ],
        )
    );
  }
}
