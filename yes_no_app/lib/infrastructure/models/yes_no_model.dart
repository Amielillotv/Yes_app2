// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  //crear una instancia de "Mesage" desde el modelo
  Message toMessageEntity() =>
      //condicional para darle el valor al mensaje
      Message(
          text: answer == 'yes'
              ? 'Si'
              : answer == 'no'
                  ? 'No'
                  : 'Quiza',
          fromWho: FromWho.him,
          imageUrl: image);
}
