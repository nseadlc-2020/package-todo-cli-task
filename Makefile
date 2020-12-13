#
# Add a new langauge by creating a build rule like either cpp or javascript
#
# Checklist:
# - [ ] Add a todo.[java|rb|py] file depending on the language
# - [ ] Copy shared files
# 	1. `README.md`: for the todo-txt-cli problem
# 	2. `todo.test.js`: end-to-end testing using Jest JavaScript framework
# 	3. `package.json`: for installing jest
# 	4. `todo.sh`: template for adding language specific binary
# - [ ] Append language specific executable command to `todo.sh`
#

TARGETS = cpp javascript ruby java python


all: clean $(TARGETS)
	echo "Packaging completed."

cpp: _build
	cp -rf cpp _build
	cp -arf shared/. _build/cpp
	# Append C++ compiled binary to `todo.sh`
	# The $@ will pass through CLI args to the binary
	echo \\n./todo \"$$\@\" >> _build/cpp/todo.sh
	cd _build && zip -r --quiet fellowship-cpp.zip cpp -x "node_modules" -x "package-lock.json"
	rm -rf _build/cpp
	echo "Created C++ package: fellowship-cpp.zip"

javascript: _build
	cp -rf javascript _build
	cp -arf shared/. _build/javascript
	# Append node command to `todo.sh`
	# The $@ will pass through CLI args to the node executable
	echo \\nnode todo.js \"$$\@\" >> _build/javascript/todo.sh
	cd _build && zip -r --quiet fellowship-javascript.zip javascript -x "node_modules" -x "package-lock.json"
	rm -rf _build/javascript
	echo "Created JavaScript package: fellowship-javascript.zip"

ruby: _build
	cp -rf ruby _build
	cp -arf shared/. _build/ruby
	# Append ruby command to `todo.sh`
	# The $@ will pass through CLI args to the node executable
	echo \\nruby todo.rb \"$$\@\" >> _build/ruby/todo.sh
	cd _build && zip -r --quiet fellowship-ruby.zip ruby -x "node_modules" -x "package-lock.json"
	rm -rf _build/ruby
	echo "Created ruby package: fellowship-ruby.zip"

python: _build
	cp -rf python _build
	cp -arf shared/. _build/python
	# Append python command to `todo.sh`
	# The $@ will pass through CLI args to the node executable
	echo \\npython3 todo.py \"$$\@\" >> _build/python/todo.sh
	cd _build && zip -r --quiet fellowship-python.zip python -x "node_modules" -x "package-lock.json"
	rm -rf _build/python
	echo "Created python package: fellowship-python.zip"

java: _build
	cp -rf java _build
	cp -arf shared/. _build/java
	# Append C++ compiled binary to `todo.sh`
	# The $@ will pass through CLI args to the binary
	echo \\njava Todo \"$$\@\" >> _build/java/todo.sh
	cd _build && zip -r --quiet fellowship-java.zip java -x "node_modules" -x "package-lock.json"
	rm -rf _build/java
	echo "Created Java package: fellowship-java.zip"

_build:
	mkdir -p _build

clean:
	rm -rf _build
	echo "Removed previous artefacts from _build/ directory."
