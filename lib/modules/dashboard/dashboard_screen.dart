import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspection_app/common_widgets/common_widget.dart';
import 'package:inspection_app/modules/inspect/inspection_history_view.dart';
import 'package:inspection_app/utility/assets_utility.dart';
import 'package:inspection_app/utility/color_utility.dart';
import 'package:inspection_app/utility/screen_utility.dart';

import '../../profile/profile_view.dart';
import '../inspect/inspect_list_screen.dart';
import '../support/support_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  commonView({String? title, ExactAssetImage? image,Function? callback}){
    return Expanded(child: InkWell(
      onTap: (){
        callback!();
      },
      child: SizedBox(
        height: 160,width: getScreenWidth(context)/2,
        child: commonContainerWithShadow(
          padding: 16,
          child: Column(
            children: [
              Container(
                height: 70,width: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: blackColor
                ),
                child: Center(
                  child: Image(
                    image: image!,
                    height: 30,width: 30,
                  ),
                ),
              ),commonVerticalSpacing(spacing: 20),
              commonHeaderTitle(
                  color: blackColor,
                  fontSize: 1,
                  fontWeight: 1,
                  isChangeColor: true,
                  title: title!,
                  align: TextAlign.center
              )
            ],
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          isLeadingCCustom: true,
          title: "Hello, Andrew",
          leadingWidget: InkWell(
            onTap: (){
              Get.to(() => const ProfileView());
            },
              child: const Icon(Icons.person))
          // Image(image: menuIconImage)
        ),
        child: commonCircularWidget(
          padding: 24,
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  commonView(title: "Assigned\nInspection List",image: assignedInspectionImage,callback: (){
                    Get.to(() => const InspectListView());
                  }),
                  commonHorizontalSpacing(spacing: 20),
                  commonView(title: "Inspection History",image: inspectionHistoryImage,callback: (){
                    Get.to(() => const InspectionHistoryView());
                  }),
                ],
              ),
              commonVerticalSpacing(spacing: 20),
              Row(
                children: [
                  commonView(title: "Support",image: supportImage,callback: (){
                    Get.to(() => const SupportView());
                  }),
                  const Expanded(child: SizedBox())
                ],
              )
            ],
          )
        )
    );
  }
}
