List<int> insertionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 1; i < n; i++) {
    int j = i;
    while (j >= 1 && arr[j - 1] > arr[j]) {
      // swapping
      int temp = arr[j];
      arr[j] = arr[j - 1];
      arr[j - 1] = temp;

      j--;
    }
  }

  return arr;
}

List<int> effecentInsertionSort(List<int> arr) {
  int n = arr.length;

  for (int i = 1; i < n; i++) {
    int j = i - 1;
    int key = arr[i];

    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }

    arr[j + 1] = key;
  }
  return arr;
}

void main() {
  List<int> arr = [5, 2, 4, 6, 1, 3];
  effecentInsertionSort(arr);
  print(arr);
}
