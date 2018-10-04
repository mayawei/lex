%{
#include<string>
#include<iostream>
std::string a;
%}


%%
(auto) { a+="_auto"; }
(break) { a+="_break"; }
(case) { a+="_case"; }
(char) { a+="_char"; }
(const) { a+="_const"; }
(continue) { a+="_continue"; }
(default) { a+="_default"; }
(do) { a+="_do"; }
(double) { a+="_double"; }
(else) { a+="_else"; }
(enum) { a+="_enum"; }
(extern) { a+="_extern"; }
(float) { a+="_float"; }
(for) { a+="_for"; }
(goto) { a+="_goto"; }
(if) { a+="_if"; }
(inline) { a+="_inline"; }
(int) { a+="_int"; }
(long) { a+="_long"; }
(register) { a+="_register"; }
(return) { a+="_return"; }
(short) { a+="_short"; }
(signed) { a+="_signed"; }
(sizeof) { a+="_sizeof"; }
(static) { a+="_static"; }
(struct) { a+="_struct"; }
(switch) { a+="_switch"; }
(typedef) { a+="_typedef"; }
(union) { a+="_union"; }
(unsigned) { a+="_unsigned"; }
(void) { a+="_void"; }
(volatile) { a+="_volatile"; }
(while) { a+="_while"; }
([a-z]|[A-Z]|_)([a-z]|[A-Z]|[0-9]|_)* { a+="_ID"; }
(\()	{ a+="_LP"; }
(\))	{ a+="_RP"; }
(\[)	{ a+="_LB"; }
(\])	{ a+="_RB"; }
(\-\>)  { a+="_P"; }
(\.)	{ a+="_DOT"; }
(!)		{ a+="_EX"; }
(~)		{ a+="_TL"; }
(\+\+)	{ a+="_PLUS"; }
(\-\-)	{ a+="_DEC"; }
(\-)	{ a+="_SUB"; }
(\*)	{ a+="_AS"; }
(&)		{ a+="_and"; }
(\/)	{ a+="_SLASH"; }
(%)		{ a+="_PER"; }
(\+)     { a+="_ADD"; }
(\<\<)	{ a+="_LEFT"; }
(\>\>)  { a+="_RIGHT"; }
(\<)	{ a+="_LESS"; }
(\<=)	{ a+="_LESSEQUAL"; }
(\>)	{ a+="_MORE"; }
(\>=)   { a+="_MOREEQUAL"; }
(==)	{ a+="_EQUAL"; }
(!=)	{ a+="_NOTEQUAL"; }
(\^)	{ a+="_XOR"; }
(\|)	{ a+="_OR"; }
(&&)	{ a+="_OR"; }

(\\a)	{ a+="_TRANS"; }
(\\b)	{ a+="_TRANS"; }
(\\f)	{ a+="_TRANS"; }
(\\n)	{ a+="_TRANS"; }
(\\r)	{ a+="_TRANS"; }
(\\t)	{ a+="_TRANS"; }
(\\v)	{ a+="_TRANS"; }

(\+|\-)?([1-9][0-9]*|0) { a+="_CONSTNUM"; }
(\+|\-)?([1-9][0-9]*|0)(\.[0-9]+) { a+="_CONSTFLOAT"; }
(')([a-z]|[A-Z])(') { a+="_CONSTCHAR"; }
(")([\s\S]*)(") { a+="_CONSTSTRING"; }

(" ")+  {a+=" ";}
(\r)+  {a+="\r";}
(\n)+  {a+="\n";}
(\t)+  {a+="\t";}

%%
std::string lex(FILE* input)
{
		yyin = input;
		a.clear();
		yylex();
		fflush(input);
		return a;
}