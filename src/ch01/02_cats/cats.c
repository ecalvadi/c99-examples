#include <stdio.h> //Defines printf and scanf

/*Main function*/
int main(void)
{
    int cats = 0; //initialice of dog variable

    //Print a message to the terminal
    printf("How many cats you have?\n");

    //Get input from keyboard and save to cats variable
    scanf("%d", &cats);

    //Print a message with the cats you have
    printf("So you have %d cat(s)!\n", cats);

    return 0; //End of program
}
