import 'package:advice_app/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/advice.entity.dart';

abstract class AdviceRepository{
  Future<Either<AdviceEntity, Failure>> getAdviceFromDataSource();
}
