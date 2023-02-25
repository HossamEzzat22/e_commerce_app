import 'package:e_commerce_app1/utils/app_navigator.dart';
import 'package:e_commerce_app1/views/home_screen.dart';
import 'package:e_commerce_app1/views/payment_screens/visa_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/payment/controller_cubit.dart';
import '../../components/paymentComponents/defaultButton.dart';
import '../../components/paymentComponents/formTextPaymentField.dart';

class PaymentScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ControllerCubit(),
      child: BlocConsumer<ControllerCubit, ControllerState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ControllerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Payment Integration',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              physics:AlwaysScrollableScrollPhysics() ,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 200.h,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/paymentLogo.png'),
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Form(
                      key: cubit.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: DefaultTextFormFiled(
                                  controller: cubit.firstNameController,
                                  type: TextInputType.name,
                                  hintText: 'First name',
                                  prefix: Icons.person,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your first name!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: DefaultTextFormFiled(
                                  controller: cubit.lastNameController,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your last name !';
                                    }
                                    return null;
                                  },
                                  type: TextInputType.name,
                                  hintText: 'Last name',
                                  prefix: Icons.person,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          DefaultTextFormFiled(
                            controller: cubit.emailController,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email  !';
                              }
                              return null;
                            },
                            type: TextInputType.emailAddress,
                            hintText: 'Email',
                            prefix: Icons.email,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextFormFiled(
                            controller: cubit.phoneController,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone !';
                              }
                              return null;
                            },
                            type: TextInputType.number,
                            hintText: 'Phone',
                            prefix: Icons.phone,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextFormFiled(
                            controller: cubit.priceController,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your price !';
                              }
                              return null;
                            },
                            type: TextInputType.number,
                            hintText: 'Price',
                            prefix: Icons.monetization_on,
                          ),
                          const SizedBox(height: 20),
                          DefaultButton(
                            buttonWidget: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 1.6,
                              ),
                            ),
                            function: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.getOrderRegistrationID(
                                    price: cubit.priceController.text,
                                    firstName: cubit.firstNameController.text,
                                    lastName: cubit.lastNameController.text,
                                    email: cubit.emailController.text,
                                    phone: cubit.phoneController.text);
                              }
                              AppNavigator(context, false, HomeScreen());
                            },
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            radius: 10.0,
                            backgroundColor: Colors.blue,
                          ),
                        ],
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
}
