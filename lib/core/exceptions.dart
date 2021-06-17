class AppExceptions implements Exception {
  final String message;
  AppExceptions(this.message);

  @override
  String toString() {
    return this.message;
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException(String message) : super(message);
}

class UnauthorizedRequestException extends AppExceptions {
  UnauthorizedRequestException(String message) : super(message);
}

class BadRequestException extends AppExceptions {
  BadRequestException(String message) : super(message);
}
