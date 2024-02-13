class Constants {
  static const String apiKey = '73352e18bd7abdcbb71aa38580781c8d';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';
  static const String popularMovies = '/movie/popular?page=1&api_key=';
  static const String trendingMovies = '/trending/movie/day?api_key=';
  static const String allMovies = "/trending/all/week?api_key=";
  static const String allTv = "/discover/tv?api_key=";
  static const String trendingTv = '/trending/tv/week?api_key=';
  static const String allTimeFavMovie = '/trending/all/week?api_key=';

  static const String discoverTv =
      '/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&api_key=';
  static const String topRatedTv =
      '/tv/top_rated?language=en-US&page=1&api_key=';
  static const String topratedMovies =
      '/movie/top_rated?language=en-US&page=1&api_key=';
  static const String watchlist =
      '/movie/upcoming?language=en-US&page=1&api_key=';
  static const String searchMovies =
      '/search/movie?include_adult=false&language=en-US&page=1&api_key=';
}
