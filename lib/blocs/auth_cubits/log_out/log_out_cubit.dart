import 'package:bloc/bloc.dart';
import 'package:e_commerce_app1/models/auth/log_out.dart';
import 'package:e_commerce_app1/services/dio_helper/dio_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutInitial());

  static LogOutCubit get(context)=>BlocProvider.of(context);


  Logout? logout;

  logoutFunc(){
    DioHelper.postData(
        url: '/logout', data: {}
        ).then((value) {
          logout = Logout.fromJson(value.data);
          SharedPrefrenceHelper.removeData(key: SharedPreferencesKeys.token);
          print(logout!.message);
    }).catchError((erorr){
      print(erorr);
    });
  }

}
