void DFSRecursion(
  Map<String, List<String>> graph,
  Set<String> isVisited,
  String current,
  String goal,
) {
  if (isVisited.contains(current)) {
    return;
  }
  if (current == goal) {
    print('congrats');
    return;
  }
  print(current);

  isVisited.add(current);

  for (var neighbour in graph[current] ?? []) {
    DFSRecursion(graph, isVisited, neighbour, goal);
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

  Set<String> visited = {};
  DFSRecursion(graph, visited, 'A', 'H');
}
