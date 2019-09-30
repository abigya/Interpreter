TARGET = ./scanner
OBJS = lex.yy.o #interpreter.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

lex.yy.o: lex.yy.c 

lex.yy.c: choicescript_yylexer.l
	  flex -i choicescript_yylexer.l

test: $(TARGET)
	$(TARGET) <sample/animal.txt
clean:
	rm -f $(OBJS) $(TARGET) lex.yy.c
