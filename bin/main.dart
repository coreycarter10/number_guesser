import 'dart:math';
import 'package:console/console.dart';
import 'package:number_guesser/console_utils.dart';

int answer;
int guesses;
int guess;


void main() {
  Console.init();

  initGame();
}

void initGame() {
  answer = Random().nextInt(10) + 1;
  guesses = 0;

  Console.setTextColor(ConsoleColor.blue.index);
  Console.write("\nI'm thinking of a number between 1 and 10...\n");

  runGame();
}



void runGame() {
  do {
    guess = promptForNumber("\nEnter a guess: ");

    guesses++;

    Console.write("${checkGuess(guess, answer)}\n");
  } while (guess != answer);

  Console.setTextColor(ConsoleColor.magenta.index);
  if (Prompter("\nWould you like to play again? ").askSync()); {
    initGame();
  }
}

int promptForNumber(String prompt) {
  Console.setTextColor(ConsoleColor.green.index);
  final input = promptForString(prompt);
  return int.tryParse(input);
}

int compareInt(int a, int b) {
  if (a < b) return -1;
  if (a > b) return 1;
  return 0;
}

String checkGuess(int guess, int answer) {
  switch (compareInt(guess, answer)) {
    case -1: Console.setTextColor(ConsoleColor.red.index); return "Too low!"; break;
    case 1: Console.setTextColor(ConsoleColor.red.index); return "Too high!"; break;
    case 0: Console.setTextColor(ConsoleColor.white.index, bright: true); return "You win! It took you $guesses guesses."; break;
    default: return null;
  }
}

