part of 'saving_rule_bloc.dart';

abstract class SavingRuleState {}

class SavingRuleInitial extends SavingRuleState {}

class SavingRuleLoaded extends SavingRuleState {
  List<String> data;
  String categoryValue;
  String? dropDownValue;

  SavingRuleLoaded(
      {required this.data, required this.categoryValue, this.dropDownValue});
}

class SavingRuleLoading extends SavingRuleState {}
