#*****************************************************************************************************************************
#  Program name: "X86_64 Circumference Calculator" 
#  The purpose of this program is to get user input for a radius, and output the circumference
#  of a circle.  Copyright (C) 2020 Kevin Espinoza      
#                                                              
#  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
#  version 3 as published by the Free Software Foundation.                                                                    
#  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
#  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     
#  A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                            
#*****************************************************************************************************************************

#*****************************************************************************************************************************
#  Author information
#  Author name: Kevin Espinoza
#  Author email: k.espinoza1012@gmail.com
#  X86_64 Circumference Calculator
#
#  File name: run.sh
#  Language: bash
#  Purpose: Compile, Assemble, and link all proper files to run the program.    
#******************************************************************************************************************************


# Compile circumference.c
gcc -c -m64 -Wall -fno-pie -no-pie -o circumference.o circumference.cpp -std=c++14

# Assemble circle.asm
nasm -f elf64 -l circle.lis -o circle.o circle.asm

# Link and create the program
gcc -m64 -no-pie -o hw4.out -std=c++14 circle.o circumference.o

# Run HW4
./hw4.out

# Clean up files
rm *.o
rm *.out
rm *.lis