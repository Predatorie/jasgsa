class Result<T> {
  T value;
  bool isFailure;
  bool isSuccess;
  String errorMessage;

  Result(
      {this.value,
      this.errorMessage,
      this.isFailure = false,
      this.isSuccess = true});
}
