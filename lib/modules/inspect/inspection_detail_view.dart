import 'package:flutter/material.dart';

import '../../common_widgets/common_widget.dart';
import '../../utility/assets_utility.dart';
import '../../utility/color_utility.dart';

class InspectionDetailView extends StatefulWidget {
  const InspectionDetailView({Key? key}) : super(key: key);

  @override
  State<InspectionDetailView> createState() => _InspectionDetailViewState();
}

class _InspectionDetailViewState extends State<InspectionDetailView> {

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          title: "Daily Inspection",
        ),
        child: commonCircularWidget(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          commonHeaderTitle(title: "Export PDF",fontSize: 1.1,fontWeight: 1,isChangeColor: true,color: blackColor),
                          commonHorizontalSpacing(),
                          Image(image: pdfImage,color: blackColor,height: 20,width: 20)
                        ],
                      ),
                      commonVerticalSpacing(spacing: 21),
                      commonContainerWithShadow(
                        padding: 12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonVerticalSpacing(spacing: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonHeaderTitle(title: "Form Number 01",fontWeight: 3,fontSize: 1.25,isChangeColor: true,color: blackColor),
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
                      ...questionView(isAns: true,isCom: true,isImageView: true),
                      ...questionView(isAns: true,),
                      ...questionView(isAns: true,isCom: true),
                      ...questionView(isAns: true,isImageView: true),
                    ],
                  ),
                )
              ],
            )
        )
    );
  }

  questionView({bool isAns = false, bool isCom = false, bool isImageView = false}){
    return [
      commonVerticalSpacing(spacing: 20),
      commonHeaderTitle(title: "Question 1",fontWeight: 3,fontSize: 1.25,isChangeColor: true,color: blackColor),
      commonVerticalSpacing(),
      commonHeaderTitle(title: "Lorem Ipsum is simply dummy text of the printing and typesetting this is dummy text this industry. Lorem Ipsum has not been the industry's standard dummy text ever since the 1500s.",
          fontWeight: 0,fontSize: 1,height: 1.4,isChangeColor: true,color: blackColor),
      commonVerticalSpacing(spacing: isAns ? 11 : 0),
      Visibility(
        visible: isAns,
        child: Row(
          children: [
            commonHeaderTitle(title: "Ans.",fontWeight: 3,fontSize: 1,isChangeColor: true,color: blackColor),
            commonHorizontalSpacing(spacing: 11),
            commonHeaderTitle(title: "Lorem Ipsum",
                fontWeight: 0,fontSize: 1,isChangeColor: true,color: blackColor)
          ],
        ),
      ),
      commonVerticalSpacing(spacing: isCom ? 11 : 0),
      Visibility(
        visible: isCom,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.ideographic,
          children: [
            commonHeaderTitle(title: "Com.",fontWeight: 3,fontSize: 1,isChangeColor: true,color: blackColor),
            commonHorizontalSpacing(spacing: 11),
            Flexible(child: commonHeaderTitle(title: "This is a dummy text lorem ipsum doler sit amet",
                fontWeight: 0,fontSize: 1,isChangeColor: true,color: blackColor))
          ],
        ),
      ),
      commonVerticalSpacing(spacing: isImageView ? 15 : 0),
      Visibility(
        visible: isImageView,
        child: Container(
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.withOpacity(0.5)
          ),
        ),
      ),
      commonVerticalSpacing(),
      const Divider(color: Color(0xFFD8D8D8)),
    ];
  }
}
