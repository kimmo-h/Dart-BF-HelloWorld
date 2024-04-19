import 'dart:typed_data';

void main() {
  String input = "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.";
  int pointer = 0;
  Uint8List mem = Uint8List(30000);

  for (int i = 0; i < input.length; i++) {
    switch (input[i]) {
      case ">":
        pointer++;
      case "<":
        pointer--;
      case "+":
        mem[pointer]++;
      case "-":
        mem[pointer]--;
      case "[":
        if (mem[pointer] == 0) {
          int s = 1;
          while (s > 0) {
            i++;
            if (input[i] == "[") {
              s++;
            }
            if (input[i] == "]") {
              s--;
            }
          }
        }
      case "]":
        if (mem[pointer] != 0) {
          int s = 1;
          while (s > 0) {
            i--;
            if (input[i] == "]") {
              s++;
            }
            if (input[i] == "[") {
              s--;
            }
          }
        }
      case ".":
        print(String.fromCharCode(mem[pointer]));
    }
  }
}
