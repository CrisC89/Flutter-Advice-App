import 'package:advice_app/data/repositories%20impl/advice.repository.impl.dart';
import 'package:advice_app/domain/entities/advice.entity.dart';
import 'package:advice_app/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final AdviceRepositoryImpl adviceRepository;

  AdviceUseCases({required this.adviceRepository});

  Future<Either<AdviceEntity, Failure>> getAdvice() async {
    return adviceRepository.getAdviceFromDataSource();
    //here we can add business logic if we need it
  }

}
