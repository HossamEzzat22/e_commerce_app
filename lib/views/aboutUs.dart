import 'package:e_commerce_app1/utils/app_navigator.dart';
import 'package:e_commerce_app1/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUs extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0,left: 20,right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){AppNavigator(context, true, HomeScreen());},
                    icon: Icon(Icons.arrow_back,
                    color: Colors.black,)),
                Text(
                  'About us',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                  ),
                )
              ],
            ),
            Card(
              elevation: 10,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(150)),
            ),
              child: Container(
                height: 590.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200.h,
                      child: Image(
                          image: NetworkImage('https://securityintelligence.com/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2015/06/Online-Shopping-Security-Issues-630x330.jpg.webp',
                          ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' We are portatile company',
                            style: TextStyle(
                              color: Color(0xff5376ff),
                              fontSize: 20.sp
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            ' Early computers were meant to be\n used only for calculations. Simple\n manual instruments like the abacus\n have aided people in doing\n calculations since ancient times. Early\n in the Industrial Revolution, some\n mechanical devices were built to\n automate long tedious tasks, such as\n guiding patterns for looms. More\n sophisticated electrical machines did\n specialized analog calculations in the\n early 20th century. The first digital\n electronic calculating machines were\n developed during World War II. The\n first semiconductor transistors in the\n late 1940s were followed by the\n silicon-based MOSFET (MOS',
                          style: TextStyle(
                            fontSize: 16.sp
                          ),)


                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
