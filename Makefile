all: a.out

a.out:
	g++ -std=c++11 -Wall todo.cpp

test: a.out
	npm run test

clean:
	rm a.out