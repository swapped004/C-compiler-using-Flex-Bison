I developed a C compiler utilizing Flex and Bison for lexical analysis, syntax parsing, and code generation as a part of my university assignment in the Compiler course.
___

# Spec:
With this part in the ReadMe file, 2 more files - 
scanner.l and parser.y are given. they are just a skeleton for your help. your .l and .y files will have a similar structure. be careful that you will need to add and change these skeletons as instructed in class and assignment specification. 
the scanner.l file may contain less patterns than you have already done, so keep your own version, just follow the structure. 
the parser.y file contains the c grammar you need to implement which is also given in grammar.txt file. you will need to write the main function in parser.y as your coding requirements.

I managed to make a fully functional C compiler that was able to compile even some of the more complex codes like recursion. I also made some optimizations to the generated code.

___

# How to Use:
+ As a prerequisite, install flex and bison:
```
sudo apt-get update
sudo apt-get install -f flex
sudo apt-get install bison
```
+ Give `command.sh` permission to execute
```
chmod +x command.sh
```
+ Run `command.sh` with the command line argument set to the file you want to compile, e.g:
```
command.sh a.c
```
+ Volia!!! The code will be generated into `code.asm` assembly file with the optimized version of it into `optimized_code.asm`
