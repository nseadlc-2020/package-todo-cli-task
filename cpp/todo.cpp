#include <iostream>

auto usage = R"(Usage :-
$ ./todo add "todo item"  # Add a new todo
$ ./todo ls               # Show remaining todos
$ ./todo del NUMBER       # Delete a todo
$ ./todo done NUMBER      # Complete a todo
$ ./todo help             # Show usage
$ ./todo report           # Statistics
)";

int main(int argc, char *argv[]) {

  if (argc < 2) {
    std::cout << usage;
    return 0;
  }
}
