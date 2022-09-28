import 'package:flutter/material.dart';

import '../../common_widgets/common_widget.dart';
import '../../utility/color_utility.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          title: "Notification",
        ),
        child: commonCircularWidget(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10),
                  child: ListView.builder(
                    itemCount: 15,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: commonContainerWithShadow(
                            padding: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonHeaderTitle(title: "Form Number 1 is left",fontWeight: 3,fontSize: 1.2,isChangeColor: true,color: blackColor),
                                commonVerticalSpacing(spacing: 10),
                                commonHeaderTitle(title: "Please fill form number 1 is remaining something... ",fontWeight: 1,fontSize: 0.75,isChangeColor: true,color: subFontColor),
                                commonVerticalSpacing(spacing: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    commonHeaderTitle(title: "Just Now",fontWeight: 1,fontSize: 0.75,isChangeColor: true,color: subFontColor,align: TextAlign.end)
                                  ],
                                )
                              ],
                            )
                        ),
                      );
                  },),
                )
              ],
            )
        )
    );
  }
}
