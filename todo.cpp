#include <iostream>

auto usage = R"(Usage :-
$ node todo.js add "todo item"  # Add a new todo
$ node todo.js ls               # Show remaining todos
$ node todo.js del NUMBER       # Delete a todo
$ node todo.js done NUMBER      # Complete a todo
$ node todo.js help             # Show usage
$ node todo.js report           # Statistics
)";

int main(int argc, char *argv[]) {

  if (argc < 2) {
    std::cout << usage;
    return 0;
  }
}