import 'package:bloc/bloc.dart';

import '../../resources/list_resources.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetCategory>((event, emit) async {
      emit(CategoryLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(
          CategoryLoaded(data: listName(event.item), productValue: event.item));
    });
  }
}

List<String> listName(String data) {
  switch (data) {
    case 'Item 1':
      return item1List;
    case 'Item 2':
      return item2List;
    case 'Item 3':
      return item3List;
    default:
      return item1List;
  }
}
