import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/features/timer/timer.dart';
import 'package:flutter_timer/features/timer/presentation/view/timer_view.dart';
import 'package:flutter_timer/features/timer/injector.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerBloc>(
      create: (_) => sl<TimerBloc>(),
      child: BlocListener<TimerBloc, TimerState>(
        listener: (context, state) {
          // Check if the state is an exception state
          if (state is TimerRunException) {
            // Show AlertDialog or any other widget to display the exception message
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: const Text(
                    'Error text'), // Assuming TimerExceptionState has a message field
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        child: const TimerView(),
      ),
      //todo: bloc listener (mostrar showalert con mensaje de excepcion)
    );
  }
}
