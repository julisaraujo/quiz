import 'package:json_annotation/json_annotation.dart';
part 'quiz_model.g.dart';

@JsonSerializable()
class QuizModel {
  final String category;
  final QuizType type;
  final QuizDifficulty difficulty;
  final String question;
  @JsonKey(name: 'correct_answer')
  final String correctAnswer;
  @JsonKey(name: 'incorrect_answers')
  final List<String> incorrectAnswers;

  QuizModel({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  int getPoints() {
    switch (difficulty) {
      case QuizDifficulty.easy:
        return 5;
      case QuizDifficulty.medium:
        return 10;
      case QuizDifficulty.hard:
        return 15;
    }
  }

  List<String> getAlternatives() {
    List<String> alternatives = incorrectAnswers;
    alternatives.add(correctAnswer);
    alternatives.shuffle();
    return alternatives;
  }

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}

@JsonSerializable()
class QuizResponse {
  @JsonKey(name: 'response_code')
  final int responseCode;
  final List<QuizModel> results;

  QuizResponse({required this.responseCode, required this.results});

  factory QuizResponse.fromJson(Map<String, dynamic> json) => _$QuizResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QuizResponseToJson(this);
}

enum QuizType {
  @JsonValue('multiple')
  multiple,

  @JsonValue('boolean')
  boolean
}

enum QuizDifficulty {
  @JsonValue('easy')
  easy,

  @JsonValue('medium')
  medium,

  @JsonValue('hard')
  hard
}
