import 'package:flutter_timer/features/timer/data/datasource/timer_datasource.dart';
import 'package:flutter_timer/features/timer/data/repositories/timer_repository_impl.dart';
import 'package:flutter_timer/features/timer/domain/repositories/timer_repository.dart';
import 'package:flutter_timer/features/timer/domain/usecases/get_value_usecase.dart';
import 'package:flutter_timer/features/timer/presentation/bloc/timer_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init(String env) async {
  // Data sources
  sl.registerLazySingleton<TimerDataSource>(() => TimerDataSourceImpl());

  // Repositories
  sl.registerLazySingleton<TimerRepository>(
    () => TimerRepositoryImpl(
      timerDataSource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetValueUseCase(repository: sl()));

  // Bloc
  sl.registerLazySingleton<TimerBloc>(() => TimerBloc(
        getValueUseCase: sl(),
      ));
}
