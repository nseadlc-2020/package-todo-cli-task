todo: todo.o
	g++ todo.o -o todo

todo.o:
	g++ -c -std=c++11 -Wall todo.cpp -o todo.o

test: todo
	npm run test

clean:
	rm -f todo.o todo

install:
	npm install
