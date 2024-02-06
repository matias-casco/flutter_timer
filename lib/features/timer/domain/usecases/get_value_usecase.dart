import 'package:dartz/dartz.dart';
import 'package:flutter_timer/core/errors/failures.dart';
import 'package:flutter_timer/core/usecases/usecase.dart';
import 'package:flutter_timer/features/timer/domain/entities/duration_entity.dart';
import 'package:flutter_timer/features/timer/domain/repositories/timer_repository.dart';

class GetValueUseCase extends UseCase<Stream<int>, DurationEntity> {
  final TimerRepository repository;

  GetValueUseCase({required this.repository});

  @override
  Future<Either<Failure, Stream<int>>> call(DurationEntity params) async {
    final result = await repository.getValue(ticks: params.duration);
    print('GetValueUseCase.call: result: $result');
    return result;
  }
}
