import 'feature.dart';

class AppState {
  final isTestMode = Feature(true, 'isTestMode');
  final debugShowCheckedModeBanner = Feature(true, 'debugShowCheckedModeBanner');
}
