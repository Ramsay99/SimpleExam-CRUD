import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:simpleexam/shared/functions/shared_list_functions.dart';

String generateString({int length = 8, bool firstLetterBeCapital = false}) {
  String generatedString =
      String.fromCharCodes(generateListOFNumbers(length: length));
  if (firstLetterBeCapital) {
    generatedString = toBeginningOfSentenceCase(generatedString)!;
  }
  return generatedString;
}
