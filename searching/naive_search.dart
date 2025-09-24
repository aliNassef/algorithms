void naiveSearch(String text, String pattern) {
  int n = text.length;
  int m = pattern.length;
  int pos = 0;

  while (pos <= n - m) {
    int j = m - 1;
    while (j >= 0 && pattern[j] == text[pos + j]) {
      j--;
    }

    if (j < 0) {
      print('Occurrence at position ${pos + 1}'); // 1-based output
    }
    pos++;
  }
}

void main() {
  naiveSearch("ABCDABCD", "BCD");
}
