import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widget.dart';
import '../../utility/color_utility.dart';
import '../questions/question_one_view.dart';

class CustomerAssetView extends StatefulWidget {
  const CustomerAssetView({Key? key}) : super(key: key);

  @override
  State<CustomerAssetView> createState() => _CustomerAssetViewState();
}

class _CustomerAssetViewState extends State<CustomerAssetView> {

  commonExpandedView({String? title, subTitle}){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
      decoration: neurmorphicBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonHeaderTitle(title: title ?? "",fontWeight: 1,fontSize: 0.95,isChangeColor: true,color: subFontColor),
          commonVerticalSpacing(),
          commonHeaderTitle(title:subTitle,fontWeight: 2,fontSize: 1.15,isChangeColor: true,color: blackColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          title: "Customer & Assets",
        ),
        child: commonCircularWidget(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.withOpacity(0.5)
                        ),
                      ),
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        children: [
                          Expanded(child: commonExpandedView(title: "Make", subTitle: "Komatsu")),
                          commonHorizontalSpacing(spacing: 15),
                          Expanded(child: commonExpandedView(title: "Family", subTitle: "Family-All")),
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        children: [
                          Expanded(child: commonExpandedView(title: "Make", subTitle: "Komatsu")),
                          commonHorizontalSpacing(spacing: 15),
                          Expanded(child: commonExpandedView(title: "Family", subTitle: "Family-All")),
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      commonExpandedView(title: "Make", subTitle: "Komatsu")
                    ],
                  ),
                ),

                Positioned(
                    bottom: 15,
                    child: commonFillButtonView(
                        context: context, title: "Next", tapOnButton: (){
                      Get.to(() => const QuestionOneView());
                    }, isLoading: false))
              ],
            )
        )
    );
  }
}
