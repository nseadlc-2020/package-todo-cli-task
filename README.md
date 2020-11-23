# Test Problem: Todo App (CLI)

You have to implement a Todo app which has a command-line interface(CLI). The tests are failing right now. Write code to pass all automated tests.

### Setup command

`npm install`

### Run automated tests

`npm test`

## Specification

The todo app has a command-line interface. For a Node.js implementation the command for running the app is `node todo.js`.

The todo app reads from and writes to a `todo.txt` text file. Each todo item occupies a single line in `todo.txt`. Here is an example `todo.txt` with 2 todo items.

```txt
water the plants
change light bulb
```

When a todo item is marked as completed it is removed from `todo.txt` and added to the `done.txt` text file. The line format has additional metadata separated by a single space:

```txt
x dd/mm/yyyy the text contents of the todo item
```

1. the x character marker
2. the current date in `dd/mm/yyyy` format
3. the original text

The date when the todo is marked as completed is recorded in the `dd/mm/yyyy` format. For example, a date like `15th August, 2020` becomes `15/08/2020`.

_Lookup the text files `todo.txt` and `done.txt` from where the command-line is run_.

### Usage

Executing the command without any arguments, or with a single argument `help` prints the CLI usage.

```
$ node todo.js help
Usage :-
$ node todo.js add "todo item"  # Add a new todo
$ node todo.js ls               # Show remaining todos
$ node todo.js del NUMBER       # Delete a todo
$ node todo.js done NUMBER      # Complete a todo
$ node todo.js help             # Show usage
$ node todo.js report           # Statistics
```

### Show pending todos

Use the `ls` command. The most recently added todo is displayed first.

```
$ node todo.js ls
[2] change light bulb
[1] water the plants
```

### Add a todo item

Use the `add` command. The text of the todo item is enclosed within double quotes.

```
$ node todo.js add "the thing i need to do"
Added todo: "the thing i need to do"
```

### Delete a todo item

Use the `del` command to remove a todo item by its number.

```
$ node todo.js del 3
Deleted todo #3
```

Attempting to delete a non-existent todo item will display an error message.

```
$ node todo.js del 5
Error: todo #5 does not exist. Nothing deleted.
```

### Mark todo item as completed

Use the `done` command to mark a todo item as completed by its number.

```
$ node todo.js done 1
Marked todo #1 as done.
```

Attempting to mark a non-existed todo item as completed will display an error message.

```
$ node todo.js done 5
Error: todo #5 does not exist.
```

### Generate a report

Use the `report` command to see the latest tally of pending and completed todos.

```
$ node todo.js report
dd/mm/yyyy Pending : 1 Completed : 4
```
