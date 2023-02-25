import 'package:e_commerce_app1/views/AllCategoriesScreen.dart';
import 'package:e_commerce_app1/views/aboutUs.dart';
import 'package:e_commerce_app1/views/home_screen.dart';
import 'package:e_commerce_app1/views/myOrdersArchive.dart';
import 'package:e_commerce_app1/views/payment_screens/registerPaymentScreen.dart';
import 'package:e_commerce_app1/views/payment_screens/visa_screen.dart';
import 'package:e_commerce_app1/views/register_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../views/login_screen.dart';
import '../views/onBoarding_screens.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context , child) {
              return HomeScreen();
            }
        )
    );
  }
}
