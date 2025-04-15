import 'package:dio/dio.dart';
import 'package:news_app_using_riverpod/constants/constants.dart';

class NewsService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      responseType: ResponseType.json
    )
  );

  fetchNews() async {
    // Modified to only fetch health news
    var response = await _dio.get('v2/top-headlines?category=health&country=us&apiKey=094abddfda1944fb87d868677f3005ee');
    return response.data;
  }
  
  fetchNewsBySearching(String title) async {
    // Modified to search within health topics
    var response = await _dio.get('v2/everything?q=${title}+tips&apiKey=094abddfda1944fb87d868677f3005ee');
    return response.data;
  }
}