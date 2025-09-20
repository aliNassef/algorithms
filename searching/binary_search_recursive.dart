int binarySearchRecursive(List<int> elements, int target, int left, int right) {
  if (left > right) {
    return -1;
  }

  int mid = (left + right) ~/ 2;

  if (elements[mid] == target) {
    return mid;
  } else if (elements[mid] < target) {
    return binarySearchRecursive(elements, target, mid + 1, right);
  } else {
    return binarySearchRecursive(elements, target, left, mid - 1);
  }
}
