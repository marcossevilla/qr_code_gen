import 'package:equatable/equatable.dart';

///
/// This class represents the basic structure of
/// some data to encode in a QR code
///
/// The data is an encoded string, the encoder may vary
///

abstract class BaseDataToEncode extends Equatable {
  /// Base constructor
  BaseDataToEncode(this.data);

  /// Encoded data string
  final String data;
}
