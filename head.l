%{ 
#include "head.tab.h"  //including the tab.h file that associate the yacc-assigned token codes with your token names.
%} 


%% 

"<head>"  {return H_S;}
"</head>" {return H_E;}

"<title>" { return T_S;}     // returning unoredered list start tag to the parser.
"</title>"   { return T_E;}   // returning unoredered list end tag to the parser.

"<font>" {return F_S;}      // returning ordered list start tag to the parser.
"</font>" {return F_E;}     // returning ordered list end tag to the parser.
.;                         // ignoring 
"<" ;                      // ignoring
">" ;
\n       {return NEWLINE;} // return NEWLINE.


%%	 

int yywrap() {             // This function is called when input is exausted.
    return 1;             
}

