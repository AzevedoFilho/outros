
#include "picture.h"
#include "font.h"
#define RES_CODES 2
#define HASH_FREE 0xFFFF
#define NEXT_FIRST 0xFFFF

#define MAXBITS 12
#define MAXSTR (1 << MAXBITS)

#define HASHSIZE 9973
#define HASHSTEP 2039

#define HASH(index, lastbyte) (((lastbyte << 8) ^ index) % HASHSIZE)

enum GIF_Code {
	GIF_OK,
	GIF_ERRCREATE,
	GIF_ERRWRITE,
	GIF_OUTMEM
};

void Picture::InitGIF(int numcolors,int colorres)
{
	int q, tabsize;
	Byte *bp;

	NumColors = numcolors ? (1 << BitsNeeded(numcolors)) : 0;
	BitsPrPrimColor = colorres;

	ColorTable = NULL;
	if (NumColors)
	{
		tabsize = NumColors * 3;
		if ((ColorTable = (Byte *) malloc(tabsize * sizeof(Byte))) == NULL)
			return;
		else
		{
			bp = ColorTable;
			for (q = 0; q < tabsize; q++)
			*bp++ = 0;
		}
	}
}

Picture::Picture()
{
	TransparentColor=-1;
	lenx=0;
	leny=0;
	usefont=fntNORMAL;
	int numcolors=0,colorres=0;
	InitGIF(numcolors,colorres);
}

Picture::Picture(int x,int y,int numcolors,int colorres)
{
	int i;
	TransparentColor=-1;
	pic=new unsigned char*[y];
	for(i=0;i<y;i++)
	{
		pic[i]=new unsigned char[x];
		if(!pic[i]) { printf("Error allocating picture\n"); exit(1);}
	}
	for(i=0;i<y;i++)
		for(int j=0;j<x;j++) pic[i][j]=0;
	usefont=fntNORMAL;
	lenx=x;
	leny=y;
	InitGIF(numcolors,colorres);
}

Picture::Picture(char* s)
{
	TransparentColor=-1;
	FILE* f=fopen(s,"rb");
	int sx,sy,sp,i;
	char buf[32];
	fread(&buf,32,1,f);
	if(!strncmp(buf,"mhwanh",6))
	{
		if(buf[6]*256+buf[7]==4)
		{
			sx=buf[8]*256+buf[9];
			sy=buf[10]*256+buf[11];
			sp=buf[12]*256+buf[13];
			pic=new unsigned char*[sy];
			for(i=0;i<sy;i++)
			{
				pic[i]=new unsigned char[sx];
				if(!pic[i]) { printf("Error allocating picture\n"); exit(1);}
			}
			usefont=fntNORMAL;
			lenx=sx;
			leny=sy;
			InitGIF(sp,8);
			fread(ColorTable,sp*3,1,f);
			for(i=0;i<sy;i++) fread(pic[i],sx,1,f);
		}
	}
	fclose(f);
}



Picture::~Picture(void)
{
	for(int i=0;i<(int)leny;i++) delete[] pic[i];
	delete[] pic;
	fclose(OutFile);
	/*
	 *  Release color table
	 */
	if (ColorTable) {
		free(ColorTable);
		ColorTable = NULL;
	}
}

void Picture::SetFont(int fnt)
{
	usefont=fnt;
}

void Picture::PrintChar(int x,int y,int col,char c)
{
	//int k;
	//if((c>31) && ((unsigned char)c<128)) k=c-32;
	//else k=32;
	for(int j=0;j<16;j++)
		for(int i=0;i<8;i++)
			if((font[usefont][c][j]>>7-(i & 7)) & 1) PutPixel(x+i,y+j,col);
}

void Picture::PrintCharUp(int x,int y,int col,char c)
{
	//int k;
	//if((c>31) && ((unsigned char)c<128)) k=c-32;
	//else k=32;
	for(int j=0;j<16;j++)
		for(int i=0;i<8;i++)
			if((font[usefont][c][j]>>7-(i & 7)) & 1) PutPixel(x+j,y+9-i,col);
}

void Picture::PrintString(int x,int y,int col,char* s)
{
	int i=0;
	if(!s) return;
	while(s[i])
	{
		PrintChar(x+i*9,y,col,s[i]);
		i++;
	}
}

void Picture::PrintStringUp(int x,int y,int col,char* s)
{
	int i=0;
	if(!s) return;
	while(s[i])
	{
		PrintCharUp(x,y-9-i*9,col,s[i]);
		i++;
	}
}

void Picture::Bar(int x0,int y0,int x1,int y1,int col)
{
	int z;
	if(x0>x1) { z=x0;x0=x1;x1=z; }
	if(y0>y1) { z=y0;y0=y1;y1=z; }
	for(int j=y0;j<=y1;j++)
		for(int i=x0;i<=x1;i++)
			PutPixel(i,j,col);
}

int Round(float x)
{
	float z=floor(x);
	if(x-z>=0.5) return (int)z+1;
	else return (int)z;
}

void Picture::Line(int x0,int y0,int x1,int y1,int col)
{
	int z;
	if(x0>x1) { z=x0;x0=x1;x1=z; }
	if(y0>y1) { z=y0;y0=y1;y1=z; }
	if((x1-x0)>(y1-y0))
		{
			float rc=y1-y0;
			rc=rc/(x1-x0);
			for(int j=x0;j<=x1;j++) PutPixel(j,Round(rc*j),col);
		}
	else
		{
			float rc=x1-x0;
			rc=rc/(y1-y0);
			for(int j=x0;j<=x1;j++) PutPixel(Round(rc*j),j,col);
		}
}

void Picture::Circle(int x0,int y0,int r,int col)
{
	int m=(int)ceil(0.707106*r);
	for(int i=0;i<=m;i++)
	{
		int x=i, y=Round(r*sin(acos(((float)i)/r)));
		PutPixel(x0+x,y0+y,col);
		PutPixel(x0+x,y0-y,col);
		PutPixel(x0-x,y0+y,col);
		PutPixel(x0-x,y0-y,col);
		PutPixel(x0+y,y0+x,col);
		PutPixel(x0+y,y0-x,col);
		PutPixel(x0-y,y0+x,col);
		PutPixel(x0-y,y0-x,col);
	}
}

void Picture::FilledCircle(int x0,int y0,int r,int col)
{
	int m=(int)ceil(0.707106*r);
	for(int i=0;i<=m;i++)
	{
		int x=i, y=Round(r*sin(acos(((float)i)/r)));
		Bar(x0+x,y0+x,x0+x,y0+y,col);
		Bar(x0+x,y0+x,x0+y,y0+x,col);
		Bar(x0-x,y0+x,x0-x,y0+y,col);
		Bar(x0-x,y0+x,x0-y,y0+x,col);
		Bar(x0+x,y0-x,x0+x,y0-y,col);
		Bar(x0+x,y0-x,x0+y,y0-x,col);
		Bar(x0-x,y0-x,x0-x,y0-y,col);
		Bar(x0-x,y0-x,x0-y,y0-x,col);
	}
}




/*-------------------------------------------------------------------------
 *
 *  NAME:           GIF_SetColor()
 *
 *  DESCRIPTION:    Set red, green and blue components of one of the
 *                  colors. The color components are all in the range
 *                  [0, (1 << BitsPrPrimColor) - 1]
 *
 *  PARAMETERS:     colornum - Color number to set. [0, NumColors - 1]
 *                  red      - Red component of color
 *                  green    - Green component of color
 *                  blue     - Blue component of color
 *
 *  RETURNS:        Nothing
 *
 */

void Picture::SetColor(int colornum, int red, int green, int blue)
{
	long maxcolor;
	Byte *p;

	if(colornum<NumColors)
	{
		maxcolor = (1L << BitsPrPrimColor) - 1L;
		p = ColorTable + colornum * 3;
		*p++ = (Byte) ((red * 255L) / maxcolor);
		*p++ = (Byte) ((green * 255L) / maxcolor);
		*p++ = (Byte) ((blue * 255L) / maxcolor);
	}
}


/*-------------------------------------------------------------------------
 *
 *  NAME:           GIF_CompressImage()
 *
 *  DESCRIPTION:    Compress an image into the GIF-file previousely
 *                  created using GIF_Create(). All color values should
 *                  have been specified before this function is called.
 *
 *                  The pixels are retrieved using a user defined callback
 *                  function. This function should accept two parameters,
 *                  x and y, specifying which pixel to retrieve. The pixel
 *                  values sent to this function are as follows:
 *
 *                    x : [ImageLeft, ImageLeft + lenx - 1]
 *                    y : [ImageTop, ImageTop + leny - 1]
 *
 *                  The function should return the pixel value for the
 *                  point given, in the interval [0, NumColors - 1]
 *
 *  PARAMETERS:     left     - Screen-relative leftmost pixel x-coordinate
 *                             of the image
 *                  top      - Screen-relative uppermost pixel y-coordinate
 *                             of the image
 *                  width    - Width of the image, or -1 if as wide as
 *                             the screen
 *                  height   - Height of the image, or -1 if as high as
 *                             the screen
 *                  getpixel - Address of user defined callback function.
 *                             (See above)
 *
 *  RETURNS:        GIF_OK       - OK
 *                  GIF_OUTMEM   - Out of memory
 *                  GIF_ERRWRITE - Error writing to the file
 *
 */

int Picture::SaveAsGIF(FILE* f)
{
	int left=0,top=0,width=lenx,height=leny;
	int codesize, errcode;
	ScreenDescriptor SD;
	ImageDescriptor ID;
	ControlDescriptor CD;

	OutFile=f;

	/*
	 *  Create file specified
	 */
	/*
	 *  Write GIF signature
	 */
	if ((Write("GIF89a", 6)) != GIF_OK)
	return GIF_ERRWRITE;

	/*
	 *  Initiate and write screen descriptor
	 */
	SD.LocalScreenWidth = width;
	SD.LocalScreenHeight = height;
	if (NumColors) {
	SD.GlobalColorTableSize = BitsNeeded(NumColors) - 1;
	SD.GlobalColorTableFlag = 1;
	} else {
	SD.GlobalColorTableSize = 0;
	SD.GlobalColorTableFlag = 0;
	}
	SD.SortFlag = 0;
	SD.ColorResolution = BitsPrPrimColor - 1;
	SD.BackgroundColorIndex = 0;
	SD.PixelAspectRatio = 0;
	if (WriteScreenDescriptor(&SD) != GIF_OK)
		return GIF_ERRWRITE;



	/*
	 *  Write global colortable if any
	 */
	if (NumColors)
	if ((Write(ColorTable, NumColors * 3)) != GIF_OK)
		return GIF_ERRWRITE;

	/* 
	 * Write Control discriptor
	*/
	if(TransparentColor>=0)
	{	 
		CD.Separator=0x21;
		CD.Label=0xF9;
		CD.BlockSize=4;
		CD.Reserved=0;
		CD.Disposal=0;
		CD.UserInput=0;
		CD.Transparent=1;
 		CD.DelayTime=0;
 		CD.TransparentColor=TransparentColor;
 		CD.Terminator=0;
		if (WriteControlDescriptor(&CD) != GIF_OK)
		return GIF_ERRWRITE;
	}
     
   
	/*
	 *  Initiate and write image descriptor
    */
	ID.Separator = ',';
	ID.LeftPosition = left;
	ID.TopPosition = top;
	ID.Width = lenx = width;
	ID.Height = leny = height;
	ID.LocalColorTableSize = 0;
	ID.Reserved = 0;
	ID.SortFlag = 0;
	ID.InterlaceFlag = 0;
	ID.LocalColorTableFlag = 0;

	if (WriteImageDescriptor(&ID) != GIF_OK)
	return GIF_ERRWRITE;

	/*
	 *  Write code size
	 */
	codesize = BitsNeeded(NumColors);
	if (codesize == 1) ++codesize;
	if (WriteByte(codesize) != GIF_OK) return GIF_ERRWRITE;
	/*
	 *  Perform compression
	 */
	RelPixX = RelPixY = 0;
	if ((errcode = LZWCompress(codesize)) != GIF_OK) return errcode;

	/*
	 *  Write terminating 0-byte
	 */
	if (WriteByte(0) != GIF_OK) return GIF_ERRWRITE;

	/*
	 *  Initiate and write ending image descriptor
	 */
	ID.Separator = ';';
	if (WriteImageDescriptor(&ID) != GIF_OK) return GIF_ERRWRITE;
	return GIF_OK;
}


/*-------------------------------------------------------------------------
 *
 *  NAME:           Write()
 *
 *  DESCRIPTION:    Output bytes to the current OutFile.
 *
 *  PARAMETERS:     buf - Pointer to buffer to write
 *                  len - Number of bytes to write
 *
 *  RETURNS:        GIF_OK       - OK
 *                  GIF_ERRWRITE - Error writing to the file
 *
 */
int Picture::Write(void *buf, unsigned len)
{
	if (fwrite(buf, sizeof(Byte), len, OutFile) < len)
	return GIF_ERRWRITE;

	return GIF_OK;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           WriteScreenDescriptor()
 *
 *  DESCRIPTION:    Output a screen descriptor to the current GIF-file
 *
 *  PARAMETERS:     sd - Pointer to screen descriptor to output
 *
 *  RETURNS:        GIF_OK       - OK
 *                  GIF_ERRWRITE - Error writing to the file
 *
 */
int Picture::WriteScreenDescriptor(ScreenDescriptor *sd)
{
	Byte tmp;


	if (WriteWord(sd->LocalScreenWidth) != GIF_OK)
	return GIF_ERRWRITE;
	if (WriteWord(sd->LocalScreenHeight) != GIF_OK)
	return GIF_ERRWRITE;
	tmp = (sd->GlobalColorTableFlag << 7)
	  | (sd->ColorResolution << 4)
	  | (sd->SortFlag << 3)
	  | sd->GlobalColorTableSize;
	if (WriteByte(tmp) != GIF_OK)
	return GIF_ERRWRITE;
	if (WriteByte(sd->BackgroundColorIndex) != GIF_OK)
	return GIF_ERRWRITE;
	if (WriteByte(sd->PixelAspectRatio) != GIF_OK)
	return GIF_ERRWRITE;

	return GIF_OK;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           WriteImageDescriptor()
 *
 *  DESCRIPTION:    Output an image descriptor to the current GIF-file
 *
 *  PARAMETERS:     id - Pointer to image descriptor to output
 *
 *  RETURNS:        GIF_OK       - OK
 *                  GIF_ERRWRITE - Error writing to the file
 *
 */
int Picture::WriteImageDescriptor(ImageDescriptor *id)
{
	Byte tmp;

	if (WriteByte(id->Separator) != GIF_OK)
		return GIF_ERRWRITE;
	if (WriteWord(id->LeftPosition) != GIF_OK)
		return GIF_ERRWRITE;
	if (WriteWord(id->TopPosition) != GIF_OK)
		return GIF_ERRWRITE;
	if (WriteWord(id->Width) != GIF_OK)
		return GIF_ERRWRITE;
	if (WriteWord(id->Height) != GIF_OK)
		return GIF_ERRWRITE;
	tmp = (id->LocalColorTableFlag << 7)
			| (id->InterlaceFlag << 6)
			| (id->SortFlag << 5)
			| (id->Reserved << 3)
			| id->LocalColorTableSize;
	if (WriteByte(tmp) != GIF_OK)
		return GIF_ERRWRITE;
	return GIF_OK;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           WriteControlDescriptor()
 *
 *  DESCRIPTION:    Output a control descriptor to the current GIF-file
 *
 *  PARAMETERS:     cd - Pointer to image descriptor to output
 *
 *  RETURNS:        GIF_OK       - OK
 *                  GIF_ERRWRITE - Error writing to the file
 *
 */
int Picture::WriteControlDescriptor(ControlDescriptor *cd)
{
	Byte tmp;

	if (WriteByte(cd->Separator) != GIF_OK)
		return GIF_ERRWRITE;
	if (WriteByte(cd->Label) != GIF_OK)
		return GIF_ERRWRITE;
	if (WriteByte(cd->BlockSize) != GIF_OK)
		return GIF_ERRWRITE;
	tmp = (cd->Reserved << 5)
			| (cd->Disposal << 2)
			| (cd->UserInput << 1)
			| (cd->Transparent);
	if (WriteByte(tmp) != GIF_OK)
		return GIF_ERRWRITE;
	if (WriteWord(cd->DelayTime) != GIF_OK)
		return GIF_ERRWRITE;
	if (WriteByte(cd->TransparentColor) != GIF_OK)
		return GIF_ERRWRITE;
	if (WriteByte(cd->Terminator) != GIF_OK)
		return GIF_ERRWRITE;		
	return GIF_OK;
}


/*-------------------------------------------------------------------------
 *
 *  NAME:           WriteWord()
 *
 *  DESCRIPTION:    Output one word (2 bytes with byte-swapping, like on
 *                  the IBM PC) to the current OutFile
 *
 *  PARAMETERS:     w - Word to write
 *
 *  RETURNS:        GIF_OK       - OK
 *                  GIF_ERRWRITE - Error writing to the file
 *
 */
int Picture::WriteWord(Word w)
{
	if (putc(w & 0xFF, OutFile) == EOF)
	return GIF_ERRWRITE;

	if (putc((w >> 8), OutFile) == EOF)
	return GIF_ERRWRITE;

	return GIF_OK;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           WriteByte()
 *
 *  DESCRIPTION:    Output one byte to the current OutFile.
 *
 *  PARAMETERS:     b - Byte to write
 *
 *  RETURNS:        GIF_OK       - OK
 *                  GIF_ERRWRITE - Error writing to the file
 *
 */
int Picture::WriteByte(Byte b)
{
	if (putc(b, OutFile) == EOF)
		return GIF_ERRWRITE;
	return GIF_OK;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           BitsNeeded()
 *
 *  DESCRIPTION:    Calculates number of bits needed to store numbers
 *                  between 0 and n - 1
 *
 *  PARAMETERS:     n - Number of numbers to store (0 to n - 1)
 *
 *  RETURNS:        Number of bits needed
 *
 */
int Picture::BitsNeeded(Word n)
{	
	int ret = 1;
	if (!n--) return 0;
	while (n >>= 1) ++ret;
	return ret;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           InputByte()
 *
 *  DESCRIPTION:    Get next pixel from image. Called by the
 *                  LZW_Compress()-function
 *
 *  PARAMETERS:     None
 *
 *  RETURNS:        Next pixelvalue, or -1 if no more pixels
 *
 */
int Picture::InputByte(void)
{
	int ret;


	if (RelPixY >= leny)
	return -1;

	ret = pic[RelPixY][RelPixX];

	if (++RelPixX >= lenx)
	{
		RelPixX = 0;
		++RelPixY;
	}

	return ret;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           GIF_Compress()
 *
 *  DESCRIPTION:    Perform LZW compression as specified in the
 *                  GIF-standard.
 *
 *  PARAMETERS:     codesize  - Number of bits needed to represent
 *                              one pixelvalue.
 *                  inputbyte - Function that fetches each byte to compress.
 *                              Must return -1 when no more bytes.
 *
 *  RETURNS:        GIF_OK     - OK
 *                  GIF_OUTMEM - Out of memory
 *
 */
int Picture::LZWCompress(int codesize)
{
	Buffer[Index = 0] = 0;
	BitsLeft = 8;
	StrChr = NULL;
	StrNxt = NULL;
	StrHsh = NULL;
	register int c;
	register Word index;
	int  clearcode, endofinfo, numbits, limit, errcode;
	Word prefix = 0xFFFF;

	/*
 	 *  Set up variables and tables
 	*/
	clearcode = 1 << codesize;
	endofinfo = clearcode + 1;

	numbits = codesize + 1;
	limit = (1 << numbits) - 1;

	if ((errcode = AllocStrtab()) != GIF_OK)
		return errcode;
	ClearStrtab(codesize);

	/*
	 *First send a code telling the unpacker to clear the stringtable.
	*/
	WriteBits(clearcode, numbits);

	/*
	 *  Pack image
	 */
	//while ((c = InputByte()) != -1) {
	for(int y=0;y<(int)leny;y++) for(int x=0;x<(int)lenx;x++)
	{
		c=pic[y][x];
	/*
	 *  Now perform the packing.
	 *  Check if the prefix + the new character is a string that
	 *  exists in the table
	*/
	if ((index = FindCharString(prefix, c)) != 0xFFFF) {
		/*
		 *  The string exists in the table.
		 *  Make this string the new prefix.
		 */
		prefix = index;

	} else {
	    /*
	     *  The string does not exist in the table.
	     *  First write code of the old prefix to the file.
	     */
	    WriteBits(prefix, numbits);

		/*
		 *  Add the new string (the prefix + the new character)
		 *  to the stringtable.
		 */
		if ((int)AddCharString(prefix, c) > limit) {
		if (++numbits > 12) {
		    WriteBits(clearcode, numbits - 1);
		    ClearStrtab(codesize);
		    numbits = codesize + 1;
		}
		limit = (1 << numbits) - 1;
	    }

	    /*
	     *  Set prefix to a string containing only the character
	     *  read. Since all possible one-character strings exists
	     *  int the table, there's no need to check if it is found.
	     */
	    prefix = c;
		}
	}

	/*
	 *  End of info is reached. Write last prefix.
     */
	if (prefix != 0xFFFF)
	WriteBits(prefix, numbits);

	/*
	 *  Write end of info -mark.
	*/
	WriteBits(endofinfo, numbits);

	/*
	 *  Flush the buffer
	*/
	ResetOutBitFile();

	/*
	 *  Tidy up
	*/
	FreeStrtab();
	return GIF_OK;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           AllocStrtab()
 *
 *  DESCRIPTION:    Allocate arrays used in string table routines
 *
 *  PARAMETERS:     None
 *
 *  RETURNS:        GIF_OK     - OK
 *                  GIF_OUTMEM - Out of memory
 *
 */
int Picture::AllocStrtab(void)
{
	/*
	*  Just in case . . .
	*/
	FreeStrtab();

	if ((StrChr = (Byte *) malloc(MAXSTR * sizeof(Byte))) == 0) {
		FreeStrtab();
		return GIF_OUTMEM;
	}

	if ((StrNxt = (Word *) malloc(MAXSTR * sizeof(Word))) == 0) {
	FreeStrtab();
	return GIF_OUTMEM;
	}

	if ((StrHsh = (Word *) malloc(HASHSIZE * sizeof(Word))) == 0) {
	FreeStrtab();
	return GIF_OUTMEM;
	}

	return GIF_OK;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           FreeStrtab()
 *
 *  DESCRIPTION:    Free arrays used in string table routines
 *
 *  PARAMETERS:     None
 *
 *  RETURNS:        Nothing
 *
 */
void Picture::FreeStrtab(void)
{
	if (StrHsh) {
	free(StrHsh);
	StrHsh = NULL;
	}

	if (StrNxt) {
	free(StrNxt);
	StrNxt = NULL;
	}
	
	if (StrChr) {
	free(StrChr);
	StrChr = NULL;
	}
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           WriteBits()
 *
 *  DESCRIPTION:    Put the given number of bits to the OutFile.
 *
 *  PARAMETERS:     bits    - bits to write from (right justified)
 *                  numbits - number of bits to write
 *
 *  RETURNS:        bits written, or -1 on error.
 *
 */
int Picture::WriteBits(int bits, int numbits)
{
	int  bitswritten = 0;
	Byte numbytes = 255;

	do {
		/*
		 *  If the buffer is full, write it.
		 */
		if ((Index == 254 && !BitsLeft) || Index > 254) {
			if (WriteByte(numbytes) != GIF_OK)
					return -1;
			if (Write(Buffer, numbytes) != GIF_OK)
				return -1;
			Buffer[Index = 0] = 0;
			BitsLeft = 8;
		}	
		
		/*
		 *  Now take care of the two specialcases
		 */
		if (numbits <= BitsLeft) {
			Buffer[Index] |= (bits & ((1 << numbits) - 1)) << (8 - BitsLeft);
			bitswritten += numbits;
			BitsLeft -= numbits;
			numbits = 0;
		} else {
			Buffer[Index] |= (bits & ((1 << BitsLeft) - 1)) << (8 - BitsLeft);
			bitswritten += BitsLeft;
			bits >>= BitsLeft;
			numbits -= BitsLeft;
			Buffer[++Index] = 0;
			BitsLeft = 8;
		}
	} while (numbits);
	return bitswritten;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           FindCharString()
 *
 *  DESCRIPTION:    Find index of string consisting of the string of index
 *                  plus the byte b.
 *
 *                  If a string of length 1 is wanted, the index should
 *                  be 0xFFFF.
 *
 *  PARAMETERS:     index - Index to first part of string, or 0xFFFF is
 *                          only 1 byte is wanted
 *                  b     - Last byte in string
 *
 *  RETURNS:        Index to string, or 0xFFFF if not found
 *
 */
Word Picture::FindCharString(Word index, Byte b)
{
	Word hshidx, nxtidx;


	/*
	 *  Check if index is 0xFFFF. In that case we need only
	 *  return b, since all one-character strings has their
	 *  bytevalue as their index
	 */
	if (index == 0xFFFF)
	return b;

	/*
	 *  Search the string table until the string is found, or
	 *  we find HASH_FREE. In that case the string does not
	 *  exist.
	 */
	hshidx = HASH(index, b);
	while ((nxtidx = StrHsh[hshidx]) != 0xFFFF) {
	if (StrNxt[nxtidx] == index && StrChr[nxtidx] == b)
		return nxtidx;
	hshidx = (hshidx + HASHSTEP) % HASHSIZE;
	}

	/*
	 *  No match is found
	 */
	return 0xFFFF;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           AddCharString()
 *
 *  DESCRIPTION:    Add a string consisting of the string of index plus
 *                  the byte b.
 *
 *                  If a string of length 1 is wanted, the index should
 *                  be 0xFFFF.
 *
 *  PARAMETERS:     index - Index to first part of string, or 0xFFFF is
 *                          only 1 byte is wanted
 *                  b     - Last byte in new string
 *
 *  RETURNS:        Index to new string, or 0xFFFF if no more room
 *
 */
Word Picture::AddCharString(Word index, Byte b)
{
	Word hshidx;

	/*
	*  Check if there is more room
	*/
	if (NumStrings >= MAXSTR)
		return 0xFFFF;

	/*
	*  Search the string table until a free position is found
	*/
	hshidx = HASH(index, b);
	while (StrHsh[hshidx] != 0xFFFF)
	hshidx = (hshidx + HASHSTEP) % HASHSIZE;

	/*
	*  Insert new string
	*/
	StrHsh[hshidx] = NumStrings;
	StrChr[NumStrings] = b;
	StrNxt[NumStrings] = (index != 0xFFFF) ? index : NEXT_FIRST;

	return NumStrings++;
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           ClearStrtab()
 *
 *  DESCRIPTION:    Mark the entire table as free, enter the 2**codesize
 *                  one-byte strings, and reserve the RES_CODES reserved
 *                  codes.
 *
 *  PARAMETERS:     codesize - Number of bits to encode one pixel
 *
 *  RETURNS:        Nothing
 *
 */
void Picture::ClearStrtab(int codesize)
{
	int q, w;
	Word *wp;


	/*
	*  No strings currently in the table
	*/
	NumStrings = 0;

	/*
	*  Mark entire hashtable as free
	*/
	wp = StrHsh;
	for (q = 0; q < HASHSIZE; q++)
		*wp++ = HASH_FREE;

	/*
	*  Insert 2**codesize one-character strings, and reserved codes
	*/
	w = (1 << codesize) + RES_CODES;
	for (q = 0; q < w; q++)
		AddCharString(0xFFFF, q);
}

/*-------------------------------------------------------------------------
 *
 *  NAME:           ResetOutBitFile()
 *
 *  DESCRIPTION:    Tidy up after using a bitfile
 *
 *  PARAMETERS:     None
 *
 *  RETURNS:        0 - OK, -1 - error
 *
 */
int Picture::ResetOutBitFile(void)
{
	Byte numbytes;

	/*
	*  Find out how much is in the buffer
	*/
	numbytes = Index + (BitsLeft == 8 ? 0 : 1);

	/*
	*  Write whatever is in the buffer to the file
	*/
	if (numbytes) {
		if (WriteByte(numbytes) != GIF_OK)
			return -1;

		if (Write(Buffer, numbytes) != GIF_OK)
			return -1;

		Buffer[Index = 0] = 0;
		BitsLeft = 8;
	}

	return 0;
}
