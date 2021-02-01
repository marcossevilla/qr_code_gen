import 'package:qr_flutter/qr_flutter.dart';

import '../../data/models/local/embedded_data_model.dart';
import '../services/qr_generator_service.dart';

///
/// Generating embedded asset QR code use case
///
/// This use case only requires a encoded data string to return a `QrImage`
///
class GenerateAssetQR {
  /// Base constructor only requires a `QRGeneratorRepository` object
  GenerateAssetQR(this.repository);

  /// Repository to generate QR code
  final IQRGeneratorService repository;

  /// call method to make it a callable class and return the QR code with image
  QrImage call(EmbeddedDataToEncodeModel model) {
    return repository.generateImageEmbeddedQRCode(model);
  }
}
