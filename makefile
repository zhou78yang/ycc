VPATH = lexer:common:parser:compiler:vm:test
OBJS = token.o scanner.o error.o symbols.o symbol_table.o parser.o depth_vistor.o compiler_vistor.o IRGenerator.o
DPATH = /bin/ycc
CXXFLAGS = -std=c++11

ycc: main.cc $(OBJS)
	clang++ $(CXXFLAGS) -o $(DPATH) main.cc $(OBJS); rm *.o
%.o: %.cc
	clang++ $(CXXFLAGS) -c $< -o $@

.PHONY: clean, uninstall
clean:
	-rm *.o ycc
uninstall:
	-rm $(DPATH)
