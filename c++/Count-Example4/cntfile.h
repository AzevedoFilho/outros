
#if !defined(__CNTFILE_H)
#define __CNTFILE_H
#include "strlist.h"
#include <time.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

class CounterFile
{
	public:
		CounterFile(char* fname);
		~CounterFile();
		void Write();
		int Error() { return error;}
		int Counter() { return counter;}
		int Counter2() { return counter2; }
		void IncCounter() { counter++; }
		void IncCounter2() { counter2++; }
		int Label() { return label; }
		StringList *config,*data;
	private:
		char* filename;
		int counter,counter2,error,label,dirty;
};

#endif
