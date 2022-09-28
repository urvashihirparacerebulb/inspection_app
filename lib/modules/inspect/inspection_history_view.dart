import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:inspection_app/utility/color_utility.dart';
import 'package:inspection_app/utility/screen_utility.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../common_widgets/common_widget.dart';
import '../../utility/assets_utility.dart';
import 'inspection_detail_view.dart';

class InspectionHistoryView extends StatefulWidget {
  const InspectionHistoryView({Key? key}) : super(key: key);

  @override
  State<InspectionHistoryView> createState() => _InspectionHistoryViewState();
}

class _InspectionHistoryViewState extends State<InspectionHistoryView> {

  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
      return commonStructure(
          context: context,
          appBar: commonAppbar(
            context: context,
            title: "Inspection History",
        ),
        child: commonCircularWidget(
          padding: 0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    commonVerticalSpacing(spacing: 20),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: (){
                            setState(() {
                              isCompleted = false;
                            });
                          },
                          child: Column(
                            children: [
                              commonHeaderTitle(
                                  title: "In Progress",
                                  fontSize: 1.3,
                                  isChangeColor: true,
                                fontWeight: 2,
                                color: isCompleted == false ? blackColor : unSelectedFontColor
                              ),
                              commonVerticalSpacing(),
                              Container(
                                height: 1,
                                width: getScreenWidth(context)/2,
                                  color: isCompleted == false ? blackColor : unSelectedFontColor
                              )
                            ],
                          ),
                        )),

                        Expanded(child: InkWell(
                          onTap: (){
                            setState(() {
                              isCompleted = true;
                            });
                          },
                          child: Column(
                            children: [
                              commonHeaderTitle(
                                  title: "Completed",
                                  fontSize: 1.3,
                                isChangeColor: true,
                                  fontWeight: 2,
                                  color: isCompleted ? blackColor : unSelectedFontColor
                              ),
                              commonVerticalSpacing(),
                              Container(
                                  height: 1,
                                  width: getScreenWidth(context)/2,
                                  color: isCompleted ? blackColor : unSelectedFontColor
                              )
                            ],
                          ),
                        ))
                      ],
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                       return isCompleted ?  completedView(index: index) : inProgressView(index: index);
                    },)
                  ],
                ),
              ],
            )
        )
    );
  }

  Widget completedView({int? index}){
    return SwipeActionCell(
      key: ObjectKey(index),
      trailingActions: <SwipeAction>[
        SwipeAction(
          /// this is the same as iOS native
            performsFirstActionWithFullSwipe: true,
            title: "Export PDF",
            style: const TextStyle(fontSize: 10,color: whiteColor),
            icon: Image(image: pdfImage,color: whiteColor),
            onTap: (CompletionHandler handler) async {

            },
            color: blackColor),
      ],
      child: InkWell(
        onTap: (){
          Get.to(() => const InspectionDetailView());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
          child: commonContainerWithShadow(
            padding: 12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonVerticalSpacing(spacing: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonHeaderTitle(title: "Form Number 01",fontWeight: 3,fontSize: 1.2,isChangeColor: true,color: blackColor),
                    const Icon(Icons.error,color: primaryColor)
                  ],
                ),
                commonVerticalSpacing(spacing: 15),
                commonHeaderTitle(title: "BGD400000",fontWeight: 1,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                commonVerticalSpacing(spacing: 8),
                commonHeaderTitle(title: "Model: 349",fontWeight: 1,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                commonVerticalSpacing(spacing: 8),
                commonHeaderTitle(title: "Inspection Date: 6/07/20 | 9:48pm",fontWeight: 1,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                commonVerticalSpacing(spacing: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inProgressView({int? index}){
    return InkWell(
      onTap: (){
        Get.to(() => const InspectionDetailView());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
        child: commonContainerWithShadow(
          padding: 12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonVerticalSpacing(spacing: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonHeaderTitle(title: "Form Number 01",fontWeight: 3,fontSize: 1.25,isChangeColor: true,color: blackColor),
                      commonVerticalSpacing(),
                      commonHeaderTitle(title: "Daily",fontWeight: 2,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                    ],
                  ),
                  Image(image: editImage,height: 24,width: 24,fit: BoxFit.contain,)
                ],
              ),
              commonVerticalSpacing(spacing: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonHeaderTitle(title: "BGD400000",fontWeight: 2,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                      commonVerticalSpacing(spacing: 8),
                      commonHeaderTitle(title: "Model: 349",fontWeight: 2,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                      commonVerticalSpacing(spacing: 8),
                      commonHeaderTitle(title: "Inspection Date: 6/07/20 | 9:48pm",fontWeight: 2,fontSize: 0.75,isChangeColor: true,color: subFontColor)
                    ],
                  ),
                  commonHorizontalSpacing(),
                  CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 5.0,
                    animation: true,
                    percent: 0.25,
                    center: const Text(
                      "25%",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: primaryColor,
                  ),
                ],
              ),

              commonVerticalSpacing(spacing: 5),
            ],
          ),
        ),
      ),
    );
  }
}
