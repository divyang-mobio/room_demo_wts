part of 'saving_rule_bloc.dart';

abstract class SavingRuleEvent {}

class GetSavingRule extends SavingRuleEvent {
  String item;
  String? dropDownValue;

  GetSavingRule({required this.item, this.dropDownValue});
}

class CategoryChange extends SavingRuleEvent {}
