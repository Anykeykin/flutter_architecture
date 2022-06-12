import 'package:flutter/material.dart';
import 'package:module_domain/module_domain.dart';

import 'my_app.dart';

void main() {
  BlocFactory.instance.initialize();
  runApp(MyApp());
}

