import 'package:flutter/widgets.dart';

import '../../../domain/entities/base_data_to_encode.dart';

///
/// Model for embedded data to encode, contains `assetImage` and `error`
///
class EmbeddedDataToEncodeModel extends BaseDataToEncode {
  /// Base constructor
  /// It supers the properties to the parent class `BaseDataToEncode`
  EmbeddedDataToEncodeModel({
    @required String data,
    @required this.assetImage,
    @required this.error,
  }) : super(data);

  /// path to asset image to embed in QR code
  final String assetImage;

  /// Error widget to show if there's a problem with the image
  final Widget error;

  @override
  List<Object> get props => [super.data, assetImage, error];
}
