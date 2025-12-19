import 'package:flutter/material.dart';

import 'widgets/displayScores.dart';
import 'gameRules.dart';
import './widgets/displayResult.dart';

class TTTScreen extends StatefulWidget {
  const TTTScreen({super.key});

  @override
  State<TTTScreen> createState() {
    return _TTTScreenState();
  }
}

class _TTTScreenState extends State<TTTScreen> {
  bool player1Turn = true;
  List<String> gridCurrentState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int movesCount = 0;

  var player1Score = 0;
  var player2Score = 0;

  void _makingMove(int index) {
    setState(() {
      if (player1Turn && gridCurrentState[index] == '') {
        gridCurrentState[index] = 'O';
      } else if (!player1Turn && gridCurrentState[index] == '') {
        gridCurrentState[index] = 'X';
      }
      movesCount++;

      player1Turn = !player1Turn;

      var winner = gameResult(gridCurrentState, movesCount);
      if (winner == 'O') {
        player1Score++;
        player1Turn = true;
        displayResult(
            winner: winner,
            context: context,
            emptyBoard: _clearBoard,
            restart: _restart);
      } else if (winner == 'X') {
        player2Score++;
        player1Turn = false;
        displayResult(
            winner: winner,
            context: context,
            emptyBoard: _clearBoard,
            restart: _restart);
      } else if (movesCount == 9) {
        displayResult(
            winner: winner,
            context: context,
            emptyBoard: _clearBoard,
            restart: _restart);
      }
    });
  }

  void _clearBoard() {
    setState(() {
      gridCurrentState = [
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ];
      movesCount = 0;
    });
  }

  void _restart() {
    setState(() {
      _clearBoard();
      player1Score = 0;
      player2Score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1e3c72),
              Color(0xFF2a5298),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header Title
                Text(
                  'TIC TAC TOE',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                    shadows: [
                      Shadow(
                        color: Colors.black38,
                        offset: Offset(0, 3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                
                // Turn Indicator
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFF4a90e2),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        player1Turn ? Icons.circle_outlined : Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        player1Turn ? 'Player 1 Turn' : 'Player 2 Turn',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                
                Expanded(
                  flex: 1,
                  child: DisplayScore(
                    player1Score: player1Score,
                    player2Score: player2Score,
                  ),
                ),
                const SizedBox(height: 25),
                
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF2d4f7c),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        bool isEmpty = gridCurrentState[index] == '';
                        bool isO = gridCurrentState[index] == 'O';
                        
                        return GestureDetector(
                          onTap: () {
                            _makingMove(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isEmpty
                                  ? Color(0xFF3d5f8f)
                                  : isO
                                      ? Color(0xFF4ade80)
                                      : Color(0xFFf97316),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: isEmpty
                                  ? [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ]
                                  : [
                                      BoxShadow(
                                        color: isO
                                            ? Color(0xFF4ade80).withOpacity(0.5)
                                            : Color(0xFFf97316).withOpacity(0.5),
                                        blurRadius: 12,
                                        offset: Offset(0, 6),
                                      ),
                                    ],
                            ),
                            child: Center(
                              child: Text(
                                gridCurrentState[index],
                                style: TextStyle(
                                  color: isEmpty ? Color(0xFF5a7ba6) : Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  shadows: isEmpty ? [] : [
                                    Shadow(
                                      color: Colors.black38,
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _clearBoard,
                          icon: Icon(Icons.clear_all, size: 24),
                          label: Text(
                            'Clear Board',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4a90e2),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 8,
                            shadowColor: Colors.black38,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.refresh, size: 24),
                          label: Text(
                            'Restart',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _restart,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4a90e2),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 8,
                            shadowColor: Colors.black38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}