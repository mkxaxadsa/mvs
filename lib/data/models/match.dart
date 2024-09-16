class Match {
  const Match({
    required this.htTitle,
    required this.htLogo,
    required this.atTitle,
    required this.atLogo,
    required this.hGoals,
    required this.aGoals,
    required this.datetime,
    required this.leagueName,
  });
  final String htTitle;
  final String htLogo;
  final String atTitle;
  final String atLogo;
  final int hGoals;
  final int aGoals;
  final DateTime datetime;
  final String leagueName;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        htTitle: json['teams']['home']['name'],
        htLogo: json['teams']['home']['logo'],
        atTitle: json['teams']['away']['name'],
        atLogo: json['teams']['away']['logo'],
        hGoals: json['goals']['home'] ?? 0,
        aGoals: json['goals']['away'] ?? 0,
        datetime: DateTime.fromMillisecondsSinceEpoch(
          json['fixture']['timestamp'] ?? 0 * 1000,
        ),
        leagueName: json['league']['name'],
      );
}
