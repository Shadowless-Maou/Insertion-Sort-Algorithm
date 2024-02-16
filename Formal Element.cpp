// Formal Element.cpp : This file contains the 'main' function. Program execution begins and ends there.
//


#include <iostream>     // For console output
#include <string>       // For console output

extern "C" {void sort(char*, int); }		// tells the .cpp that there is a sort function that not in the locate source go find it and link the location so that the program know where it is, if it is using this function go there

int main()
{ 
	int Loop;
	do
	{
		std::string s;										// initialize s as a variable for string
		int L, newar;										// initialize L and Newar as a int
		char ans;											// initialize ans as a varible contaion for characters
		//std::cout << "Enter line of entries = ";			// print out message to user to get user to enter string variable 
		//std::cin >> s;										// resigter input into s
		s = "dSaDsA5263$$][()";							// code tester dSaDsA5263$$][();;
		L = s.length();										// set varible L to Length of string entered				
		std::cout << "size of input = " << L << "\n";
		sort(&s[0], L);										// passes in the array of character into the asm code to be sortted.
		std::cout << "\n" << " sorted entries = ";
		for (int i = 0; i < L; i++)							// print out the new arangement of the characters to the user.
		{
			std::cout << s[i];
		}
		std::cout << " " << std::endl;						// print out the new arangement of the characters to the user.
		std::cout << "would you like to try this again YES [y] or NO [n] ? "<<"\n"; // print out message questioning whether or not the user want to to repeat the program once more
		std::cout << "enter y or n here ---> :";									// tells the user to enter either y or n 
		std::cin >> ans;
			if (ans == 'n' || ans == 'N')											// regardless if the user enter n or N whether by accdent or by propuse the code will take either varation
			{
				Loop = 0;															// this will end the program loop and allow the user to close the program 
			}
			else if (ans == 'y' || ans == 'Y')										// regardless if the user enter y or Y whether by accdent or by propuse the code will take either varation
			{
				Loop = 1;															// this will prom the program to loop back to the start of the code
			}
			else																	// if the user enter anything other than y or n the program will end and tell the user to close the application
			{
				Loop = 0;
			}
	} while (Loop == 1);															// this is the condtion configure so that the code repeat itself, if this is changed to a 0 the loop will end
return 0;


}

