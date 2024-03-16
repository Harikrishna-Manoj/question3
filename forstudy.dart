List<String> getBalancedSubstrings(String S) {
  bool isBalanced(String sub) {
    var uniqueChars = Set.from(sub.split(''));
    if (uniqueChars.length != 2) return false;
    var firstCharCount =
        sub.split('').where((c) => c == uniqueChars.elementAt(0)).length;
    var secondCharCount =
        sub.split('').where((c) => c == uniqueChars.elementAt(1)).length;
    return firstCharCount == secondCharCount;
  }

  int maxLength = 0;
  List<String> balancedSubstrings = [];

  for (int i = 0; i < S.length; i++) {
    for (int j = i + 2; j <= S.length; j += 2) {
      // Step by 2 for even length
      var sub = S.substring(i, j);
      if (isBalanced(sub)) {
        if (sub.length > maxLength) {
          maxLength = sub.length;
          balancedSubstrings = [sub];
        } else if (sub.length == maxLength) {
          balancedSubstrings.add(sub);
        }
      }
    }
  }

  return balancedSubstrings;
}

void main(List<String> args) {
  String S = "cabbacc";
  print(getBalancedSubstrings(S));
}
