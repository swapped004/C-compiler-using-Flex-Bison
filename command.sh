yaccFile=parser.y
lexFile=offline.l
inputFile=input.txt
####################################################################
#Created by Mir Mahathir Mohammad 1605011
####################################################################
DIR="$(cd "$(dirname "$0")" && pwd)"
cd $DIR
echo 'staring...'
bison -d -y -v ./$yaccFile
echo 'yacc file compiled'
g++ -w -c -o ./y.o ./y.tab.c
echo 'y.tab.c compiled'
flex -o ./lex.yy.c ./$lexFile
echo 'lex file compiled'
g++ -fpermissive -w -c -o ./l.o ./lex.yy.c
echo 'lex.yy.c compiled'
g++ -o ./a.out ./y.o ./l.o	
echo 'object files done'
./a.out ./input1.txt ./log.txt ./error.txt
echo 'everything working fine....'
