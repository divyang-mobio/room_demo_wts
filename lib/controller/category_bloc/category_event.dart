part of 'category_bloc.dart';

abstract class CategoryEvent {}

class GetCategory extends CategoryEvent {
  String item;

  GetCategory({required this.item});
}
