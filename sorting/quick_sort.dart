List<int> quickSort(List<int> arr) {
  if (arr.length <= 1) {
    return arr;
  }

  int pivot = arr[0];
  var left = arr.sublist(1).where((e) => e <= pivot).toList();
  var right = arr.sublist(1).where((e) => e > pivot).toList();

  return [...quickSort(left), pivot, ...quickSort(right)];
}

void main() {
  List<int> arr = [5, 2, 4, 6, 1, 3];
  print(quickSort(arr));
}
