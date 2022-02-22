import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friend/login.dart';
import 'package:friend/vote/app_bindings.dart';
import 'package:friend/vote/vote_screen.dart';
import 'package:get/get.dart';

import 'color.dart';

void main() {
  AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Fixing App Orientation.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
        statusBarColor: purpleColor,
        systemNavigationBarColor: purpleColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: primaryColor,
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(dark);

    return ScreenUtilInit(
    designSize: const Size(390,844),
      builder:()=>GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

        ),
        home: const VoteScreen(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}


