import 'package:dartz/dartz.dart';
import 'package:flutter_timer/core/errors/failures.dart';
import 'package:flutter_timer/core/usecases/usecase.dart';
import 'package:flutter_timer/features/timer/domain/repositories/timer_repository.dart';

class GetValueUseCase extends UseCase<Stream<dynamic>, NoParams> {
  final TimerRepository repository;

  GetValueUseCase({required this.repository});

  @override
  Future<Either<Failure, Stream<dynamic>>> call(NoParams params) async {
    final result = await repository.getValue(60);
    return result;
  }
}
