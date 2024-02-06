import 'dart:async';

abstract class TimerDataSource {
  Future<Stream<int>> getDuration(int ticks);
}

class TimerDataSourceImpl implements TimerDataSource {
  TimerDataSourceImpl();

  @override
  Future<Stream<int>> getDuration(int ticks) async {
    final Stream<int> stream =
        Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
            .take(ticks);

    return stream;
  }
}
