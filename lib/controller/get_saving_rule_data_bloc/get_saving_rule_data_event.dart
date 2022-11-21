part of 'get_saving_rule_data_bloc.dart';

abstract class GetSavingRuleDataEvent {}

class GetSavingRuleValue extends GetSavingRuleDataEvent {
  String value;

  GetSavingRuleValue({required this.value});
}

class GetSavingRuleReSet extends GetSavingRuleDataEvent {}
