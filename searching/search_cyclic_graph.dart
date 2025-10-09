bool hasCycle(Map<String, List<String>> graph) {
  Set<String> visited = {};
  /// بندور عليها دلوقت 
  Set<String> inStack = {};
  for (var node in graph.keys) {
    if (_dfs(graph, node, visited, inStack)) {
      return true;
    }
  }
  return false;
}

bool _dfs(
  Map<String, List<String>> graph,
  String node,
  Set<String> visited,
  Set<String> inStack,
) {
  if (inStack.contains(node)) return true;
  if (visited.contains(node)) return false;

  visited.add(node);
  inStack.add(node);

  for (var neighbour in graph[node] ?? []) {
    if (_dfs(graph, neighbour, visited, inStack)) {
      return true;
    }
  }
  inStack.remove(node);
  return false;
}

void main() {
  var graph = {
    'A': ['B', 'C'],
    'B': ['D'],
    'C': ['D'],
    'D': ['E'],
    'E': ['B'],
  };

  print(hasCycle(graph));
}
