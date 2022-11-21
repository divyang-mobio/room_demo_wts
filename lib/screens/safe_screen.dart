import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:room_demo_wts/controller/category_bloc/category_bloc.dart';
import 'package:room_demo_wts/resources/list_resources.dart';

import '../controller/get_saving_rule_data_bloc/get_saving_rule_data_bloc.dart';
import '../controller/saving_rule_bloc/saving_rule_bloc.dart';

class SafeScreen extends StatefulWidget {
  const SafeScreen({Key? key}) : super(key: key);

  @override
  State<SafeScreen> createState() => _SafeScreenState();
}

class _SafeScreenState extends State<SafeScreen> {
  String? productValue, categoryValue, savingRuleValue;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _actionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Safe'),
            backgroundColor: const Color.fromARGB(255, 0, 158, 61)),
        body: BlocListener<GetSavingRuleDataBloc, GetSavingRuleDataState>(
          listener: (context, state) {
            if (state is GetSavingRuleDataLoaded) {
              savingRuleValue = state.value;
            }
            if (state is GetSavingRuleDataInitial) {
              savingRuleValue = null;
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SafeFieldComponent(
                    title: 'Project',
                    iconData: Icons.settings,
                    item: productList,
                    hintText: 'Optional',
                    isDropDown: true),
                BlocConsumer<CategoryBloc, CategoryState>(
                  listener: (context, state) {
                    if (state is CategoryLoaded) {
                      productValue = state.productValue;
                    } else if (state is CategoryLoading) {
                      productValue = null;
                    }
                  },
                  builder: (context, state) {
                    if (state is CategoryLoaded) {
                      return SafeFieldComponent(
                          title: 'Category',
                          item: state.data,
                          iconData: Icons.category,
                          hintText: 'Required',
                          isDropDown: true);
                    } else if (state is CategoryLoading) {
                      return const CircularProgressIndicator.adaptive();
                    } else {
                      return SafeFieldComponent(
                          title: 'Category',
                          item: selectAbove,
                          iconData: Icons.category,
                          hintText: 'Required',
                          isDropDown: true);
                    }
                  },
                ),
                BlocConsumer<SavingRuleBloc, SavingRuleState>(
                  listener: (context, state) {
                    if (state is SavingRuleLoaded) {
                      categoryValue = state.categoryValue;
                    } else if (state is SavingRuleLoading) {
                      categoryValue = null;
                    }
                  },
                  builder: (context, state) {
                    if (state is SavingRuleLoaded) {
                      return SafeFieldComponent(
                          title: 'Saving Rule',
                          item: state.data,
                          iconData: Icons.category,
                          hintText: 'Required',
                          isDropDown: true);
                    } else if (state is SavingRuleLoading) {
                      return const CircularProgressIndicator.adaptive();
                    } else {
                      return SafeFieldComponent(
                          title: 'Saving Rule',
                          item: selectAbove,
                          iconData: Icons.category,
                          hintText: 'Required',
                          isDropDown: true);
                    }
                  },
                ),
                SafeFieldComponent(
                    title: 'Description',
                    onChange: _descriptionController,
                    iconData: Icons.edit,
                    hintText: 'Optional',
                    isDropDown: false),
                SafeFieldComponent(
                    title: 'Actions Taken / SavingRule',
                    iconData: Icons.edit,
                    onChange: _actionsController,
                    hintText: 'Optional',
                    isDropDown: false),
                TextButton(
                    onPressed: () {
                      print(productValue);
                      print(categoryValue);
                      print(savingRuleValue);
                      print(_descriptionController.text);
                      print(_actionsController.text);
                    },
                    child: const Text("data"))
              ],
            ),
          ),
        ));
  }
}

class SafeFieldComponent extends StatefulWidget {
  const SafeFieldComponent(
      {Key? key,
      required this.title,
      required this.hintText,
      this.onChange,
      this.item,
      required this.isDropDown,
      required this.iconData})
      : super(key: key);

  final String title, hintText;
  final TextEditingController? onChange;
  final IconData iconData;
  final List<String>? item;
  final bool isDropDown;

  @override
  State<SafeFieldComponent> createState() => _SafeFieldComponentState();
}

class _SafeFieldComponentState extends State<SafeFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(widget.iconData, size: 35, color: Theme.of(context).hintColor),
        const SizedBox(width: 10),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.grey.shade800),
              ),
              widget.isDropDown
                  ? DropDown(
                      item: widget.item ?? selectAbove,
                      hintText: widget.hintText,
                      title: widget.title,
                      onChange: widget.onChange,
                    )
                  : TextFieldClass(
                      hintText: widget.hintText,
                      controller: widget.onChange as TextEditingController)
            ]),
      ]),
    );
  }
}

class TextFieldClass extends StatefulWidget {
  const TextFieldClass(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  State<TextFieldClass> createState() => _TextFieldClassState();
}

class _TextFieldClassState extends State<TextFieldClass> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * .8,
      child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(hintText: widget.hintText)),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown(
      {Key? key,
      required this.hintText,
      this.onChange,
      required this.title,
      required this.item})
      : super(key: key);

  final TextEditingController? onChange;
  final String hintText;
  final List<String> item;
  final String title;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? dropDownValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * .8,
      child: DropdownButton(
        underline: Container(height: 1, color: Theme.of(context).hintColor),
        hint: Text(widget.hintText,
            style: TextStyle(color: Theme.of(context).hintColor)),
        isExpanded: true,
        value: dropDownValue,
        icon: const Icon(Icons.keyboard_arrow_down, size: 35),
        items: widget.item.map((String items) {
          return DropdownMenuItem(value: items, child: Text(items));
        }).toList(),
        onChanged: (String? newValue) {
          if (widget.title == 'Project') {
            BlocProvider.of<CategoryBloc>(context)
                .add(GetCategory(item: newValue.toString()));
          } else if (widget.title == 'Category') {
            BlocProvider.of<SavingRuleBloc>(context)
                .add(GetSavingRule(item: newValue.toString()));

            BlocProvider.of<GetSavingRuleDataBloc>(context)
                .add(GetSavingRuleReSet());
          } else if (widget.title == 'Saving Rule') {
            BlocProvider.of<GetSavingRuleDataBloc>(context)
                .add(GetSavingRuleValue(value: newValue.toString()));
          }
          setState(() {
            dropDownValue = newValue!;
          });
        },
      ),
    );
  }
}
