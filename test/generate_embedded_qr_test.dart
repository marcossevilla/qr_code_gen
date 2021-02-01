import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:qr_code_gen/qr_code_gen.dart';

class MockQRGeneratorRepository extends Mock implements IQRGeneratorService {}

void main() {
  GenerateAssetQR useCase;
  MockQRGeneratorRepository mockRepository;

  setUp(() {
    mockRepository = MockQRGeneratorRepository();
    useCase = GenerateAssetQR(mockRepository);
  });

  final tToEncodeModel = EmbeddedDataToEncodeModel(
    data: 'api.whatsapp.com/12345678',
    assetImage: 'assets/sample.png',
    error: const Text('error'),
  );

  final tQrImage = QrImage(
    data: tToEncodeModel.data,
    gapless: false,
    version: QrVersions.auto,
    embeddedImage: AssetImage(tToEncodeModel.assetImage),
    errorStateBuilder: (context, error) => tToEncodeModel.error,
  );

  test(
    'should return QrImage when it receives EmbeddedDataToEncodeModel as param',
    () {
      // setup -> create the object to test
      when(mockRepository.generateImageEmbeddedQRCode(any))
          .thenReturn(tQrImage);
      // side effects -> collect the result to test
      final result = useCase(tToEncodeModel);
      // expectations -> compare result to expected value
      expect(result, tQrImage);
      // verifications -> verify other actions that should(n't) happen
      verify(mockRepository.generateImageEmbeddedQRCode(tToEncodeModel));
    },
  );
}
