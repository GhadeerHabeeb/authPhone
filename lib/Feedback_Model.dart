
import 'package:flutter/cupertino.dart';

class FeedBackModel
{
  String k1ArabicTitle;
  String k1ArabicYoutubeUrl;
  String k1MathTitle;
  String k1MathYoutubeUrl;
  String k1MathLecture;
  String k1ScienceTitle;
  String k1ScienceYoutubeUrl;
  String k1ScienceLecture;
  String k1EnglishTitle;
  String k1EnglishYoutube;
  String k1EnglishLecture;
  String k2ArabicTitle;
  String k2ArabicYoutubeUrl;
  String k2ArabicLectureTitle;
  String k2ArabicLectureLink;
  String k2MathTitle;
  String k2MathYoutube;
  String k2MathLecture;
  String k2ScienceTitle;
  String k2ScienceYoutube;
  String k2ScienceLecture;
  String k2EnglishTitle;
  String k2EnglishYoutube;
  String k2EnglishLecture;



  FeedBackModel({
    required this.k1ArabicTitle,
    required this.k1ArabicYoutubeUrl,
    required this.k1MathTitle,
    required this.k1MathYoutubeUrl,
  required this.k1ScienceTitle,
  required this.k1ScienceYoutubeUrl,
  required this.k1MathLecture,
  required this.k1ScienceLecture,
    required this.k1EnglishTitle,
    required this.k1EnglishYoutube,
    required this.k1EnglishLecture,
  required this.k2ArabicLectureTitle,
  required this.k2ArabicLectureLink,
  required this.k2ArabicTitle,
  required this.k2ArabicYoutubeUrl,
  required this.k2MathTitle,
  required this.k2MathYoutube,
  required this.k2MathLecture,
  required this.k2ScienceTitle,
  required this.k2ScienceYoutube,
  required this.k2ScienceLecture,
  required this.k2EnglishTitle,
  required this.k2EnglishYoutube,
  required this.k2EnglishLecture});
  factory FeedBackModel.fromJson(dynamic json)
  {
    return FeedBackModel(
      k1ArabicTitle: "${json['K1_arabic_title']}",
      k1ArabicYoutubeUrl: "${json['k1_arabic_youtube_url']}",
        k1MathTitle: "${json['K1_math_title']}",
        k1MathYoutubeUrl:"${json['K1_math_youtube_url']}",
        k1MathLecture:"${json['K1_math_lecture']}",
        k1ScienceTitle:"${json['K1_science_title']}",
      k1ScienceYoutubeUrl: "${json['K1_science_youtube_url']}",
        k1ScienceLecture: "${json['K1_science_lecture']}",
        k1EnglishTitle: '${json['K1_english_title']}',
        k1EnglishLecture: '${json['K1_english_lecture']}',
        k1EnglishYoutube: '${json['K1_english_youtube_url']}',
      k2ArabicTitle: "${json['K2_arabic_title']}",
      k2ArabicYoutubeUrl: "${json['K2_arabic_youtube_url']}",
      k2ArabicLectureTitle: '${json['K2_arabic_lecture']}',
      k2ArabicLectureLink: '${json['K2_arabic_lecture_link']}',
      k2MathTitle: '${json['K2_math_title']}',
      k2MathYoutube: '${json['K2_math_youtube_url']}',
      k2MathLecture: '${json['K2_math_lecture']}',
      k2ScienceTitle: '${json['K2_science_title']}',
      k2ScienceLecture: '${json['K2_science_lecture']}',
      k2ScienceYoutube: '${json['K2_science_youtube_url']}',
      k2EnglishTitle: '${json['K2_english_title']}',
      k2EnglishLecture: '${json['K2_english_lecture']}',
      k2EnglishYoutube: '${json['K2_english_youtube_url']}'

    );

  }
  Map toJson()=>{
    'K1_arabic_title':k1ArabicTitle,
    'k1_arabic_youtube_url':k1ArabicYoutubeUrl,
    'K1_math_title':k1MathTitle,
    'K1_math_lecture':k1MathLecture,
    'K1_math_youtube_url':k1MathYoutubeUrl
  };
}