import 'package:bloc/bloc.dart';

import '../../resources/list_resources.dart';

part 'saving_rule_event.dart';

part 'saving_rule_state.dart';

class SavingRuleBloc
    extends Bloc<SavingRuleEvent, SavingRuleState> {
  SavingRuleBloc() : super(SavingRuleInitial()) {
    on<GetSavingRule>((event, emit) async {
      emit(SavingRuleLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(SavingRuleLoaded(
          data: listNames(event.item), categoryValue: event.item));
    });

    on<CategoryChange>((event, emit) async {
      emit(SavingRuleLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(SavingRuleInitial());
    });
  }
}

List<String> listNames(String data) {
  switch (data) {
    case 'Item 1 - 1':
      return item11List;
    case 'Item 1 - 2':
      return item12List;
    case 'Item 1 - 3':
      return item13List;
    case 'Item 2 - 1':
      return item21List;
    case 'Item 2 - 2':
      return item22List;
    case 'Item 2 - 3':
      return item23List;
    case 'Item 3 - 1':
      return item31List;
    case 'Item 3 - 2':
      return item32List;
    case 'Item 3 - 3':
      return item33List;
    default:
      return item11List;
  }
}
