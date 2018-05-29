
CC=gcc -c -O2 -Wall 
LINK=gcc -lm

HEADERS=cntfile.h  picture.h  strlist.h  counter.h font.h
CCFILES=cntfile.cc picture.cc strlist.cc
OFILES=cntfile.o   picture.o  strlist.o

nph-count: $(OFILES) counter.o
	$(LINK) counter.o $(OFILES) -o nph-count

counter.o: counter.cc $(HEADERS)
	$(CC) counter.cc -o counter.o

cntfile.o: cntfile.cc cntfile.h
	$(CC) cntfile.cc -o cntfile.o

picture.o: picture.cc picture.h font.h
	$(CC) picture.cc -o picture.o

strlist.o: strlist.cc strlist.h
	$(CC) strlist.cc -o strlist.o
