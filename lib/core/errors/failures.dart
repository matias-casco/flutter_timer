import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int? code;
  final int? status;
  final String? message;

  Failure({this.code, this.status, this.message});

  @override
  List<Object?> get props => [code, status, message];
}

class ServerFailure extends Failure {
  ServerFailure({int? code, int? status, String? message})
      : super(code: code, status: status, message: message);
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({String? message}) : super(message: message);
}

class LocationFailure extends Failure {
  LocationFailure({String? message}) : super(message: message);
}

class CameraFailure extends Failure {
  CameraFailure({String? message}) : super(message: message);
}

class LocalFailure extends Failure {
  LocalFailure({String? message}) : super(message: message);
}

class DeviceLinkFailure extends Failure {
  final int code;
  final int status;
  final String message;
  final String token;

  DeviceLinkFailure({
    required this.code,
    required this.status,
    required this.message,
    required this.token,
  }) : super(
          code: code,
          status: status,
          message: message,
        );

  @override
  List<Object?> get props => [
        code,
        status,
        message,
        token,
      ];
}
