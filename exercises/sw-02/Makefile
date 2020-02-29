all: grandmother.png offspring.png

grandmother.png:  grandmother.gv
	dot -Tpng grandmother.gv  -o grandmother.png

offspring.png: offspring.gv
	dot -Tpng offspring.gv -o offspring.png

clean:
	rm -f grandmother.png offspring.png