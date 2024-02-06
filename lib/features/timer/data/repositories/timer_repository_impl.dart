import 'package:dartz/dartz.dart';
import 'package:flutter_timer/core/errors/failures.dart';
import 'package:flutter_timer/features/timer/data/datasource/timer_datasource.dart';
import 'package:flutter_timer/features/timer/domain/repositories/timer_repository.dart';

class TimerRepositoryImpl implements TimerRepository {
  final TimerDataSource timerDataSource;

  TimerRepositoryImpl({required this.timerDataSource});

  @override
  Future<Either<Failure, Stream<int>>> getValue({required int ticks}) async {
    try {
      final response = await timerDataSource.getDuration(ticks);
      return Right(response);
    } catch (e) {
      return Left(
        ServerFailure(
          message: "Error getting duration.",
          code: 500,
          status: 500,
        ),
      );
    }
  }
}
