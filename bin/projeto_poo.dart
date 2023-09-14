import 'dart:io';

void main() {
  List<String> board = List.generate(9, (index) => (index + 1).toString());
  bool isPlayerX = true;
  int moves = 0;
  bool gameOver = false;

  void printBoard() {
    for (var i = 0; i < 9; i += 3) {
      print('${board[i]} | ${board[i + 1]} | ${board[i + 2]}');
      if (i < 6) print('---------');
    }
  }

  bool checkWin() {
    // Check rows, columns, and diagonals
    for (var i = 0; i < 3; i++) {
      if (board[i * 3] == board[i * 3 + 1] && board[i * 3 + 1] == board[i * 3 + 2]) {
        return true;
      }
      if (board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
        return true;
      }
    }
    if (board[0] == board[4] && board[4] == board[8]) {
      return true;
    }
    if (board[2] == board[4] && board[4] == board[6]) {
      return true;
    }
    return false;
  }

  print('Bem-vindo ao Jogo da Velha!');

  while (!gameOver) {
    printBoard();

    int playerMove = 0;
    bool validMove = false;

    do {
      stdout.write('Jogador ${isPlayerX ? 'X' : 'O'}, escolha uma posição (1-9): ');
      String? input = stdin.readLineSync();
      if (input != null) {
        playerMove = int.tryParse(input) ?? 0; // Inicialize com 0 se a conversão falhar
        if (playerMove >= 1 && playerMove <= 9 && board[playerMove - 1] == playerMove.toString()) {
          validMove = true;
        } else {
          print('Movimento inválido. Tente novamente.');
        }
      }
    } while (!validMove);

    board[playerMove - 1] = isPlayerX ? 'X' : 'O';
    moves++;
    if (checkWin()) {
      printBoard();
      print('Jogador ${isPlayerX ? 'X' : 'O'} venceu!');
      gameOver = true;
    } else if (moves == 9) {
      printBoard();
      print('Empate!');
      gameOver = true;
    } else {
      isPlayerX = !isPlayerX;
    }
  }
}
