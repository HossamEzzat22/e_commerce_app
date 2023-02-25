import 'package:e_commerce_app1/blocs/getAllCategories/get_all_categories_cubit.dart';
import 'package:e_commerce_app1/components/card_of_all_categories_screen.dart';
import 'package:e_commerce_app1/utils/app_navigator.dart';
import 'package:e_commerce_app1/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllCategoriesCubit()..getAllCategoriesFunc(),
      child: BlocConsumer<GetAllCategoriesCubit, GetAllCategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GetAllCategoriesCubit.get(context);
          return Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(top: 30.0, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {AppNavigator(context, true, HomeScreen());},
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              )),
                          Text(
                            'Categories',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23.sp,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text(
                              'All Categories',
                              style: TextStyle(
                                color: Color(0xff2f59ff),
                                fontSize: 17.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      cubit.getAllCategories == null
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Color(0xff00BCD4),
                            ))
                          : Container(width:900.w,height:600.h,
                            child: GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 190.h,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                      crossAxisCount: 2),
                              itemCount: cubit.getAllCategories!.data!.length,
                              itemBuilder: (context, index) {
                                return CategoryCard(
                                    image: 'https://m.media-amazon.com/images/I/61UGE9cZVlL._AC_SL1500_.jpg',
                                    name: cubit.getAllCategories!.data![index].name);
                              },
                            ),
                          )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
