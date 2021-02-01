import 'package:meta/meta.dart';

import '../../../domain/entities/base_data_to_encode.dart';

///
/// Model for base data to encode
///
class BaseDataToEncodeModel extends BaseDataToEncode {
  /// Base constructor
  /// It supers the properties to the parent class `BaseDataToEncode`
  BaseDataToEncodeModel({@required String data}) : super(data);

  @override
  List<Object> get props => [super.data];
}
