import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../domain/services/qr_generator_service.dart';
import '../models/local/base_data_model.dart';
import '../models/local/embedded_data_model.dart';

///
/// Implementation of `QRGeneratorRepository`
///
class QRGeneratorService implements IQRGeneratorService {
  @override
  QrPainter generateBaseQRCode(BaseDataToEncodeModel model, {Color color}) {
    return QrPainter(
      data: model.data,
      gapless: false,
      version: QrVersions.auto,
      color: color ?? const Color(0xff000000),
    );
  }

  @override
  QrImage generateImageEmbeddedQRCode(
    EmbeddedDataToEncodeModel model, {
    Size assetImageSize = const Size.square(80),
  }) {
    return QrImage(
      data: model.data,
      gapless: false,
      version: QrVersions.auto,
      embeddedImage: AssetImage(model.assetImage),
      embeddedImageStyle: QrEmbeddedImageStyle(size: assetImageSize),
      errorStateBuilder: (context, error) => model.error,
    );
  }
}
