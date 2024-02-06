import 'package:dartz/dartz.dart';
import 'package:flutter_timer/core/errors/failures.dart';

abstract class TimerRepository {
  Future<Either<Failure, Stream<int>>> getValue({required int ticks});
}
