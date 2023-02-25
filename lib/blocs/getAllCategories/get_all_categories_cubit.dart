import 'package:bloc/bloc.dart';
import 'package:e_commerce_app1/models/getAllCategories/getAllCategories.dart';
import 'package:e_commerce_app1/services/dio_helper/dio_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit() : super(GetAllCategoriesInitial());

  static GetAllCategoriesCubit get(context) => BlocProvider.of(context);

  GetAllCategories? getAllCategories;

  getAllCategoriesFunc() {
    emit(GetAllCategoriesLoadingState());
    print('Loading');
    DioHelper.getData(
      url: '/categories',
      token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token),
    ).then((value) {
      emit(GetAllCategoriesSuccessState());
      print(value.data);
      getAllCategories = GetAllCategories.fromJson(value.data);
      print(getAllCategories!.data![1].name);
    }).catchError((erorr) {
      emit(GetAllCategoriesErorrState());
      print(erorr);
    });
  }
}
