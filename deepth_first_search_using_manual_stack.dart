void DFS(Map<String, List<String>> graph, String start, String goal) {
  Set<String> isVisited = {};
  List<String> stack = [];

  stack.add(start);

  while (stack.isNotEmpty) {
    String top = stack.removeLast();
    if (isVisited.contains(top)) {
      continue;
    }
    print(top);
    if (top == goal) {
      print('congrats');
      return;
    }
    isVisited.add(top);
    for (var neighbour in graph[top] ?? []) {
      if (!isVisited.contains(neighbour)) {
        stack.add(neighbour);
      }
    }
  }
}

void main() {
  Map<String, List<String>> graph = {
    'A': ['B', 'C'],
    'B': ['A'],
    'C': ['A', 'D', 'E'],
    'D': ['C'],
    'E': ['C'],
  };

  DFS(graph, 'A', 'E');
}
