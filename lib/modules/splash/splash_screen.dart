import 'package:flutter/material.dart';
import '../../common_widgets/common_widget.dart';
import '../../utility/assets_utility.dart';
import '../../utility/screen_utility.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        child: Center(
          child: Image(image: appLogoWithNameImage,
              width: getScreenWidth(context),
              height: 80
          ),
        ), context: context
    );
  }
}
