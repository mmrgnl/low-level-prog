main.out: main.o k-stat-lib.a
	mingw32-gcc main.o k-stat.h k-stat-lib.a -o main.out

k-stat-lib.a: k-stat.o k-stat-test.o
	mingw32-gcc-ar -rsc k-stat-lib.a k-stat.o k-stat-test.o

main.o:
	mingw32-gcc -c main.c -o main.o

k-stat.o:
	mingw32-gcc -c k-stat.c -o k-stat.o

k-stat-test.o:
	mingw32-gcc -c k-stat-test.c -o k-stat-test.o

clean:
	-del *.o *.a
