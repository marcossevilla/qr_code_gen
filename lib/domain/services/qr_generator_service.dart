import 'package:qr_flutter/qr_flutter.dart';

import '../../data/models/local/base_data_model.dart';
import '../../data/models/local/embedded_data_model.dart';

///
/// `QRGeneratorRepository` defines all the methods to generate QR codes
///
abstract class IQRGeneratorService {
  /// `generateBaseQRCode` expects a simple encoded data string
  /// and returns the `QrPainter` with the data already encoded
  QrPainter generateBaseQRCode(BaseDataToEncodeModel data);

  /// `generateImageEmbeddedQRCode` expects an encoded data string
  /// and the desired asset data in ByteData
  ///
  /// `assetData` is the path to the asset to embedded in the code
  ///
  /// `error` is the widget to show if there's an error loading the asset
  QrImage generateImageEmbeddedQRCode(EmbeddedDataToEncodeModel data);
}
