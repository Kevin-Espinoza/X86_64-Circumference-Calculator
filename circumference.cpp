//****************************************************************************************************************************
//  Program name: "X86_64 Circumference Calculator" 
//  The purpose of this program is to get user input for a radius, and output the circumference
//  of a circle.  Copyright (C) 2020 Kevin Espinoza
//                                                                           
//  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
//  version 3 as published by the Free Software Foundation.                                                                    
//  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
//  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     
//  A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                            
//****************************************************************************************************************************

//*****************************************************************************************************************************
//  Author information
//  Author name: Kevin Espinoza
//  Author email: k.espinoza1012@gmail.com
//  X86_64 Circumference Calculator
//
//  File Name: circumference.cpp
//  Language: C++
//  Compile: gcc -c -m64 -Wall -fno-pie -no-pie -o circumference.o circumference.cpp -std=c++14
//  Purpose: This is the driver function for Assignment 4. The purpose of this function is to call the 
//  circle.asm file and print out the circumference of a circle, of which will be computed in circle.asm.  
//****************************************************************************************************************************


#include <stdio.h>

extern "C" double circle();

int main()
{
  printf("Welcome to your friendly circle circumference calculator.\n");
  printf("The main program will now call the circle function.\n\n");

  double circumference = circle();
  

  printf("%s%.19lf%s%a\n", "The main received this number: ", circumference, " = ", circumference);
  printf("Have a nice day. Main will now return 0 to the operating system.\n");

  return 0;
}