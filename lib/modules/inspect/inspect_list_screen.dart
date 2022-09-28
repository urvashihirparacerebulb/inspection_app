import 'package:flutter/material.dart';
import 'package:inspection_app/utility/color_utility.dart';

import '../../common_widgets/common_widget.dart';

class InspectListView extends StatefulWidget {
  const InspectListView({Key? key}) : super(key: key);

  @override
  State<InspectListView> createState() => _InspectListViewState();
}

class _InspectListViewState extends State<InspectListView> {

  String selectedType = "By Day";

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          title: "Inspection List",
        ),
        child: commonCircularWidget(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      commonTransactionDropDown(
                        leftPadding: 10,
                        selectedValue: selectedType,
                        selectionData: ["By Day", "By Week", "By Month", "By Year"],
                        hint: 'Select',
                        callback: (value) {
                          setState(() {
                            selectedType = value;
                          });
                        },
                      ),
                    ],
                  ),
                  commonVerticalSpacing(spacing: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 12,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                        child: commonContainerWithShadow(
                            padding: 12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonHeaderTitle(title: "Form Number 01",fontWeight: 2,fontSize: 1.2,isChangeColor: true,color: blackColor),
                                    commonVerticalSpacing(spacing: 5),
                                    commonHeaderTitle(title: "Assigned by: Hitesh Patel",fontWeight: 0,fontSize: 0.75,isChangeColor: true,color: blackColor),
                                    commonVerticalSpacing(spacing: 5),
                                    commonHeaderTitle(title: "Due: 16/Dec/2020",fontWeight: 0,fontSize: 0.75,isChangeColor: true,color: blackColor)
                                  ],
                                ),
                                Container(
                                  height: 40,width: 40,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: borderColor
                                  ),
                                  child: const Icon(Icons.keyboard_arrow_right_outlined,color: blackColor,size: 16,),
                                )
                              ],
                            )
                        ),
                      );
                    }),
                  )
                ],
              ),
            )
        )
    );
  }
}
