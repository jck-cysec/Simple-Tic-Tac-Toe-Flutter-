// ignore: file_names
import 'package:flutter/material.dart';

void displayResult(
    {required String winner,
    required BuildContext context,
    required Function() emptyBoard,
    required Function() restart}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) {
      // Tentukan warna berdasarkan pemenang
      Color winnerColor = winner == 'O' 
          ? Color(0xFF4ade80) 
          : winner == 'X' 
              ? Color(0xFFf91616)
              : Color(0xFF4a90e2);
      
      String resultText = winner == '' ? 'Draw!' : '$winner Wins!';
      String resultIcon = winner == 'O' 
          ? '🎉' 
          : winner == 'X' 
              ? '🏆' 
              : '🤝';
      
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 16,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1e3c72),
                Color(0xFF2a5298),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: winnerColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: winnerColor.withOpacity(0.5),
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Text(
                  resultIcon,
                  style: TextStyle(fontSize: 48),
                ),
              ),
              SizedBox(height: 20),
              
              // Title
              Text(
                resultText,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black38,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        emptyBoard();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4a90e2),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                        shadowColor: Color(0xFF4a90e2).withOpacity(0.5),
                      ),
                      child: Text(
                        'Next Game',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        restart();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.4),
                            width: 2,
                          ),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Restart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}