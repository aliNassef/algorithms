List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) {
    return arr;
  }
  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);

  left = mergeSort(left);
  right = mergeSort(right);
  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> res = [];
  int i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] > right[j]) {
      res.add(right[j]);
      j++;
    } else {
      res.add(left[i]);
      i++;
    }
  }
  while (i < left.length) {
    res.add(left[i]);
    i++;
  }
  while (j < right.length) {
    res.add(right[j]);
    j++;
  }

  return res;
}

void main() {
  List<int> arr = [5, 2, 4, 6, 1, 3];
  print(mergeSort(arr));
}
