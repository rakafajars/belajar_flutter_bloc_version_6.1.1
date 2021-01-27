import 'package:flutter/material.dart';
import 'package:flutter_bloc_version_611/number_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CounterState counterState = context.watch<CounterBloc>().state;

    // Counter Bloc (T) type blocnya
    // R type data yang di pantaunyaaa
    // counterBloc method
    int number = context.select<CounterBloc, int>(
      (counterBloc) => (counterBloc.state is CounterValue)
          ? (counterBloc.state as CounterValue).value
          : null,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar BLOC V 6.1.1 ++'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return NumberCard(
                    title: 'Bloc\nBuilder',
                    number: (state is CounterValue) ? state.value : null,
                  );
                },
              ),
              SizedBox(
                width: 40,
              ),
              NumberCard(
                title: 'Watch',
                number:
                    (counterState is CounterValue) ? counterState.value : null,
              ),
              SizedBox(
                width: 40,
              ),
              NumberCard(
                title: 'Select',
                number: number,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            child: Text(
              'INCEREMENT',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            shape: StadiumBorder(),
            color: Colors.green[800],
            onPressed: () {
              context.read<CounterBloc>().add(
                    Increment(),
                  );
            },
          ),
        ],
      ),
    );
  }
}
