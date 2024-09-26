yaccFile=parser.y
lexFile=offline.l
inputFile=sample_input_files_regression_test/recurse.c
####################################################################
#Created by Swapnil 1705025
####################################################################
DIR="$(cd "$(dirname "$0")" && pwd)"
echo $DIR
cd $DIR
pwd
echo 'starting...'
bison -d -y -v ./$yaccFile
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
./a.out ./$inputFile ./log.txt ./error.txt
echo 'everything working fine....'
