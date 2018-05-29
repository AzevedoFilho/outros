
#if !defined(__PICTURE_H)
#define __PICTURE_H
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#define fntNORMAL 0
#define fntBOLD   1
#define fntSCRIPT 2

typedef unsigned Word;          /* At least two bytes (16 bits) */
typedef unsigned char Byte;     /* Exactly one byte (8 bits) */
typedef struct {
	Word LocalScreenWidth,
	 LocalScreenHeight;
	Byte GlobalColorTableSize : 3,
	 SortFlag             : 1,
	 ColorResolution      : 3,
	 GlobalColorTableFlag : 1;
	Byte BackgroundColorIndex;
	Byte PixelAspectRatio;
} ScreenDescriptor;

typedef struct {
	Byte Separator;
	Word LeftPosition,
	 TopPosition;
	Word Width,
	 Height;
	Byte LocalColorTableSize : 3,
	 Reserved            : 2,
	 SortFlag            : 1,
	 InterlaceFlag       : 1,
	 LocalColorTableFlag : 1;
} ImageDescriptor;

typedef struct {
	Byte Separator;
	Byte Label;
	Byte BlockSize;
	Byte Reserved    : 3,
	     Disposal    : 3,
	     UserInput   : 1,
	     Transparent : 1;
	Word DelayTime;
	Byte TransparentColor;
	Byte Terminator;
} ControlDescriptor;


class Picture
{
	public:
		Picture();
		Picture(int,int,int,int); // width, height, #colors, #bits/color component
		~Picture();
		Picture(char*);
		void PutPixel(int x,int y,int col)
			{ if(y>=0 && y<(int)leny && x>=0 && x<(int)lenx && col<NumColors) pic[y][x]=col; };
		void PrintCharUp(int,int,int,char c);  // x,y,color,char
		void PrintChar(int,int,int,char c);    // x,y,color,char
		void PrintString(int,int,int,char* s); // x,y,color,string
		void PrintStringUp(int,int,int,char* s); // x,y,color,string
		void Bar(int,int,int,int,int);         // x1,y1,x2,y2,color 
		void Line(int,int,int,int,int);        // x1,y1,x2,y2,color
		void Circle(int,int,int,int);          // x1,y1,r,color
		void FilledCircle(int,int,int,int);    // x1,y1,r,color
		int GetPixel(int x,int y)
			{ if(y>=0 && y<(int)leny && x>=0 && x<(int)lenx) return pic[y][x];
			  else return 0; };
		void SetColor(int colornum, int red, int green, int blue);
		void SetTransparent(int colornum)
			{ TransparentColor=colornum; };
		void SetFont(int);                     // fnt?????
		SaveAsGIF(FILE* f);
	private:
		unsigned char** pic;
		Word lenx,leny;
		int usefont;

		/* GIF Routines */

		int BitsPrPrimColor,    /* Bits pr primary color */
			NumColors;          /* Number of colors in color table */
		Byte *ColorTable;
		int TransparentColor;
		Word RelPixX, RelPixY;         /* Used by InputByte() -function */
		FILE* OutFile;
		Byte Buffer[256];        /* There must be one to much !!! */
		int  Index,              /* Current byte in buffer */
			BitsLeft;           /* Bits left to fill in current byte. These
					 						are right-justified */
		Byte *StrChr;
		Word *StrNxt,*StrHsh,NumStrings;

		void InitGIF(int,int);
		int AllocStrtab(void);
		void FreeStrtab(void);
		int WriteBits(int bits, int numbits);
		Word FindCharString(Word index, Byte b);
		Word AddCharString(Word index, Byte b);
		void ClearStrtab(int codesize);
		int ResetOutBitFile(void);
		int Write(void *buf, unsigned len);
		int WriteScreenDescriptor(ScreenDescriptor *sd);
		int WriteControlDescriptor(ControlDescriptor *cd);
		int WriteImageDescriptor(ImageDescriptor *id);
		int WriteWord(Word w);
		int WriteByte(Byte b);
		int BitsNeeded(Word n);
		int InputByte(void);
		int LZWCompress(int codesize);
};
#endif
