
class HomeStats {
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int totalTests;
  final int testsPerOneMillion;
  HomeStats(
      { this.country,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.active,
        this.critical,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
        this.totalTests,
        this.testsPerOneMillion});

  factory HomeStats.fromJSON(Map<String, dynamic> json) {
    return HomeStats(
      cases: json['cases'],
      totalTests: json['totalTests'],
      deaths: json['deaths'],
      recovered: json["recovered"],
    );
  }
}

// class HomeStats {
//   final int cases;
//   final int tested;
//   final int deaths;
//   final int recovered;
//   final String latestUpdated;
//   HomeStats(
//       {this.cases,
//       this.latestUpdated,
//       this.tested,
//       this.deaths,
//       this.recovered});

//   factory HomeStats.fromJSON(Map<String, dynamic> json) {
//     return HomeStats(
//         cases: json['infected'],
//         tested: json['tested'],
//         deaths: json['deceased'],
//         recovered: json["recovered"],
//         latestUpdated: json["lastUpdatedAtApify"]);
//   }
// }
