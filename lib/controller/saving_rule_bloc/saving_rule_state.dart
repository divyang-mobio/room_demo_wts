part of 'saving_rule_bloc.dart';

abstract class SavingRuleState {}

class SavingRuleInitial extends SavingRuleState {}

class SavingRuleLoaded extends SavingRuleState {
  List<String> data;
  String categoryValue;

  SavingRuleLoaded({required this.data, required this.categoryValue});
}

class SavingRuleLoading extends SavingRuleState {}
