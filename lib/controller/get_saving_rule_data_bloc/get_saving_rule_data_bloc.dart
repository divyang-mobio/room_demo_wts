import 'package:bloc/bloc.dart';

part 'get_saving_rule_data_event.dart';

part 'get_saving_rule_data_state.dart';

class GetSavingRuleDataBloc
    extends Bloc<GetSavingRuleDataEvent, GetSavingRuleDataState> {
  GetSavingRuleDataBloc() : super(GetSavingRuleDataInitial()) {
    on<GetSavingRuleValue>((event, emit) {
      emit(GetSavingRuleDataLoaded(value: event.value));
    });
    on<GetSavingRuleReSet>((event, emit) {
      emit(GetSavingRuleDataInitial());
    });
  }
}
