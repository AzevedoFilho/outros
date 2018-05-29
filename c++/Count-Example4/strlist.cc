
#include "strlist.h"
StringList::StringList(int asize)
{
	strlst=new char*[asize];
	if(!strlst) { printf("StringList:Not enough memory allocating string list\n"); exit(1); }
	strmax=0;
	size=asize;
}

StringList::~StringList()
{
	for(int i=0;i<strmax;i++) delete[] strlst[i];
	delete[] strlst;
}

void StringList::Add(char* s)
{
	if(strmax<size)
	{
		strlst[strmax]=new char[strlen(s)+1];
		if(!strlst[strmax]) { printf("StringList: Not enough memory for adding string\n"); exit(1); }
		strcpy(strlst[strmax],s);
		strmax++;
	} else
	{ printf("StringList: Maximum size reached\n"); exit(1); }
}

void StringList::Add(char* s,int mx)
{
	if(mx<size)
	{
		while(strmax>=mx) Delete(0);
		Add(s);
	} else
	{ printf("StringList: Maximum size reached\n"); exit(1); }
}

void StringList::Delete(int index)
{
	if(index>=0 && index<strmax)
	{
		delete[] strlst[index];
		for(int i=index;i<strmax-1;i++) strlst[i]=strlst[i+1];
		strmax--;
	}
	else { printf("StringList: Index out of range\n"); exit(1); }
}

char* StringList::Get(int index)
{
	if(index>=0 && index<strmax) return strlst[index];
	else return NULL;
}

char* StringList::Get(char* s)
{
	char *buf=new char[strlen(s)+2],*p;
	strcpy(buf,s);
	strcat(buf,"=");
	p=NULL;
	for(int i=0;i<strmax;i++)
	{
		if(!strncmp(buf,strlst[i],strlen(buf)))
		{
			p=strlst[i]+strlen(buf);
			break;
		}
	}
	delete[] buf;
	return p;
}

void StringList::Set(int index,char* s)
{
	if(index>=0 && index<strmax)
	{
		delete[] strlst[index];
		strlst[index]=new char[strlen(s)+1];
		strcpy(strlst[index],s);
	}
	else { printf("StringList: Index out of range\n"); exit(1); }
}

void StringList::Set(char* cfg,char* s)
{
	char *buf=new char[strlen(cfg)+2];
	strcpy(buf,cfg);
	strcat(buf,"=");
	for(int i=0;i<strmax;i++)
	{
		if(!strncmp(buf,strlst[i],strlen(buf)))
		{
			delete[] strlst[i];
			strlst[i]=new char[strlen(buf)+strlen(s)+1];
			strcpy(strlst[i],buf);
			strcat(strlst[i],s);
			break;
		}
	}
	delete[] buf;
}

int StringList::StrLen()
{
	int len=0;
	for(int i=0;i<strmax;i++)
	{
		if((int)strlen(strlst[i])>len) len=(int)strlen(strlst[i]);
	}
	return len;
}
