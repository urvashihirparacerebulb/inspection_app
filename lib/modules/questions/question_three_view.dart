import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspection_app/modules/questions/question_four_view.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../common_widgets/common_textfield.dart';
import '../../common_widgets/common_widget.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';
import 'question_one_view.dart';

class QuestionThreeView extends StatefulWidget {
  const QuestionThreeView({Key? key}) : super(key: key);

  @override
  State<QuestionThreeView> createState() => _QuestionThreeViewState();
}

class _QuestionThreeViewState extends State<QuestionThreeView> {
  TextEditingController commentController = TextEditingController();

  List<RadioView> listOfOptions = [
    RadioView(title: "Yes", isSelected: false),
    RadioView(title: "No", isSelected: false)
  ];

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          title: "Question",
        ),
        child: commonCircularWidget(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: neurmorphicBoxDecoration,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30.0,
                                  lineWidth: 5.0,
                                  animation: true,
                                  percent: 0.75,
                                  center: const Text(
                                    "75.0%",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: primaryColor,
                                ),
                                commonHorizontalSpacing(),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      commonHeaderTitle(title: "Question 3",fontWeight: 3,fontSize: 1.2,isChangeColor: true,color: blackColor),
                                      commonVerticalSpacing(spacing: 10),
                                      commonHeaderTitle(title: "3 / 4",fontWeight: 2,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            commonVerticalSpacing(spacing: 16),
                            commonHeaderTitle(
                                title: "This is dummy text of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which.",
                                fontSize: 1.2,
                                isChangeColor: true,
                                height: 1.2,
                                color: blackColor
                            ),
                            commonVerticalSpacing(spacing: 10),
                          ],
                        ),
                      ),
                      commonVerticalSpacing(),
                      StatefulBuilder(builder: (context, newSetState) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                              margin: const EdgeInsets.symmetric(vertical: 9),
                              decoration: BoxDecoration(
                                  borderRadius: commonBorderRadius,
                                  color: const Color(0xFFF3F3F3),
                                  border: Border.all(color: listOfOptions[index].isSelected! ? const Color(0xFF689F38) : const Color(0xFFF3F3F3))
                              ),
                              child: InkWell(
                                onTap: (){
                                  for (var element in listOfOptions) {
                                    element.isSelected = false;
                                  }
                                  newSetState((){
                                    listOfOptions[index].isSelected = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    commonHeaderTitle(
                                        title: listOfOptions[index].title ?? "",
                                        isChangeColor: true,
                                        fontWeight: 1,
                                        fontSize: 1.15,
                                        color: listOfOptions[index].isSelected! ? blackColor : subFontColor
                                    ),
                                    Icon(Icons.check_circle,size: 20,color: listOfOptions[index].isSelected! ? const Color(0xFF689F38) : const Color(0xFFCBCACA))
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: listOfOptions.length,
                        );
                      },),
                      commonVerticalSpacing(spacing: 10),
                      CommonTextFiled(
                        fieldTitleText: "Add Comment",
                        hintText: "Add Comment",
                        borderColor: subFontColor.withOpacity(0.5),
                        textEditingController: commentController,
                        onChangedFunction: (String value){
                        },
                        preFixIcon: const Icon(Icons.chat_bubble_outline,color: subFontColor),
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        },
                      ),
                      commonVerticalSpacing(spacing: 30),
                      imageAndVideoView(context,callback: (File file){}),
                      commonVerticalSpacing(spacing: 100),
                    ],
                  ),
                ),

                Positioned(
                    bottom: 15,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        commonBorderButtonView(
                            width: MediaQuery.of(context).size.width / 2,
                            iconData: Icons.keyboard_backspace_outlined,
                            context: context, title: "Previous", tapOnButton: (){

                        }, isLoading: false),
                        commonFillButtonView(
                            width: MediaQuery.of(context).size.width / 2,
                            context: context, title: "Next", tapOnButton: (){
                              Get.to(() => const QuestionFourView());
                        }, isLoading: false)
                      ],
                    ))
              ],
            )
        )
    );
  }
}