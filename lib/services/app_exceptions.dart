class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException
{
  BadRequestException([String? message,String? url]):super(message, 'Bad Request', url);
}

class FetchDataException extends AppException
{
  FetchDataException([String? message,String? url]):super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppException
{
  ApiNotRespondingException([String? message,String? url]):super(message, 'Api not responding', url);
}

class UnAuthorizedException extends AppException
{
  UnAuthorizedException([String? message,String? url]):super(message, 'Unauthorized request', url);
}

class UnprocessableException extends AppException {
  UnprocessableException([String? message,String? url]):super(message, 'Unprocessable data Exception', url);
}