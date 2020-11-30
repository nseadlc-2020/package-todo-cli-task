#
# Add a new langauge by creating a build rule like either cpp or javascript
# 
# Checklist:
# - [ ] Add a todo.[java|rb|py] file depending on the language
# - [ ] Copy shared files
#		The include:
# 	1. `README.md`: for the todo-txt-cli problem
# 	2. `todo.test.js`: end-to-end testing using Jest JavaScript framework
#		3. `package.json`: for installing jest
# 	4. `todo.sh`: template for adding language specific binary
# - [ ] Append language specific executable command to `todo.sh`
#

TARGETS = cpp javascript


all: clean $(TARGETS)
	echo "Packaging completed."
	open _build/

cpp: _build
	cp -rf cpp _build
	cp -rf shared/ _build/cpp
	# Append C++ compiled binary to `todo.sh`
	# The $@ will pass through CLI args to the binary
	echo \\n./todo \"$$\@\" >> _build/cpp/todo.sh
	cd _build && zip -jr --quiet todo-txt-cpp.zip cpp -x "node_modules" -x "package-lock.json"
	rm -rf _build/cpp
	echo "Created C++ package: todo-txt-cpp.zip"

javascript: _build
	cp -rf javascript _build
	cp -rf shared/ _build/javascript
	# Append node command to `todo.sh`
	# The $@ will pass through CLI args to the node executable
	echo \\nnode todo.js \"$$\@\" >> _build/javascript/todo.sh
	cd _build && zip -jr --quiet todo-txt-javascript.zip javascript -x "node_modules" -x "package-lock.json"
	rm -rf _build/javascript
	echo "Created JavaScript package: todo-txt-javascript.zip"

_build:
	mkdir -p _build

clean:
	rm -rf _build
	echo "Removed previous artefacts from _build/ directory."