In this step we want to see how you implement a command-line (CLI) program that lets you manage your todos.

The specification for this problem is written down as tests. Since we haven’t actually implemented anything, the tests are currently failing. You have to solve the problem by implementing the application and getting all the tests to pass.

Here's how it should work when you're done:

[![Todo-CLI](https://res.cloudinary.com/sv-co/image/upload/v1607935139/fullstack-CEF/Todo-CLI/play-video-demo_fp50wp.png)](https://vimeo.com/490621534)
## Getting started

1. Install Python: Python is usually installed by default on most modern systems. To check what your currently have, open a terminal and run the following command

	```
	  python3 --version

	```
  This should output some information on the installed Python version.
	You can also install python by following these instructions. https://installpython3.com/

2. You are expected to write the code in `todo.py` file.

3. Once you are done with the changes you should be able to execute the todo app by running the following commandfrom the terminal.

   **On Windows:**

   ```
   ./todo.bat
   ```

   **On \*nix:**

   ```
   ./todo.sh
   ```

## Run Automated Tests

1. Install Node.js: You need to have npm installed in your computer for this problem. It comes with Node.js and you can get it by installing Node from https://nodejs.org/en/

2. Run `npm install` to install all dependencies

3. Create symbolic link to the executable file

   **On Windows:**

   ```
   > mklink todo todo.bat
   ```

   **On \*nix:**

   ```
   $ ln -s todo.sh todo
   ```

4. Now run `npm test` and you will see all the tests failing. As you fill in each functionality, you can re-run the tests to see them passing one by one.

## Specification

1. The app can be run in the console with `./todo`.

2. The app should read from and write to a `todo.txt` text file. Each todo item occupies a single line in this file. Here is an example file that has 2 todo items.

    ```txt
    water the plants
    change light bulb
    ```

3.  When a todo item is completed, it should be removed from `todo.txt` and instead added to the `done.txt` text file. This file has a different format:

    ```txt
    x 2020-06-12 the text contents of the todo item
    ```

    1. the letter x
    2. the current date in `yyyy-mm-dd` format
    3. the original text

    The date when the todo is marked as completed is recorded in the `yyyy-mm-dd` format (ISO 8601). For example, a date like `15th August, 2020` is represented as `2020-08-15`.

4.  The application must open the files `todo.txt` and `done.txt` from where the app is run, and not where the app is located. For example, if we invoke the app like this:

    ```
    $ cd ~/plans
    $ ~/apps/todo ls
    ```

    The application should look for the text files in `~/plans`, since that is the user’s current directory.

## Usage

### 1. Help

Executing the command without any arguments, or with a single argument `help` prints the CLI usage.

  ```
  $ ./todo help
  Usage :-
  $ ./todo add "todo item"  # Add a new todo
  $ ./todo ls               # Show remaining todos
  $ ./todo del NUMBER       # Delete a todo
  $ ./todo done NUMBER      # Complete a todo
  $ ./todo help             # Show usage
  $ ./todo report           # Statistics
  ```

### 2. List all pending todos

Use the `ls` command to see all the todos that are not yet complete. The most recently added todo should be displayed first.

```
$ ./todo ls
[2] change light bulb
[1] water the plants
```
If list is empty, display this message.

```
$ ./todo ls
There are no pending todos!
```

### 3. Add a new todo

Use the `add` command. The text of the todo item should be enclosed within double quotes (otherwise only the first word is considered as the todo text, and the remaining words are treated as different arguments).

```
$ ./todo add "the thing i need to do"
Added todo: "the thing i need to do"
```
Show error message when add is not followed by a todo string

```
$ ./todo add
Error: Missing todo string. Nothing added!
```

### 4. Delete a todo item

Use the `del` command to remove a todo item by its number.

```
$ ./todo del 3
Deleted todo #3
```

Attempting to delete a non-existent todo item should display an error message.

```
$ ./todo del 5
Error: todo #5 does not exist. Nothing deleted.
```

When delete does not have enough arguments display an error message.

```
$ ./todo del 
Error: Missing NUMBER for deleting todo.
```
### 5. Mark a todo item as completed

Use the `done` command to mark a todo item as completed by its number.

```
$ ./todo done 1
Marked todo #1 as done.
```

Attempting to mark a non-existed todo item as completed will display an error message.

```
$ ./todo done 5
Error: todo #5 does not exist.
```
Marking as done without providing a todo number will display an error message.

```
$ ./todo done
Error: Missing NUMBER for marking todo as done.
```

### 6. Generate a report

Use the `report` command to see the latest tally of pending and completed todos.

```
$ ./todo report
yyyy-mm-dd Pending : 1 Completed : 4
```


## Improving [README.md](https://github.com/nseadlc-2020/package-todo-cli-task/blob/master/python/getting_started.md)
If you feel like we are missing out steps, feel free to make a pull request. [Github Repo](https://github.com/nseadlc-2020/package-todo-cli-task)
