%{ 
#include "head.tab.h"  //including the tab.h file that associate the yacc-assigned token codes with your token names.
%} 


%% 

"<head>"  {return H_S;}	// returning head start tag to the parser.
"</head>" {return H_E;}	// returning head end tag to the parser.

"<title>" { return T_S;}     // returning title start tag to the parser.
"</title>"   { return T_E;}   // returning title end tag to the parser.

"<font>" {return F_S;}      // returning font start tag to the parser.
"</font>" {return F_E;}     // returning font end tag to the parser.
.;                         // ignoring 
"<" ;                      // ignoring
">" ;
\n       {return NEWLINE;} // return NEWLINE.


%%	 

int yywrap() {             // This function is called when input is exausted.
    return 1;             
}