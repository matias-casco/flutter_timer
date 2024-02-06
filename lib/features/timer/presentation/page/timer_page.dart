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
      child: const TimerView(),
      //todo: bloc listener (mostrar showalert con mensaje de excepcion)
    );
  }
}
