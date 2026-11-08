import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temperature_converture/models/temperatur_state.dart';

final temperatureProvider =
    NotifierProvider<TemperatureNotifier, TemperatureState>(
      () => TemperatureNotifier(),
    );

class TemperatureNotifier extends Notifier<TemperatureState> {
  @override
  TemperatureState build() => TemperatureState();

  void setConversionType(ConversionType type) {
    state = state.copyWith(conversionType: type, error: null);
  }

  void convert(String input) {
    // Validation: Empty check
    if (input.trim().isEmpty) {
      state = state.copyWith(error: 'Please enter a temperature value.');
      return;
    }

    // Validation: Valid number check
    final value = double.tryParse(input.trim());
    if (value == null) {
      state = state.copyWith(error: 'Please enter a valid number.');
      return;
    }

    double converted;
    String unitSymbol;

    // Conversion Logic
    if (state.conversionType == ConversionType.celsiusToFahrenheit) {
      converted = (value * 9 / 5) + 32;
      unitSymbol = '°F';
    } else {
      converted = (value - 32) * 5 / 9;
      unitSymbol = '°C';
    }

    // Update state with result rounded to 2 decimal places
    state = state.copyWith(
      result: '${converted.toStringAsFixed(2)} $unitSymbol',
      error: null,
    );
  }
}
