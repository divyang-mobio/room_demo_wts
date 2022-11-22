part of 'category_bloc.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoaded extends CategoryState {
  List<String> data;
  String productValue;
  String? dropDownValue;

  CategoryLoaded({required this.data, required this.productValue, this.dropDownValue});
}

class CategoryLoading extends CategoryState {}
