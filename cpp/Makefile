app: todo.o
	g++ todo.o -o todo.out

todo.o:
	g++ -c -std=c++11 -Wall todo.cpp -o todo.o

test: app
	npm run test

clean:
	rm -f todo.o todo.out

install:
	npm install
