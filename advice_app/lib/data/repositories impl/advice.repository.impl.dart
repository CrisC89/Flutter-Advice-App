import 'package:advice_app/data/data%20source/advice.remote.datasource.dart';
import 'package:advice_app/data/exception/exception.dart';
import 'package:advice_app/domain/entities/advice.entity.dart';
import 'package:advice_app/domain/failures/failure.dart';
import 'package:advice_app/domain/repositories/advice.repository.dart';
import 'package:dartz/dartz.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  final AdviceRemoteDataSourceImpl adviceRemoteDataSource;

  AdviceRepositoryImpl({required this.adviceRemoteDataSource});

  @override
  Future<Either<AdviceEntity, Failure>> getAdviceFromDataSource() async {

    try{
      final result = await adviceRemoteDataSource.getRandomAdviceFromApi();
      return left(result);
    }on ServerException catch (e){
      return right(ServerFailure());
    }
    catch(e){
      return right(GeneralFailure());
    }

  }

}
