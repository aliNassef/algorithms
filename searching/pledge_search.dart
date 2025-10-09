enum Direction { north, east, south, west }

class MazeSolver {
  final List<List<int>> maze; // 0 = طريق, 1 = حيطه
  int x, y; // موقع الشخص
  Direction dir;
  int angleCounter = 0;

  MazeSolver(this.maze, this.x, this.y, this.dir);

  bool atExit() => maze[y][x] == 2; // 2 = خروج

  void moveForward() {
    switch (dir) {
      case Direction.north:
        if (y > 0 && maze[y - 1][x] != 1) y--;
        break;
      case Direction.east:
        if (x < maze[0].length - 1 && maze[y][x + 1] != 1) x++;
        break;
      case Direction.south:
        if (y < maze.length - 1 && maze[y + 1][x] != 1) y++;
        break;
      case Direction.west:
        if (x > 0 && maze[y][x - 1] != 1) x--;
        break;
    }
  }

  void turnLeft() {
    dir = Direction.values[(dir.index + 3) % 4];
    angleCounter++;
  }

  void turnRight() {
    dir = Direction.values[(dir.index + 1) % 4];
    angleCounter--;
  }

  bool frontIsClear() {
    switch (dir) {
      case Direction.north:
        return y > 0 && maze[y - 1][x] != 1;
      case Direction.east:
        return x < maze[0].length - 1 && maze[y][x + 1] != 1;
      case Direction.south:
        return y < maze.length - 1 && maze[y + 1][x] != 1;
      case Direction.west:
        return x > 0 && maze[y][x - 1] != 1;
    }
  }

  void solve(Direction originalDir) {
    while (!atExit()) {
      if (frontIsClear()) {
        moveForward();
      } else {
        // أول لفة يمين عند الحيطة
        turnRight();

        // لف حوالين الحيطة لحد ما يرجع العداد صفر وانت مواجه الاتجاه الأصلي
        do {
          if (frontIsClear()) {
            moveForward();
          } else {
            // لو قدامك مسدود
            turnRight();
          }

          // حاول تلف شمال لو ممكن
          if (!frontIsClear()) {
            turnLeft();
          }
        } while (!(angleCounter == 0 && dir == originalDir));
      }
      print("(${x}, ${y}) facing $dir | counter = $angleCounter");
    }
    print("🎉 Reached Exit at ($x, $y)!");
  }
}

void main() {
  // 0 = طريق، 1 = حيطه، 2 = خروج
  List<List<int>> maze = [
    [1, 1, 1, 1, 1],
    [1, 0, 0, 2, 1],
    [1, 0, 1, 1, 1],
    [1, 0, 0, 0, 1],
    [1, 1, 1, 1, 1],
  ];

  var solver = MazeSolver(maze, 1, 3, Direction.north);
  solver.solve(Direction.north);
}
