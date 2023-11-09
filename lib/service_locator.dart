import 'package:common/data/data_source/mock/display_mock_api.dart';
import 'package:common/data/repository_impl/display.repository.impl.dart';
import 'package:common/domain/repository/display.repository.dart';
import 'package:common/domain/usecase/display/display.usecase.dart';
import 'package:get_it/get_it.dart';

import 'data/data_source/remote/display.api.dart';

final locator = GetIt.instance;

void setLocator() {
  _data();
  _domain();
}

void _data() {
  locator.registerSingleton<DisPlayApi>(DisplayMockApi());
}

void _domain() {
  // repository
  locator.registerSingleton<DisplayRepository>(
    DisplayRepositoryImpl(locator<DisPlayApi>()),
  );

  // usecase
  locator.registerSingleton<DisplayUsecase>(
      DisplayUsecase(locator<DisplayRepository>()));
}
