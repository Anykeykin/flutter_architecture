import 'package:module_data/module_data.dart';

class DummyService implements HealthService {
  bool getHealth() {
    return true;
  }
}