todo: todo.o
	java Todo

todo.o:
	javac Todo.java

test: todo install
	npm run test

clean:
	rm -f Todo.class package-lock.json
	rm -rf node_modules

install:
	npm install
