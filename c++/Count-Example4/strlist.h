
#if !defined(__STRLIST_H)
#define __STRLIST_H
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
class StringList
{
	public:
		StringList(int asize);
		~StringList();
		void Delete(int index);
		void Add(char *s);
		void Add(char *s,int mx);
		char* Get(int index);
		char* Get(char *s);
		void Set(char* cfg,char* s);
		void Set(int index,char* s);
		int Max() { return strmax; }
		int StrLen();
	private:
		char** strlst;
		int strmax,size;
};

#endif
