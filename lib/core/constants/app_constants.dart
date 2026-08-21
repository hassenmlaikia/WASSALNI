/// Application-wide constants
class AppConstants {
  // App Info
  static const String appName = 'WASSALNI';
  static const String appVersion = '1.0.0';

  // Languages
  static const String defaultLanguage = 'ar'; // Tunisian Arabic
  static const String englishLanguage = 'en';

  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 15);

  // Location
  static const double defaultLatitude = 36.8065;
  static const double defaultLongitude = 10.1966;
  static const double mapZoomLevel = 15.0;

  // UI
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;
  static const double paddingDefault = 16.0;
  static const double paddingSmall = 8.0;
  static const double paddingLarge = 24.0;
}
