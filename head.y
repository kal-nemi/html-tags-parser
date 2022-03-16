%{
#include<stdio.h>       // including the required libraries.
#include<stdlib.h>      //
int yyerror();          // function declared 
int yyparse();          //
int yylex();            //
%}

%token H_S H_E       
%token T_S T_E        
%token F_S F_E        
%token NEWLINE          

%%

// when the input is valid it will print Valid Statement.
statement : statement S NEWLINE { printf("\nValid Statement!\n"); return 0; }  
          | 
          ;

S : H_S S1 H_E      		//We Can use title tag inside head tag
  | S1				//We can directly use title tag without nested use of head/font tag
  | F_S S2 F_E  		//We can directly use font tag but cant use head/title tag inside it.	
  | H_S S2 H_E      		//We can leave an empty head			
  | H_S S3 H_E           	// for nested font in head
  ;

S1 : T_S S2 T_E			//title cant have nested head/font
     
   ;
S3: F_S S2 F_E			//font cant have nested head/title
                                         // 
S2 : /*empty*/
   ;
%%


int main(){
  printf("Enter the HTML: \n");   // Asking user for entering the input
  yyparse();                      // yyparse function called
  system("pause");                
  return 0;                        
}



int yyerror (char *str) {         // this funtion will be called when the input is not valid.
  printf("\nInvalid Statement \n");
  return 1;
}
 