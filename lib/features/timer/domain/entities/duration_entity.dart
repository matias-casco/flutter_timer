import 'package:equatable/equatable.dart';

class DurationEntity extends Equatable {
  final int duration;

  const DurationEntity({required this.duration});

  @override
  List<Object?> get props => [duration];
}
