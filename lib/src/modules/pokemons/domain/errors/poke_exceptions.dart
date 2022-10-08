abstract class IFailure implements Exception {
  final String mensage;

  IFailure({required this.mensage});
}

class UndefainedException extends IFailure {
  UndefainedException({required super.mensage});
}
