import 'dart:async';

abstract class TimerDataSource {
  Stream<dynamic> getDuration(ticks);
}

class TimerDataSourceImpl implements TimerDataSource {
  TimerDataSourceImpl();

  @override
  Stream<dynamic> getDuration(ticks) {
    final stream =
        Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
            .take(ticks);

    return stream;
  }
}
