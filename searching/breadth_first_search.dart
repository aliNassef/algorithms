import 'dart:collection';

void BFS(Map<String, List<String>> graph, String start, String goal) {
  Queue<String> queue = Queue<String>();
  Set<String> visited = {};

  queue.add(start);
  visited.add(start);
  while (queue.isNotEmpty) {
    String current = queue.removeFirst();
    print('Visiting: $current');

    if (current == goal) {
      print('arrived');
      return;
    }
    for (var neighbour in graph[current] ?? []) {
      if (!visited.contains(neighbour)) {
        queue.add(neighbour);
        visited.add(neighbour);
      }
    }
  }
  print('not found');
}

void main() {
  Map<String, List<String>> graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': [],
    'F': [],
  };

  BFS(graph, 'A', 'F');
}
