## About

This is a monorepo for packaging starter kits for multiple languages for the todo text client problem.

See `Makefile` comments to see how language specific zip archives are created.

### Supported Languages

- [x] C++
- [x] JavaScript
- [x] Java
- [x] Python
- [x] Ruby

### Run

To generate the zip archives,

```
$ make all --silent
Removed previous artefacts from _build/ directory.
Created C++ package: todo-txt-cpp.zip
Created JavaScript package: todo-txt-javascript.zip
Packaging completed.
```
