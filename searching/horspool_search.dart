Map<String, int> calcDTable(String pattern) {
  Map<String, int> D = {};
  for (int i = 0; i < pattern.length; i++) {
    D[pattern[i]] = pattern.length;
  }

  for (int i = 0; i < pattern.length - 1; i++) {
    D[pattern[i]] = pattern.length - i - 1;
  }
  return D;
}

void horspoolSearch(String pattern, String text) {
  int pos = 0;
  int n = text.length;
  int m = pattern.length;
  var dataTable = calcDTable(pattern);
  while (pos <= n - m) {
    int j = m - 1;
    while (j >= 0 && pattern[j] == text[pos + j]) {
      j--;
    }

    if (j < 0) {
      print('occurance ${pos + 1}');
    }
    // diff between horspool & naive 
    var nextChar = text[pos + m - 1];
    pos += dataTable[nextChar] ?? m;
  }
}

void main() {
  horspoolSearch("BCD", "ABCDABCD");
}
