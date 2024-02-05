import 'package:dartz/dartz.dart';
import 'package:flutter_timer/core/errors/failures.dart';

abstract class TimerRepository {
  Future<Either<Failure, Stream<dynamic>>> getValue(int ticks);
}
