int binarySearchIterative(List<int> elements, int target, int left, int right) {
  while (left <= right) {
    int mid = (left + right) ~/ 2;
    if (elements[mid] == target) {
      return mid;
    } else if (elements[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}
