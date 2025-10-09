class TarjanScc {
  // index , map[node] = index , stack , onStack ,lowlink map -> lowlink[node] = minimum (node, neighbour)

  int index = 0;
  Map<String, int> indexMap = {};
  List<String> stack = [];
  Set<String> onStack = {};
  Map<String, int> lowLinkMap = {};
  List<List<String>> sccs = [];
  List<List<String>> trajanSSCS(Map<String, List<String>> graph) {
    for (var node in graph.keys) {
      if (!indexMap.containsKey(node)) {
        _strongConnected(node, graph);
      }
    }

    return sccs;
  }

  void _strongConnected(String node, Map<String, List<String>> graph) {
    indexMap[node] = index;
    lowLinkMap[node] = index;
    index++;
    stack.add(node);
    onStack.add(node);

    for (var neighbour in graph[node] ?? []) {
      if (!indexMap.containsKey(neighbour)) {
        _strongConnected(neighbour, graph);
        lowLinkMap[node] = _min(lowLinkMap[node]!, lowLinkMap[neighbour]!);
      } else if (onStack.contains(neighbour)) {
        lowLinkMap[node] = _min(lowLinkMap[node]!, indexMap[neighbour]!);
      }
    }

    if (indexMap[node] == lowLinkMap[node]) {
      List<String> component = [];
      String w;
      do {
        w = stack.removeLast();
        onStack.remove(w);
        component.add(w);
      } while (w != node);
      sccs.add(component);
    }
  }

  int _min(int a, int b) => a < b ? a : b;
}

void main() {
  var graph = {
    'A': ['B'],
    'B': ['C'],
    'C': ['A', 'D'],
    'D': ['E'],
    'E': ['F', 'D'],
  };

  var trajan = TarjanScc();
  var sscs = trajan.trajanSSCS(graph);
  for (var collection in sscs) {
    print(collection);
  }
}
