// ignore: unused_element
String gameResult(List<String> grid, numMoves) {
  var winner = '';
  // Checking for Win in Rows
  if (grid[0] == grid[1] && grid[1] == grid[2] && grid[0] != '') {
    winner = grid[0];
  } else if (grid[3] == grid[4] && grid[4] == grid[5] && grid[3] != '') {
    winner = grid[3];
  } else if (grid[6] == grid[7] && grid[7] == grid[8] && grid[6] != '') {
    winner = grid[6];
  }
  // Checking for Win in Columns
  else if (grid[0] == grid[3] && grid[3] == grid[6] && grid[0] != '') {
    winner = grid[0];
  } else if (grid[1] == grid[4] && grid[4] == grid[7] && grid[1] != '') {
    winner = grid[1];
  } else if (grid[2] == grid[5] && grid[5] == grid[8] && grid[2] != '') {
    winner = grid[2];
  }
  // Checking for Win in Diagonals
  else if (grid[0] == grid[4] && grid[4] == grid[8] && grid[0] != '') {
    winner = grid[0];
  } else if (grid[2] == grid[4] && grid[4] == grid[6] && grid[2] != '') {
    winner = grid[2];
  }
  // In case of Draw
  else if (numMoves == 9) {
    print('Draw!');
  }
  return winner;
}
