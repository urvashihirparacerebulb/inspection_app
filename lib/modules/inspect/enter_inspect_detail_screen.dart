
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspection_app/utility/color_utility.dart';

import '../../common_widgets/common_fill_textfield.dart';
import '../../common_widgets/common_widget.dart';
import '../../utility/constants.dart';
import 'customers_and_assets_view.dart';

class EnterInspectDetailView extends StatefulWidget {
  const EnterInspectDetailView({Key? key}) : super(key: key);

  @override
  State<EnterInspectDetailView> createState() => _EnterInspectDetailViewState();
}

class _EnterInspectDetailViewState extends State<EnterInspectDetailView> {
  TextEditingController serialNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(
          context: context,
          title: "Enter Details",
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
                      CommonFillTextFiled(
                        fieldTitleText: "Search here..",
                        hintText: "Search here..",
                        // isBorderEnable: false,
                        isChangeFillColor: true,
                        textEditingController: serialNumberController,
                        onChangedFunction: (String value){
                        },
                        suffixIcon: const Icon(Icons.search),
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        },),
                      commonVerticalSpacing(spacing: 20),
                      Container(
                        decoration: neurmorphicBoxDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            commonVerticalSpacing(spacing: 30),
                            const Icon(Icons.qr_code_scanner_outlined,size: 60),
                            commonVerticalSpacing(spacing: 15),
                            commonHeaderTitle(title: "Scan QR Code",fontSize: 1.2,isChangeColor: true,color: blackColor),
                            commonVerticalSpacing(spacing: 40),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Positioned(
                    bottom: 15,
                    child: commonFillButtonView(
                        context: context, title: "Next", tapOnButton: (){
                      Get.to(() => const CustomerAssetView());
                    }, isLoading: false))
              ],
            )
        )
    );
  }
}
