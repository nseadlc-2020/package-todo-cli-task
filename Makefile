all: cpp javascript
	echo "Done."
	open _build/

cpp: _build
	cp -rf cpp _build
	cp -rf shared/ _build/cpp
	echo \\n./todo \"$$\@\" >> _build/cpp/todo.sh
	cd _build && zip -jr --quiet todo-txt-cpp.zip cpp -x "node_modules" -x "package-lock.json"
	rm -rf _build/cpp
	echo "Created C++ package: todo-txt-cpp.zip"

javascript: _build
	cp -rf javascript _build
	cp -rf shared/ _build/javascript
	echo \\nnode todo.js \"$$\@\" >> _build/javascript/todo.sh
	cd _build && zip -jr --quiet todo-txt-javascript.zip javascript -x "node_modules" -x "package-lock.json"
	rm -rf _build/javascript
	echo "Created JavaScript package: todo-txt-javascript.zip"

_build:
	mkdir -p _build

clean:
	rm -rf _build