import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_timer/features/timer/domain/entities/duration_entity.dart';
import 'package:flutter_timer/features/timer/domain/usecases/get_value_usecase.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final GetValueUseCase getValueUseCase;
  static const int _duration = 60;
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required this.getValueUseCase})
      : super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<_TimerTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Future<void> _onStarted(TimerStarted event, Emitter<TimerState> emit) async {
    emit(TimerRunInProgress(event.duration));

    _tickerSubscription?.cancel();
    _tickerSubscription = null;

    final eitherResult =
        await getValueUseCase(const DurationEntity(duration: _duration));
    eitherResult.fold(
      (error) {
        emit(TimerRunPause(state.duration));
      },
      (success) {
        print('success');
        _tickerSubscription = success.listen(
          (value) {
            print('mi value $value');
            add(_TimerTicked(duration: value));
          },
        );
      },
    );
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(const TimerInitial(_duration));
  }

  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(event.duration > 0
        ? TimerRunInProgress(event.duration)
        : const TimerRunComplete());
  }
}
