import 'dart:convert';

import 'package:mostbet_3/data/models/match.dart';
import 'package:http/http.dart' as https;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchesApi {
  final String api_key = 'e0fbe3beaaed6d5b1321d8a9cbeaf93a';
  final String api_host = 'v3.football.api-sports.io';
  final String path = 'fixtures';

  Future<List<Match>> getMatches(DateTime dateTime) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String cachedData = prefs.getString('footballCachedData') ?? '';
    if (cachedData.isNotEmpty) {
      final data = json.decode(cachedData);
      await Future.delayed(const Duration(seconds: 1));
      return (data['response'] as List<dynamic>)
          .map((e) => Match.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    final date = DateFormat('yyyy-MM-dd').format(dateTime);
    final String lastUpdateDate =
        prefs.getString('lastUpdateDate') ?? '';
    if (lastUpdateDate != date) {
      final response = await https.get(
        Uri.https(api_host, path, {'date': date}),
        headers: {
          'x-rapidapi-host': api_host,
          'x-rapidapi-key': api_key,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await prefs.setString('lastUpdateDate', date);
        await prefs.setString('data', json.encode(data));
        final matches = (data['response'] as List<dynamic>)
            .map((e) => Match.fromJson(e as Map<String, dynamic>))
            .toList();
        return matches;
      } else {
        throw Exception('Fail');
      }
    } else {
      final String cachedData = prefs.getString('data') ?? '';
      if (cachedData.isNotEmpty) {
        final data = json.decode(cachedData);
        return (data['response'] as List<dynamic>)
            .map((e) => Match.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('fail');
      }
    }
  }
}
