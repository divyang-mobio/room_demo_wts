part of 'category_bloc.dart';

abstract class CategoryEvent {}

class GetCategory extends CategoryEvent {
  String item;
  String? dropDownValue;

  GetCategory({required this.item, this.dropDownValue});
}
