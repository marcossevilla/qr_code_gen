import 'package:qr_flutter/qr_flutter.dart';

import '../../data/models/local/base_data_model.dart';
import '../services/qr_generator_service.dart';

///
/// Generating base QR code use case
///
/// This use case only requires a encoded data string to return a `QrPainter`
///
class GenerateBaseQR {
  /// Base constructor only requires a `QRGeneratorRepository` object
  GenerateBaseQR(this.repository);

  /// Repository to generate QR code
  final IQRGeneratorService repository;

  /// call method to make it a callable class and return the QR code
  QrPainter call(BaseDataToEncodeModel data) {
    return repository.generateBaseQRCode(data);
  }
}
