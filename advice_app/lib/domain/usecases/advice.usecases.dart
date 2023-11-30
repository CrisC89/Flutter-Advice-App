import 'package:advice_app/domain/entities/advice.entity.dart';

class AdviceUseCases {

  Future<AdviceEntity> getAdvice() async {
    //call repository to get data (failure or data)
    //proceed with business logic (manipulate data)
    await Future.delayed(const Duration(seconds: 3), (){});
    return AdviceEntity(id: 1, advice: 'Advice to test');
  }
}
