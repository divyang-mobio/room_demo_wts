part of 'saving_rule_bloc.dart';

abstract class SavingRuleEvent {}

class GetSavingRule extends SavingRuleEvent {
  String item;

  GetSavingRule({required this.item});
}

class CategoryChange extends SavingRuleEvent {}
