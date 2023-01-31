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

  for (var s in strings) {
    print(s);
    groupingSubexpressionsRegExp.forEach((key, value) {
      print('$key ${value.hasMatch(s)}');
    });
    print('*' * 20);
  }
}
