#include <iostream>

auto usage = R"(Usage :-
$ ./todo.exe add "todo item"  # Add a new todo
$ ./todo.exe ls               # Show remaining todos
$ ./todo.exe del NUMBER       # Delete a todo
$ ./todo.exe done NUMBER      # Complete a todo
$ ./todo.exe help             # Show usage
$ ./todo.exe report           # Statistics
)";

int main(int argc, char *argv[]) {

  if (argc < 2) {
    std::cout << usage;
    return 0;
  }
}
