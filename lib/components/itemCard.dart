import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {

  final image;
  final name;
  final price;
  final function;


  ItemCard({required this.image,required this.name,required this.price,required this.function});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 155.w,
        height: 205.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
          child: Column(
            children: [
              Container(
                height: 120.h,
                width: double.infinity,
                child: Stack(
                    children: [
                      Image.network(image),
                       Align(
                          alignment: Alignment.topRight,
                          child:
                          IconButton(
                            onPressed:function,
                            icon:Icon(Icons.favorite,
                              color: Colors.grey,
                              size: 27,)
                          ))
                    ]
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    price,
                    style:TextStyle(
                        fontSize:13.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    ' EGP',
                    style:TextStyle(
                        fontSize:13.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: 30.h,
                width: 140.w,
                decoration: BoxDecoration(
                    color: Color(0xff214eff)
                ),
                child: TextButton(
                    onPressed: function,
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
