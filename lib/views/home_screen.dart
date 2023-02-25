import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app1/blocs/auth_cubits/log_out/log_out_cubit.dart';
import 'package:e_commerce_app1/blocs/auth_cubits/register_cubit/register_cubit.dart';
import 'package:e_commerce_app1/components/carouselSlider/imageContainer.dart';
import 'package:e_commerce_app1/components/drawer/listTile.dart';
import 'package:e_commerce_app1/components/itemCard.dart';
import 'package:e_commerce_app1/components/reusable_button.dart';
import 'package:e_commerce_app1/models/carouselSlider/images_of_carousel_slider.dart';
import 'package:e_commerce_app1/models/getAllProducts/getAllProducts.dart';
import 'package:e_commerce_app1/utils/app_navigator.dart';
import 'package:e_commerce_app1/views/AllCategoriesScreen.dart';
import 'package:e_commerce_app1/views/aboutUs.dart';
import 'package:e_commerce_app1/views/login_screen.dart';
import 'package:e_commerce_app1/views/myOrdersArchive.dart';
import 'package:e_commerce_app1/views/register_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/getAllCategories/get_all_categories_cubit.dart';
import '../blocs/getAllProducts/get_all_products_cubit.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState(imageContainer: null);
}

class _HomeScreenState extends State<HomeScreen> {

  final ImageContainer? imageContainer;

  _HomeScreenState({required this.imageContainer});

  CarouselController buttonCarouselController = CarouselController();
  final int _numBanners = 3;
  int _currentBanner = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      GetAllCategoriesCubit()
        ..getAllCategoriesFunc(),
      child: BlocConsumer<GetAllCategoriesCubit, GetAllCategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GetAllCategoriesCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              size: 35,
                              color: Colors.grey[400],
                            )),
                        Container(
                          width: 300.w,
                          child: MaterialButton(
                            shape:RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey,
                                width: 1.w
                              ),
                            ),
                              onPressed: (){},
                            child: Row(
                              children: [
                                Text(
                                  'search',
                                  style: TextStyle(
                                      color: Colors.grey,
                                    fontSize: 16.sp
                                  ),
                                ),
                                SizedBox(width: 199.w),
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 20,
                                ),

                              ],
                            ),
                              ),
                        )
                      ],
                    ),
                    CarouselSlider.builder(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        onPageChanged:
                            (int banner, CarouselPageChangedReason reason) {
                          setState(() {
                            _currentBanner = banner;
                          });
                        },
                        height: 150.h,
                        viewportFraction: 0.9,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return ImageContainer(carouselImages: images[index]);
                      },
                      itemCount: images.length,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    cubit.getAllCategories == null
                        ? Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff00BCD4),
                        ))
                        : Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Categories',
                                style: TextStyle(
                                  color: Color(0xff2f59ff),
                                  fontSize: 17.sp,
                                ),
                              ),
                              Container(
                                height: 150.h,
                                width: 50.w,
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      Container(
                                        width: 140.w,
                                        height: 110.h,
                                        decoration: BoxDecoration(
                                            color: Color(0xffececec)),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Image.network(
                                              'https://m.media-amazon.com/images/I/71JP7xLLOWL._AC_UF1000,1000_QL80_.jpg',
                                              height: 50.h,
                                            ),
                                            Flexible(
                                              child: Text(
                                                cubit.getAllCategories!
                                                    .data![index].name
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                  // fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                    itemCount: cubit
                                        .getAllCategories!.data!.length),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Best Seller',
                                style: TextStyle(
                                  color: Color(0xff2f59ff),
                                  fontSize: 17.sp,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Container(
                                height: 200.h,
                                width: 50.h,
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      BlocProvider(
                                        create: (context) =>
                                        GetAllProductsCubit()
                                          ..getAllProducts,
                                        child: BlocConsumer<GetAllProductsCubit,
                                            GetAllProductsState>(
                                          listener: (context, state) {},
                                          builder: (context, state) {
                                            var cubit = GetAllProductsCubit.get(
                                                context);
                                            return ItemCard(
                                                image: Image.network(cubit
                                                    .getAllProducts!
                                                    .data![index]
                                                    .image
                                                    .toString()),
                                                name: cubit.getAllProducts!
                                                    .data![index].name
                                                    .toString(),
                                                price: cubit.getAllProducts!
                                                    .data![index].price
                                                    .toString(),
                                                function: () {});
                                          },
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                    itemCount: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15.0),
                    //   child: Row(
                    //     children: [
                    //       Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'All Item',
                    //             style: TextStyle(
                    //               color: Color(0xff2f59ff),
                    //               fontSize: 17.sp,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 6.h,
                    //           ),
                    //           BlocProvider(
                    //             create: (context) =>
                    //             GetAllProductsCubit()
                    //               ..getAllProductsFunc(),
                    //             child: BlocConsumer<GetAllProductsCubit,
                    //                 GetAllProductsState>(
                    //               listener: (context, state) {},
                    //               builder: (context, state) {
                    //                 var cubit =
                    //                 GetAllProductsCubit.get(context);
                    //                 return cubit.getAllProducts == null
                    //                     ? Center(
                    //                     child: CircularProgressIndicator(
                    //                       color: Color(0xff00BCD4),
                    //                     ))
                    //                     : Container(
                    //                   width: 50.w,
                    //                   child: GridView.builder(
                    //                     shrinkWrap: true,
                    //                     padding: EdgeInsets.all(20),
                    //                     gridDelegate:
                    //                     SliverGridDelegateWithFixedCrossAxisCount(
                    //                         mainAxisSpacing: 40,
                    //                         crossAxisSpacing: 18,
                    //                         crossAxisCount: 2),
                    //                     itemCount: cubit
                    //                         .getAllProducts!.data!.length,
                    //                     itemBuilder: (context, index) {
                    //                       return ItemCard(
                    //                           image: cubit.getAllProducts!
                    //                               .data![index].image
                    //                               .toString(),
                    //                           name: cubit.getAllProducts!
                    //                               .data![index].name
                    //                               .toString(),
                    //                           price: cubit.getAllProducts!
                    //                               .data![index].price
                    //                               .toString(),
                    //                           function: () {});
                    //                     },
                    //                   ),
                    //                 );
                    //               },
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            drawer: Padding(
              padding: const EdgeInsets.only(right: 80),
              child: Drawer(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 180.h,
                      child: DrawerHeader(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: Color(0xff214eff),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    onPressed: () {
                                      AppNavigator(context, true, HomeScreen());
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hossam Ezzat',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Edit',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 15,
                                            )
                                          ],
                                        )
                                      ])
                                ],
                              ),
                            ],
                          )),
                    ),
                    ListTileDrawer(
                      function: () {},
                      icon: Icons.shopping_cart_outlined,
                      text: 'Cart',
                    ),
                    ListTileDrawer(
                      function: () {},
                      icon: Icons.favorite_border,
                      text: 'Wish List',
                    ),
                    ListTileDrawer(
                      function: () {AppNavigator(context, true, MyOrderArchive());},
                      icon: Icons.shopping_bag_outlined,
                      text: 'My Orders',
                    ),
                    ListTileDrawer(
                      function: () {},
                      icon: Icons.local_phone_outlined,
                      text: 'Content us',
                    ),
                    ListTileDrawer(
                      function: () {AppNavigator(context, true,AboutUs());},
                      icon: Icons.info_outline,
                      text: 'About us',
                    ),
                    ListTileDrawer(
                      function: () {AppNavigator(context, true, AllCategoriesScreen());},
                      icon: Icons.widgets_outlined,
                      text: 'Categories',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: BlocProvider(
                        create: (context) => LogOutCubit(),
                        child: BlocConsumer<LogOutCubit, LogOutState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            var cubit = LogOutCubit.get(context);
                            return ListTile(
                              minLeadingWidth: 10,
                              leading: Icon(
                                Icons.logout_outlined,
                                color: Colors.red,
                              ),
                              title: Text(
                                'Log out',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              onTap: () {
                                cubit.logoutFunc();
                                AppNavigator(context, true, LoginScreen());
                              }
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numBanners; i++) {
      list.add(i == _currentBanner ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: isActive ? 9.h : 7.h,
      width: isActive ? 9.w : 7.w,
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            color: Colors.grey,
          )),
    );
  }
}
