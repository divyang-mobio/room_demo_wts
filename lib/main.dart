import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:room_demo_wts/controller/category_bloc/category_bloc.dart';
import 'package:room_demo_wts/screens/safe_screen.dart';

import 'controller/get_saving_rule_data_bloc/get_saving_rule_data_bloc.dart';
import 'controller/saving_rule_bloc/saving_rule_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.green),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Room Demo'),
          backgroundColor: const Color.fromARGB(255, 0, 158, 61)),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/safe');
          },
          child: Container(
              alignment: Alignment.center,
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Safe',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ),
      ),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      case '/safe':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<CategoryBloc>(
                        create: (context) => CategoryBloc()),
                    BlocProvider<SavingRuleBloc>(
                        create: (context) => SavingRuleBloc()),
                    BlocProvider<GetSavingRuleDataBloc>(
                        create: (context) => GetSavingRuleDataBloc()),
                  ],
                  child: const SafeScreen(),
                ));
      default:
        return MaterialPageRoute(builder: (context) => const MyHomePage());
    }
  }
}
