part of 'get_all_categories_cubit.dart';

@immutable
abstract class GetAllCategoriesState {}

class GetAllCategoriesInitial extends GetAllCategoriesState {}

class GetAllCategoriesLoadingState extends GetAllCategoriesState {}
class GetAllCategoriesSuccessState extends GetAllCategoriesState {}
class GetAllCategoriesErorrState extends GetAllCategoriesState {}

