import 'package:dartz/dartz.dart';
import 'package:watch_cloud/core/error/failure.dart';

abstract class BaseUseCases<T> {
  Future<Either<Failure, T>> call();
}
