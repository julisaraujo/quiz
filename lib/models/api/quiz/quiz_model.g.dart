// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      category: json['category'] as String,
      type: $enumDecode(_$QuizTypeEnumMap, json['type']),
      difficulty: $enumDecode(_$QuizDifficultyEnumMap, json['difficulty']),
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      incorrectAnswers: (json['incorrect_answers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'category': instance.category,
      'type': _$QuizTypeEnumMap[instance.type]!,
      'difficulty': _$QuizDifficultyEnumMap[instance.difficulty]!,
      'question': instance.question,
      'correct_answer': instance.correctAnswer,
      'incorrect_answers': instance.incorrectAnswers,
    };

const _$QuizTypeEnumMap = {
  QuizType.multiple: 'multiple',
  QuizType.boolean: 'boolean',
};

const _$QuizDifficultyEnumMap = {
  QuizDifficulty.easy: 'easy',
  QuizDifficulty.medium: 'medium',
  QuizDifficulty.hard: 'hard',
};

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) => QuizResponse(
      responseCode: (json['response_code'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => QuizModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizResponseToJson(QuizResponse instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'results': instance.results,
    };
