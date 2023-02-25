import 'package:bloc/bloc.dart';
import 'package:e_commerce_app1/models/getAllProducts/getAllProducts.dart';
import 'package:e_commerce_app1/services/dio_helper/dio_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());

  static GetAllProductsCubit get(context) => BlocProvider.of(context);

  GetAllProducts ? getAllProducts;

  getAllProductsFunc () {
    DioHelper.getData(
        url: '/products',
      token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value)
    {
      print(value.data);
      getAllProducts = GetAllProducts.fromJson(value.data);
      print(getAllProducts!.data![0].name);
    }).catchError((erorr){
      print(erorr);
    });
  }

}
