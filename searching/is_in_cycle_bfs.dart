bool isInCycle(Map<String, List<String>> graph, String start) {
  Set<String> current = {start};
  Set<String> visited = {};

  while (current.isNotEmpty) {
    Set<String> next = {};
    for (var node in current) {
      for (var neighbour in graph[node] ?? []) {
        if (neighbour == start) {
          return true;
        }

        if (!visited.contains(neighbour)) {
          next.add(neighbour);
        }
      }
    }
    visited.addAll(current);
    current = next;
  }

  return false;
}

void main() {
  var graph = {
    'A': ['B'],
    'B': ['C'],
    'C': ['D'],
    'D': ['A'],  
  };

  print(isInCycle(graph, 'A'));  
  print(isInCycle(graph, 'B')); 
  print(isInCycle(graph, 'E'));  
}
