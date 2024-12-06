import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/api/quiz/quiz_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://opentdb.com")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/api.php")
  Future<QuizResponse> getQuizzes(@Query("amount") int amount);
}
