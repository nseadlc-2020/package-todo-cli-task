cpp: _build
	cp -rf cpp _build
	cp -rf shared/ _build/cpp
	echo ./todo \"$$\@\" >> _build/cpp/todo.sh
	cd _build && zip -jvr todo-txt-cpp.zip cpp -x "node_modules" -x "package-lock.json"
	rm -rf _build/cpp
	open _build/

_build:
	mkdir -p _build

clean:
	rm -rf _build