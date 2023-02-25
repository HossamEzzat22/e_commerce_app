import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final image;
  final name;


  CategoryCard({required this.image,required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              image,
              height: 140.h,
              width: 140.w,
            ),
            Flexible(
              child: Container(
                width: 100.w,height: 18.h,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(

                      fontSize: 17.sp,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
