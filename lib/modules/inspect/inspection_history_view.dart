import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:inspection_app/controllers/inspection_controller.dart';
import 'package:inspection_app/utility/color_utility.dart';
import 'package:inspection_app/utility/screen_utility.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../common_widgets/common_widget.dart';
import '../../model/inspection_response_model.dart';
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
  void initState() {
    InspectionController.to.fetchInProgressInspectionList();
    super.initState();
  }

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
                      ]
                    ),

                    Obx(() => InspectionController.to.isInspectionLoading.value ? const Center(
                      child: CircularProgressIndicator(),
                    ) : isCompleted ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: InspectionController.to.completedInspectionList.length,
                        itemBuilder: (context, index) {
                          return completedView(index: index,inspectionForm: InspectionController.to.completedInspectionList[index]);
                        }
                    ) : ListView.builder(
                        shrinkWrap: true,
                        itemCount: InspectionController.to.inProgressInspectionList.length,
                        itemBuilder: (context, index) {
                          return inProgressView(index: index,inspectionForm: InspectionController.to.inProgressInspectionList[index]);
                        }
                    )
                    )
                  ],
                ),
              ],
            )
        )
    );
  }

  Widget completedView({int? index, InspectionForm? inspectionForm}){
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
                    commonHeaderTitle(title: "${inspectionForm?.formName}",fontWeight: 3,fontSize: 1.25,isChangeColor: true,color: blackColor),
                    const Icon(Icons.error,color: primaryColor)
                  ],
                ),
                commonVerticalSpacing(spacing: 15),
                commonHeaderTitle(title: "${inspectionForm?.formNumber}",fontWeight: 1,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                commonVerticalSpacing(spacing: 8),
                commonHeaderTitle(title: "Model: ${inspectionForm?.modelNo}",fontWeight: 1,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                commonVerticalSpacing(spacing: 8),
                commonHeaderTitle(title: "Inspection Date: ${inspectionForm?.inspectionDate} | ${inspectionForm?.inspectionTime}",fontWeight: 1,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                commonVerticalSpacing(spacing: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inProgressView({int? index, InspectionForm? inspectionForm}){
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
                      commonHeaderTitle(title: "${inspectionForm?.formName}",fontWeight: 3,fontSize: 1.25,isChangeColor: true,color: blackColor),
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
                      commonHeaderTitle(title: "${inspectionForm?.formNumber}",fontWeight: 2,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                      commonVerticalSpacing(spacing: 8),
                      commonHeaderTitle(title: "Model:  ${inspectionForm?.modelNo}",fontWeight: 2,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                      commonVerticalSpacing(spacing: 8),
                      commonHeaderTitle(title: "Inspection Date: ${inspectionForm?.inspectionDate} |  ${inspectionForm?.inspectionTime}",fontWeight: 2,fontSize: 0.75,isChangeColor: true,color: subFontColor)
                    ],
                  ),
                  commonHorizontalSpacing(),
                  CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 5.0,
                    animation: true,
                    percent: 0.25,
                    center: Text(
                      "${inspectionForm?.formCompleted}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
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
