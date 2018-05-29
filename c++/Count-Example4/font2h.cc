#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int main(int argc,char **argv)
{
	FILE *fin,*fout;
	if(argc!=2)
	{
		printf("Usage: %s fontfile\n",argv[0]);
		return(1);
	}
	fin=fopen(argv[1],"r");
	fseek(fin,0,SEEK_END);
	int filesize=ftell(fin),rows=filesize/256;
	fseek(fin,0,SEEK_SET);
	
	char s[200];
	strcpy(s,argv[1]);
	strcat(s,".h");
	fout=fopen(s,"w");
	
	fprintf(fout,"const char font[%d][%d]={\n",256,rows);
	int i;
	for(i=0;i<256;i++)
	{
		int j;
		fprintf(fout,"{");
		for(j=0;j<rows;j++)
		{
			fprintf(fout,"0x%x",fgetc(fin));
			if(j<rows-1) fprintf(fout,",");
		}
		fprintf(fout,"}");
		if(i<255) fprintf(fout,",\n");
	}
	fprintf(fout,"};\n");
		
	fclose(fout);
	fclose(fin);
}	
	