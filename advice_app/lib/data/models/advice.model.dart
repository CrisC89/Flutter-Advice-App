import 'package:advice_app/domain/entities/advice.entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin{
  AdviceModel({required int id, required String advice}) : super(id: id, advice: advice);

  factory AdviceModel.fromJson(Map<String, dynamic> json){



    return AdviceModel(id: json['advice_id'], advice: json['advice']);
  }
}
