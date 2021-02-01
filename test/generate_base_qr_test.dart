import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:qr_code_gen/qr_code_gen.dart';

class MockQRGeneratorRepository extends Mock implements IQRGeneratorService {}

void main() {
  GenerateBaseQR useCase;
  MockQRGeneratorRepository mockRepository;

  setUp(() {
    mockRepository = MockQRGeneratorRepository();
    useCase = GenerateBaseQR(mockRepository);
  });

  final tToEncodeModel = BaseDataToEncodeModel(
    data: 'api.whatsapp.com/12345678',
  );

  final tQrPainter = QrPainter(
    data: tToEncodeModel.data,
    gapless: false,
    version: QrVersions.auto,
    color: const Color(0xff000000),
  );

  test(
    'should return QrPainter when it receives BaseDataToEncodeModel as param',
    () {
      // setup -> create the object to test
      when(
        mockRepository.generateBaseQRCode(any),
      ).thenReturn(tQrPainter);
      // side effects -> collect the result to test
      final result = useCase(tToEncodeModel);
      // expectations -> compare result to expected value
      expect(result, tQrPainter);
      // verifications -> verify other actions that should(n't) happen
      verify(mockRepository.generateBaseQRCode(tToEncodeModel));
    },
  );
}
