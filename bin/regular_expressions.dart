void main(List<String> arguments) {
  const strings = [
    'You\u0027ll have some characters here',
    'It cost 5 euros 2 years ago',
    '79995554411',
    '',
    '\n',
    ' \n\t'
  ];
  final characterGroupRegExp = {
    'digits \\d': RegExp(r'\d'),
    'digits or letters \\w': RegExp(r'\w'),
    'whitespace char \\s': RegExp(r'\s'),
    'any is not a digits \\D': RegExp(r'\D'),
    'any is not alphanumeric \\W': RegExp(r'\W'),
    'any is not a whitespace char \\S': RegExp(r'\S'),
    'not the newline \\n': RegExp(r'.'),
  };

  final characterRangeRegExp = {
    'one of them [asdf]': RegExp(r'[asdf]'),
    'find from range [0-8a-z]': RegExp(r'[0-8a-z]'),
    'letters that are not [^asdf]': RegExp(r'[^asdf]'),
    'not in that range [^0-8a-z]': RegExp(r'[^0-8a-z]'),
  };

  final repeatingOptionalRegExp = {
    'optional char t?here': RegExp(r't?here'),
    'one or more \\d+': RegExp(r'\d+'),
    'zero or more \\w*': RegExp(r'\w*'),
    'precise range \\d{3,8}': RegExp(r'\d{3,8}'),
    'open-ended range \\d{12,}': RegExp(r'\d{12,}'),
    'precise number \\d{11}': RegExp(r'\d{11}'),
  };

  final groupingSubexpressionsRegExp = {
    'find it 1 or more times (ar)+': RegExp(r'(ar)+'),
    'It (really)? cost 5 euros 2 years ago': RegExp(
        r'It( really)? cost 5 euros 2 years ago'), //( really) is optional
    '([+]?7){1}': RegExp(r'([+]?7){1}'), //find +7 or 7 one time
  };

  final choicePatternsRegExp = {
    '(a few|some|several)': RegExp(r'(a few|some|several)'),
    '1 euro|(3|4|5) euros': RegExp(r'1 euro|(3|4|5) euros'),
  };

  final wordStringBoundariesRegExp = {
    'me at the beginning word': RegExp(r'\bme'),
    'me in the end of word': RegExp(r'me\b'),
    'has separate word cost': RegExp('cost'),
    'contains only It': RegExp(r'^It$'),
    'starts with It': RegExp(r'^It'),
    'ends with It': RegExp(r'It$'),
  };

  final namingGroupSubexpressionRegExp = {
    'money': RegExp(r'(?<money>ruble|euro|pound)s?'),
    'mobileOperator': RegExp(r'(?<mobileOperator>921|999|903)'),
  };

  RegExpMatch? match1 =
      namingGroupSubexpressionRegExp['money']!.firstMatch(strings[1]);
  RegExpMatch? match2 =
      namingGroupSubexpressionRegExp['mobileOperator']!.firstMatch(strings[2]);
  print(match1?.namedGroup('money'));
  print(match2?.namedGroup('mobileOperator'));

  /// Extracts file extension from string
  String? extractExt(String fileName) {
    final pattern = RegExp(r'\.(?<ext>[0-9a-zA-Z]+)$');
    final match = pattern.firstMatch(fileName);
    return match?.namedGroup('ext');
  }

  extractExt('verygoodfile.dart'); // 'dart'

  /// Validates email string, *non ascii characters are not accepted*
  bool isValidEmail(String email) {
    final pattern = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    return pattern.hasMatch(email.trim());
  }

  /// Password is valid if it has an uppercase, lowercase, number, symbol and has at least 8 characters
  bool isPasswordValid(String password) {
    final containsUpperCase = RegExp(r'[A-Z]').hasMatch(password);
    final containsLowerCase = RegExp(r'[a-z]').hasMatch(password);
    final containsNumber = RegExp(r'\d').hasMatch(password);
    final containsSymbols =
        RegExp(r'[`~!@#$%\^&*\(\)_+\\\-={}\[\]\/.,<>;]').hasMatch(password);
    final hasManyCharacters = RegExp(r'^.{8,128}$', dotAll: true)
        .hasMatch(password); // This is variable

    return containsUpperCase &&
        containsLowerCase &&
        containsNumber &&
        containsSymbols &&
        hasManyCharacters;
  }
}
