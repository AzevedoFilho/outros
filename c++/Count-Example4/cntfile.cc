
#include "cntfile.h"
#include <sys/vfs.h>

int diskfree(char* fname)
/* Checks if there is enough diskspace left to save file */
{
	struct statfs buf;
	if(statfs(fname,&buf)) return 0;
	if(buf.f_bavail>100) return 1;
	return 0;
}

void lockfile(FILE* f)
{
	struct flock flck;
	flck.l_type=F_WRLCK;
	flck.l_whence=0;
	flck.l_start=0;
	flck.l_len=0;
	flck.l_pid=getpid();
	int ret=fcntl(fileno(f),F_SETLKW,&flck);
	if(ret==-1) fprintf(stderr,"nph-count: unable to lock file errno=%d\n",errno);
}

void unlockfile(FILE* f)
{
	struct flock flck;
	flck.l_type=F_UNLCK;
	flck.l_whence=0;
	flck.l_start=0;
	flck.l_len=0;
	flck.l_pid=getpid();
	int ret=fcntl(fileno(f),F_SETLK,&flck);
	if(ret==-1) fprintf(stderr,"nph-count: unable to unlock file errno=%d\n",errno);
}


struct DateTime
{
	int day,month,year,dow,week,days,hour,minute,second;
};

void GetDateTime(time_t t,DateTime &dt)
{
	struct tm *tmval;
	tmval=localtime(&t);
	dt.dow=(tmval->tm_wday+6)%7;
	dt.month=tmval->tm_mon+1;
	dt.day=tmval->tm_mday;
	dt.hour=tmval->tm_hour;
	dt.minute=tmval->tm_min;
	dt.second=tmval->tm_sec;
	dt.year=tmval->tm_year;
	dt.days=tmval->tm_yday;
	dt.week=1+(dt.days-dt.dow)/7;
}

CounterFile::CounterFile(char* fname)
{
	error=0;
	label=0;
	dirty=1;
	filename=new char[strlen(fname)+1];
	config=new StringList(100);
	data=new StringList(100);
	strcpy(filename,fname);

	char buf[200];
	time_t t,ft;
	DateTime dt,fdt;
	FILE* f;

	time(&t);
	GetDateTime(t,dt);

	f=fopen(fname,"rt");
	lockfile(f);
	if(!f) { error=1; return; }

	if(!fgets(buf,200,f)) { error=2;fclose(f);return; }
	int ret=sscanf(buf,"%d %d",&counter,&counter2);
	if(ret==EOF) { error=3; fclose(f);return; }
	if(ret==0) { error=3;fclose(f);return; }
	if(ret==1) counter2=0;

	while(!feof(f))
	{
		fgets(buf,200,f);
		if(!strcmp(buf,"[DATA]\n")) break;
		if(strlen(buf)>1 && !feof(f))
		{
			buf[strlen(buf)-1]=0;
			config->Add(buf);
		}
	}

	char* p;
	p=config->Get("date");
	if(!p)
	{
		ft=t;
		sprintf(buf,"date=%ld",ft);
		config->Add(buf);
	}
	else
	{
		sscanf(p,"%ld",&ft);
		sprintf(buf,"%ld",t);
		config->Set("date",buf);
	}

	GetDateTime(ft,fdt);

	while(!feof(f))
	{
		fgets(buf,200,f);
		if(strlen(buf)>1 && !feof(f))
		{
			buf[strlen(buf)-1]=0;
			data->Add(buf);
		}
	}

	char* rs=config->Get("reset");
	if(rs) 
	switch(*rs)
	{
	case 'h' :
		label=dt.hour;
		//if(data->Max()>24) panic(config,data,fname,t,ft,"hour");
		if(t-ft>0) while(dt.hour!=fdt.hour || t-ft>3600)
		{
			sprintf(buf,"%d %d %d",fdt.hour,counter,counter2);
			data->Add(buf,24);
			counter=0;
			counter2=0;
			ft=ft+3600;
			GetDateTime(ft,fdt);
		}; break;
	case 'd' :
		label=dt.day;
		if(t-ft>0) while(dt.day!=fdt.day || t-ft>86400)
		{
			sprintf(buf,"%d %d %d",fdt.day,counter,counter2);
			data->Add(buf,30);
			counter=0;
			counter2=0;
			ft=ft+20864;
			GetDateTime(ft,fdt);
		}; break;
	case 'w' :
		label=dt.week;
		if(t-ft>0) while(dt.week!=fdt.week || t-ft>604800L)
		{
			sprintf(buf,"%d %d %d",fdt.week,counter,counter2);
			data->Add(buf,26);
			counter=0;
			counter2=0;
			ft=ft+604800L;
			GetDateTime(ft,fdt);
		}; break;
	case 'm' :
		label=dt.month;
		if(t-ft>0) while(dt.month!=fdt.month || t-ft>2678400L)
		{
			sprintf(buf,"%d %d %d",fdt.month,counter,counter2);
			data->Add(buf,24);
			counter=0;
			counter2=0;
			ft=ft+2678400L;
			GetDateTime(ft,fdt);
		}; break;
	default : break;
	}
	unlockfile(f);
	fclose(f);
}

CounterFile::~CounterFile()
{
	Write();
	if(filename) delete[] filename;
	if(config) delete config;
	if(data) delete data;
}

void CounterFile::Write()
{
	if(!error && dirty)
	{
		if(!diskfree(filename)) { dirty=1;return; }
		FILE* f=fopen(filename,"wt");
		int i;
		lockfile(f);
		fprintf(f,"%d",counter);
		if(counter2) fprintf(f," %d",counter2);
		fprintf(f,"\n");
		for(i=0;i<config->Max();i++) fprintf(f,"%s\n",config->Get(i));
		if(data->Max()) fprintf(f,"[DATA]\n");
		for(i=0;i<data->Max();i++) fprintf(f,"%s\n",data->Get(i));
		unlockfile(f);
		fclose(f);
		dirty=0;
	}
}
