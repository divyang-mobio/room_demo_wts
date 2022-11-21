part of 'get_saving_rule_data_bloc.dart';

abstract class GetSavingRuleDataState {}

class GetSavingRuleDataInitial extends GetSavingRuleDataState {}

class GetSavingRuleDataLoaded extends GetSavingRuleDataState {
  String value;

  GetSavingRuleDataLoaded({required this.value});
}
