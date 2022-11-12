part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isDark;
  const ThemeState(this.isDark);

  @override
  List<Object> get props => [isDark];

  factory ThemeState.initial() {
    return const ThemeState(false);
  }

  factory ThemeState.update(bool value) {
    return ThemeState(value);
  }
}
