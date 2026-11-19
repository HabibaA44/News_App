enum AppStates { initial, loading, success, error }

extension AppStateExtention on AppStates {
  bool get isInitial => this == AppStates.initial;
  bool get isLoading => this == AppStates.loading;
  bool get isSuccess => this == AppStates.success;
  bool get isError => this == AppStates.error;
}
