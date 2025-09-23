List<int> topologicalSort(List<int> nodes, List<List<int>> edges) {
  List<int> res = [];

  while (nodes.isNotEmpty) {
    bool cycle = true;
    for (var v in List<int>.from(nodes)) {
      var startingPoint = edges.where((edge) => edge[1] == v).toList();

      if (startingPoint.isEmpty) {
        nodes.remove(v);
        edges = edges.where((edge) => edge[0] != v).toList();
        res.add(v);
        cycle = false;
      }
    }
    if (cycle) {
      print('warnning deadlock');
      return [];
    }
  }
  return res;
}

void main() {
  var V = [0, 1, 2, 3, 4, 5];
  var E = [
    [5, 2],
    [5, 0],
    [4, 0],
    [4, 1],
    [2, 3],
    [3, 1],
  ];

  var result = topologicalSort(List<int>.from(V), List<List<int>>.from(E));

  print("Topological Sort: $result");
}
