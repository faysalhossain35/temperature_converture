enum ConversionType {
  celsiusToFahrenheit('Celsius to Fahrenheit (°C → °F)'),
  fahrenheitToCelsius('Fahrenheit to Celsius (°F → °C)');

  const ConversionType(this.label);
  final String label;
}

class TemperatureState {
  final String result;
  final String? error;
  final ConversionType conversionType;

  TemperatureState({
    this.result = '',
    this.error,
    this.conversionType = ConversionType.celsiusToFahrenheit,
  });

  TemperatureState copyWith({
    String? result,
    String? error,
    ConversionType? conversionType,
  }) {
    return TemperatureState(
      result: result ?? this.result,
      error: error,
      conversionType: conversionType ?? this.conversionType,
    );
  }
}
