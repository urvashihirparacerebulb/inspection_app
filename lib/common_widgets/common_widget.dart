import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inspection_app/utility/assets_utility.dart';
import '../modules/notification/notification_screen.dart';
import '../theme/convert_theme_colors.dart';
import '../utility/color_utility.dart';
import '../utility/constants.dart';
import '../utility/screen_utility.dart';
import 'package:get/get.dart';

import '../utility/theme_utility.dart';
import 'image_views/source_page.dart';


double commonHorizontalPadding = 10.0;
BorderRadius commonButtonBorderRadius = BorderRadius.circular(10.0);
BorderRadius commonBorderRadius = BorderRadius.circular(12.0);
OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  borderSide: const BorderSide(color: bgColor),
  borderRadius: commonButtonBorderRadius,
);

BoxDecoration neurmorphicBoxDecoration = BoxDecoration(
  boxShadow:
   [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      offset: const Offset(-2.0, -2.0),
      blurRadius: 8.0,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      offset: const Offset(6.0, 6.0),
      blurRadius: 8.0,
    ),
  ],
  color: whiteColor,
  borderRadius: BorderRadius.circular(12.0),
);

Widget commonStructure({
  required BuildContext context,
  required Widget child,
  PreferredSize? appBar,
  Color bgColor = whiteColor,
  Widget? bottomNavigation,
  Widget? floatingAction,
}) {
  ///Pass null in appbar when it's optional ex = appBar : null
  return Stack(
    children: [
      commonAppBackground(),
      Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        bottomNavigationBar: bottomNavigation,
        floatingActionButton: floatingAction,
        ///adding listView cause scroll issue
        body: Container(
          height: getScreenHeight(context),
          color: Colors.transparent,
          child: child,
        ),
      ),
    ],
  );
}

Widget commonAppBackground() {
  return Obx(() {
    return Container(
      decoration: BoxDecoration(
        color: ConvertTheme.convertTheme.getBackGroundColor(),
      ),
    );
  });
}

commonHeaderTitle({String title = "",
  double height = 1.0,
  double fontSize = 1,int fontWeight = 0,
  Color color = whiteColor,
  bool isChangeColor = false,
  TextAlign align = TextAlign.start,
  FontStyle fontStyle = FontStyle.normal}){
  return Text(
    title,
    style: white14PxNormal
        .apply(
        color: isChangeColor ? color : ConvertTheme.convertTheme.getWhiteToFontColor(),
        fontStyle: fontStyle,
        fontSizeFactor: fontSize,
        fontFamily: "Montserrat",
        fontWeightDelta: fontWeight)
        .merge(TextStyle(height: height)),
    textAlign: align,
  );
}

PreferredSize commonAppbar({BuildContext? context,
  String title = "",
  bool isLeadingCCustom = false,
  bool isBottomBar = false,
  double preferredSizeHeight = 56.0,
  PreferredSizeWidget? tabBarView,
  Widget? leadingWidget,
  bool centerTitle = false}){
  return PreferredSize(
    preferredSize: Size.fromHeight(preferredSizeHeight),
    child: Padding(
      padding: const EdgeInsets.only(left: 12.0,top: 16,right: 16),
      child: Obx(() {
        return AppBar(
          backgroundColor: ConvertTheme.convertTheme.getBackGroundColor(),
          centerTitle: centerTitle,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: commonHeaderTitle(title: title,fontSize: 1.3,fontWeight: 2,align: TextAlign.center),
          ),
          leading: isLeadingCCustom ? leadingWidget! : InkWell(
              onTap: (){
                Get.back();
              },
              child: Image(image: backArrowImage,
                  height: 16,width: 16,
                  fit: BoxFit.contain,
                  color: ConvertTheme.convertTheme.getWhiteToFontColor())),
          actions: [
            InkWell(
              onTap: (){
                Get.to(() => const NotificationScreen());
              },
                child: const Icon(Icons.notifications,color: whiteColor))
          ],
          bottom: isBottomBar ? tabBarView : null,
        );
      }),
    ),
  );
}

Widget commonFillButtonView(
    {required BuildContext context,
      required String title,
      required Function tapOnButton,
      required bool isLoading,
      bool isLightButton = false,
      Color? color,
      Color? fontColor,
      double? height = 50.0,
      double? width}) {
  return SizedBox(
      width: width ?? MediaQuery.of(context).size.width - (commonHorizontalPadding * 2),
      height: height,
      child: ElevatedButton(
          onPressed: () {
            if (!isLoading) {
              tapOnButton();
            }
          },
          style: ElevatedButton.styleFrom(
            shadowColor: blackColor.withOpacity(0.8),
            primary: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: commonButtonBorderRadius),
            padding: EdgeInsets.symmetric(vertical: height == 50.0 ? 15 : 2),
            elevation: 5.0,
          ),
          child: Text(
            title,
            style: black15PxW800.copyWith(
                color: blackColor,
                fontWeight: isLightButton ? FontWeight.w500 : FontWeight.bold,
                fontSize: height! >= 50.0 ? 16 : 12),
          )
      )
  );
}

Widget commonBorderButtonView(
    {required BuildContext context,
      required String title,
      required Function tapOnButton,
      required bool isLoading,
      Color? color,
      double height = 50,
      double? width,
      IconData? iconData}) {
  return SizedBox(
    width: width ?? MediaQuery.of(context).size.width - (commonHorizontalPadding * 2),
    height: height,
    child: ElevatedButton(
      onPressed: () {
        if (!isLoading) {
          tapOnButton();
        }
      },
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        primary: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: height == 50.0 ? 15 : 2),
        elevation: 0.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconData != null
              ? Icon(
            iconData,
            size: 20,
            color: blackColor,
          )
              : const SizedBox(),
          iconData != null ? commonHorizontalSpacing() : const SizedBox(),
          Text(
            title,
            style: black15PxW800.copyWith(
                color: blackColor,
                fontWeight: FontWeight.bold,
                fontSize: height >= 50.0 ? 16 : 12),
          ),

        ],
      ),
    ),
  );
}

commonVerticalSpacing({double spacing = 10}){
  return SizedBox(height: spacing);
}

commonHorizontalSpacing({double spacing = 10}){
  return SizedBox(width: spacing);
}

Widget commonCircularWidget({Widget? child,double padding = 0, double marginPadding = 10, bool isCustomPadding = false}){
  return Container(
    margin: EdgeInsets.only(top: marginPadding),
    padding: isCustomPadding ? const EdgeInsets.only(top: 80,left: 16,right: 16) : EdgeInsets.all(padding),
    decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16)
        )
    ),
    child: child,
  );
}

commonContainerWithShadow({Widget? child,double padding = 0}){
  return Container(
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.8),
          offset: const Offset(-5.0, -6.0),
          blurRadius: 16.0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(6.0, 6.0),
          blurRadius: 16.0,
        ),
      ],
      color: whiteColor,
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: child,
  );
}

Widget commonTransactionDropDown(
    {required String selectedValue,
      required List<String> selectionData,
      TextStyle? style,
      Function? callback,
      double height = 48,
      double leftPadding = 40,
      String hint = ""}) {
  return StatefulBuilder(builder: (context, newSetState) {
    return Container(
      height: height,
      padding: EdgeInsets.only(left: leftPadding),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          isExpanded: false,
          dropdownColor: whiteColor,
          underline: const SizedBox(),
          hint: Text(
            hint,
            style: black15PxW800
          ),
          value: selectedValue == "" ? null : selectedValue,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: blackColor,
          ),
          onChanged: (String? newValue) {
            newSetState(() {
              selectedValue = newValue!;
              callback!(selectedValue);
            });
          },
          items: selectionData.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(
                type,
                style: black15PxW800,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            );
          }).toList(),
        ),
      ),
    );
  });
}

imageAndVideoView(BuildContext context,{Function? callback}){
  return Row(
    children: [
      Expanded(child: InkWell(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SourcePage(source: MediaSource.image,callback: (File file){
                callback!(file);
              }),
            ),
          );
        },
        child: Row(
          children: [
            const Icon(Icons.photo_album_outlined,size: 20,color: blackColor),
            commonHorizontalSpacing(),
            commonHeaderTitle(title: 'Add Image',fontSize: 1.2,isChangeColor: true,color: blackColor)
          ],
        ),
      )),

      Expanded(child: InkWell(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SourcePage(source: MediaSource.video,callback: (File file){
                callback!(file);
              }),
            ),
          );
        },
        child: Row(
          children: [
            const Icon(Icons.video_camera_back_outlined,size: 20,color: blackColor),
            commonHorizontalSpacing(),
            commonHeaderTitle(title: 'Add Video',fontSize: 1.2,isChangeColor: true,color: blackColor)
          ],
        ),
      ))
    ],
  );
}