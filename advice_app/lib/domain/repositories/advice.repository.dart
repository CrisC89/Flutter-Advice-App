import '../entities/advice.entity.dart';

abstract class AdviceRepository{
  Future<AdviceEntity> getAdviceFromDataSource();
}
