List<String>? findCycle(Map<String, List<String>> graph) {
  Set<String> visited = {};
  Set<String> inStack = {};
  List<String> path = [];

  for (var node in graph.keys) {
    var cycle = _dfs(graph, node, visited, inStack, path);
    if (cycle != null) return cycle;
  }
  return null;
}

List<String>? _dfs(
  Map<String, List<String>> graph,
  String node,
  Set<String> visited,
  Set<String> inStack,
  List<String> path,
) {
  if (inStack.contains(node)) {
    int index = path.indexOf(node);
    return path.sublist(index);
  }
  if (visited.contains(node)) return null;

  visited.add(node);
  path.add(node);
  inStack.add(node);

  for (var neighbour in graph[node] ?? []) {
    var cycle = _dfs(graph, neighbour, visited, inStack, path);
    if (cycle != null) return cycle;
  }

  inStack.remove(node);
  path.remove(node);
  return null;
}

void main() {
  var graph = {
    'A': ['B', 'C'],
    'B': ['D'],
    'C': ['D'],
    'D': ['E'],
    'E': ['B'], // الدورة: B → D → E → B
  };

  var cycle = findCycle(graph);
  print(cycle);
}
