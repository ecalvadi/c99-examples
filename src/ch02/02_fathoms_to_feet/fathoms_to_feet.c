#include <stdio.h> /*Defines printf*/

/*The main function of fathoms to feet program*/
int main(void){
    /*Statement to declare Integer variables*/
    int feet, fathoms;

    /*Asign values to variables*/
    fathoms = 2;
    feet = fathoms * 6; /*Calc feet from fathoms*/

    printf("There are %d feet in %d fathoms!\n", feet, fathoms);
    printf("Yes, I said %d feet!\n", 6 * fathoms);

    /*End of program*/
    return 0;
}
