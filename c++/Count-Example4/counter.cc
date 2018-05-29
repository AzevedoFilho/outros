
#include "counter.h"

#include <signal.h>

int TEXT=0;

void MySignalHandler(int i)
{
	fprintf(stderr,"nph-count: died with SIGALRM #%d\n",i);
	exit(1);
}

void ShowHeader(void)
{
	if(TEXT) return;
	char *p=getenv("SERVER_PROTOCOL");
	if(!p) return;
	if(!strncmp(p,"HTTP/1.",7))
	{
		printf("HTTP/1.0 200 OK\n");
		printf("Server: %s\n",getenv("SERVER_NAME"));
		printf("MIME-version: 1.0\n");
		printf("Content-type: image/gif\n");
		printf("\n");
	}
}

void ShowCounter(FILE* f,char *s)
{
	if(TEXT) {
		fprintf(f,"%s\n",s);
		return;
	}
	ShowHeader();
	int len=strlen(s),i;
	Picture pic(11*len+3,20,13,6);
	pic.SetColor( 0, 0, 0, 0);
	pic.SetColor( 1, 4, 4, 4);
	pic.SetColor( 2, 8, 8, 8);
	pic.SetColor( 3,12,12,12);
	pic.SetColor( 4,16,16,16);
	pic.SetColor( 5,20,20,20);

	pic.SetColor( 6,23,23,23);
	pic.SetColor( 7,31,31,31);
	pic.SetColor( 8,39,39,39);
	pic.SetColor( 9,48,48,48);
	pic.SetColor(10,56,56,56);
	pic.SetColor(11,63,63,63);
	pic.SetColor(12,20,20,20);

	pic.SetFont(fntBOLD);
	for(i=0;i<len;i++)
	{
		pic.PrintChar(i*11+3,2+(s[i]+(s[i]>>3) & 1),6,s[i]); 
	}
	for(i=0;i<6;i++)
	{
		int j;
		for(j=2;j<11*len+1;j++) pic.PutPixel(j,i+4,pic.GetPixel(j,i+4)+i);
	}
	for(i=0;i<6;i++)
	{
		int j;
		for(j=2;j<11*len+1;j++) pic.PutPixel(j,i+10,pic.GetPixel(j,i+10)+5-i);
	}
	for(i=1;i<len;i++) pic.Bar(i*11+1,3,i*11+1,14,6);
	pic.Bar(0,0,11*len+2,1,12);    
	pic.Bar(0,18,11*len+1,19,12);  
	pic.Bar(0,0,1,19,12);        
	pic.Bar(11*len+1,0,11*len+2,19,12);
	pic.SaveAsGIF(f);
}

void ShowError(FILE* f,char *s)
{
	if(TEXT) {
		fprintf(f,"%s\n",s);
		return;
	}
	ShowHeader();
	int len=strlen(s);
	Picture pic(9*len+1,18,4,6);
	pic.Bar(0,0,9*len,0,1);
	pic.Bar(0,17,9*len,17,1);
	pic.Bar(0,0,0,17,1);
	pic.Bar(9*len,0,9*len,17,1);
	pic.PrintString(2,1,2,s);
	pic.SetColor(0, 0, 0, 0);
	pic.SetColor(1, 31, 31, 31);
	pic.SetColor(2, 63, 0, 0);
	pic.SetColor(3, 63, 63, 63);
	pic.SaveAsGIF(f);
}

void ShowNoPicture(FILE* f)
{
	if(TEXT) return;
	ShowHeader();
	Picture pic(1,1,1,6);
	pic.SetColor(0,31,31,31);
	pic.SaveAsGIF(f);
}

void ShowDebug(FILE* f,int argc,char** argv)
{
	ShowHeader();
	char buf[100];
	int i;
	StringList strlst(100);

	strlst.Add("Debug information");
	strlst.Add(VERSION);
	strlst.Add(COPYRIGHT);
	for(i=0;i<argc;i++)
	{
		sprintf(buf,"argv[%d]=",i);
		strcat(buf,argv[i]);
		strlst.Add(buf);
	}

	if(getenv("REFERER_URL"))
	{
		strcpy(buf,"REFERER_URL=");
		strcat(buf,getenv("REFERER_URL"));
		strlst.Add(buf);
	} else strlst.Add("REFERER_URL=<NULL>");

	strcpy(buf,"REMOTE_HOST=");
	if(getenv("REMOTE_HOST"))
		strcat(buf,getenv("REMOTE_HOST"));
	else strcat(buf,"<NULL>");
	strlst.Add(buf);

	strcpy(buf,"REMOTE_ADDR=");
	if(getenv("REMOTE_ADDR"))
		strcat(buf,getenv("REMOTE_ADDR"));
	else strcat(buf,"<NULL>");
	strlst.Add(buf);

	if(TEXT) {
		for(i=0;i<strlst.Max();i++) fprintf(f,"%s\n",strlst.Get(i));
		return;
	}

	Picture pic(9+strlst.StrLen()*9,16*(strlst.Max()),2,6);
	pic.SetFont(fntNORMAL);
	pic.SetColor(0,0,0,0);
	pic.SetColor(1,63,63,63);
	pic.SetFont(fntBOLD);
	pic.PrintString(0,0,1,strlst.Get(0));
	pic.SetFont(fntNORMAL);
	for(i=1;i<strlst.Max();i++) pic.PrintString(0,i*16,1,strlst.Get(i));
	pic.SaveAsGIF(f);
}

int wildcmp(char* s,char* w)
{
	if(!s || !w) return 0;
	while(*w && *s)
	{
		if(*w=='*') { w++;while(*s && *s!='.') s++; if(!*w && !*s) break;}
		if(*w!='?' && (*w & 223)!=(*s & 223)) { return 0; }
		w++;
		s++;
	}
	if(*w==0 && *s==0) return 1; else return 0;
}


void ShowStats(FILE* f,CounterFile& cnt)
{
	ShowHeader();
	int max=0,i,data[31][3],md=cnt.data->Max();
	char s[10];
	for(i=0;i<md;i++)
	{
		for(int j=0;j<3;j++) data[i][j]=0;
		sscanf(cnt.data->Get(i),"%d %d %d",&data[i][0],&data[i][1],&data[i][2]);
		if(data[i][1]>max) max=data[i][1];
		if(data[i][2]>max) max=data[i][2];
	}
	data[md][0]=cnt.Label();
	data[md][1]=cnt.Counter();
	data[md][2]=cnt.Counter2();
	if(data[md][1]>max) max=data[md][1];
	if(data[md][2]>max) max=data[md][2];
	md++;
	int m=1;
	float max3=max;
	while(max3>10) { max3=max3/10.0;m=m*10; }
	int max2=m;
	if(max3>1) max2=2*m;
	if(max3>2) max2=5*m;
	if(max3>5) max2=10*m;
	if(max<10) max2=10;
	float vm=200.0/max2;

	max=208;
	if(TEXT) {
		for(i=0;i<md;i++) printf("%d %d %d\n",data[i][0],data[i][1],data[i][2]);
		return;
	}

	Picture Pic(47+md*24,49+max,4,6);
	Pic.SetFont(fntSCRIPT);
	Pic.SetColor(0,0,0,0);
	Pic.SetColor(1,63,0,0);
	Pic.SetColor(2,0,63,0);
	Pic.SetColor(3,0,0,0);
	Pic.SetTransparent(0);
	Pic.Bar(46,0,46,max,3);
	Pic.Bar(46,max,47+md*24,max,3);
	for(i=0;i<11;i++)
	{
		if(i*max2/10<1000) sprintf(s,"%3d",i*max2/10);
		else sprintf(s,"%1dK%1d",i*max2/10000,(i*max2%10000)/1000);
		Pic.PrintString(16,max-20*i-8,3,s);
		Pic.Bar(44,max-20*i,46+md*24,max-20*i,3);
	}
	for(i=0;i<md;i++)
	{
		Pic.Bar(i*24+47,max-1,i*24+54,max-int(vm*data[i][1])-1,1);
		Pic.Bar(i*24+56,max-1,i*24+62,max-int(vm*data[i][2])-1,2);
		sprintf(s,"%d",data[i][0]);
		Pic.PrintString(i*24+47,max,3,s);
	}
	Pic.Bar(47,max+37,53,max+43,1);Pic.PrintString(55,max+32,3,"non-local");
	Pic.Bar(146,max+37,152,max+43,2);Pic.PrintString(154,max+32,3,"local");
	char* rs=cnt.config->Get("reset");
	switch(*rs)
	{
		case 'h' : Pic.PrintString(20+md*12,max+16,3,"Hour->");break;
		case 'd' : Pic.PrintString(24+md*12,max+16,3,"Day->");break;
		case 'w' : Pic.PrintString(20+md*12,max+16,3,"Week->");break;
		case 'm' : Pic.PrintString(16+md*12,max+16,3,"Month->");break;
		default: break;
	}
	Pic.PrintStringUp(0,max/2+27,3,"Hits->");
	Pic.SaveAsGIF(f);
}

int main(int argc, char **argv)
{
	char *query, *p;
	char fname[200]=WWW;
	char home[20]=HOME;
	int qi=0,fi=0,i;
	query=new char[200];

	int HIDE=0,STATS=0,DEBUG=0,NOCOUNT=0,argu=1,MASKED=0;
	signal(SIGALRM,MySignalHandler);
	alarm(30);
	for(i=1;i<argc;i++)
	{
		if(!strcmp(argv[i],"HIDE"))    { argu++;HIDE=1; }
		if(!strcmp(argv[i],"STATS"))   { argu++;STATS=1; }
		if(!strcmp(argv[i],"DEBUG"))   { argu++;DEBUG=1; }
		if(!strcmp(argv[i],"NOCOUNT")) { argu++;NOCOUNT=1; }
		if(!strcmp(argv[i],"MASKED"))  { argu++;MASKED=1; }
		if(!strcmp(argv[i],"TEXT"))  { argu++;TEXT=1; }
	}

	if(DEBUG) { ShowDebug(stdout,argc,argv); return 0; }

	if(argc==argu)
	{
		if(getenv("REFERER_URL"))
			strcpy(query,getenv("REFERER_URL"));
		else { ShowError(stdout,"No REFERER_URL: check your browser!"); return 1; }

		p=strrchr(query,'/');
		if(!p) { *query=0; strcat(query,"counter"); }
		else
		{
			*p=0;
			p=strrchr(query,'.');
			if(!p) { p=query; if(*p=='/') p++; }
			else
			{
				p=strchr(p,'/');
				if(p) p++;
			}
			query=p;
			strcat(query,"/counter");
		}
	} else strcpy(query,argv[1]);
	if(!strncmp(query,"%7E",3))
	{
		i=1;
		query[0]='~';
		while(query[i+2]) { query[i]=query[i+2];i++; }
		query[i]=0;
	}

	fi=strlen(fname);
	while(query[qi])
	{
		char c=query[qi++];
		if(c=='~')
		{
			int hi=0;
			while(home[hi]) fname[fi++]=home[hi++];
		}
		if(c>='0' && c<='9' || c=='/' || c=='\\' || c>='A' && c<='Z' ||
		   c>='a' && c<='z' || c=='_' ) fname[fi++]=c;
	}
	fname[fi]=0;
	strcat(fname,".cnt");

	CounterFile cnt(fname);
	if(cnt.Error())
	{
		char s[200];
		sprintf(s,"Counter: error %d, %s does not exist or cannot be opened!",cnt.Error(),fname);
		ShowError(stdout,s);
		return 1;
	}

	if(!NOCOUNT)
	{
		if(!wildcmp(getenv("REMOTE_ADDR"),cnt.config->Get("netmask")))
			cnt.IncCounter();
		else cnt.IncCounter2();
	}
	cnt.Write();

	if(HIDE) { ShowNoPicture(stdout);return 0; }

	if(STATS) { ShowStats(stdout,cnt); return 0; }

	char digs[7];
	if(MASKED) sprintf(digs,"%6d",cnt.Counter2());
	else sprintf(digs,"%6d",cnt.Counter());
	for(i=0;i<6;i++) if(digs[i]==32) digs[i]=48;
	ShowCounter(stdout,digs);
	delete[] query;

	return 0;
}
