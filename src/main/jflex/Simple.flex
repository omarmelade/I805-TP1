/* --------------------------Section de Code Utilisateur---------------------*/
package fr.evaluator;
import java_cup.runtime.Symbol;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%cup

// code a ajouter dans la classe produite
%{

%}

/* definitions regulieres */
CHIFFRE = [0-9]+;
PLUS    = "+";
MINUS   = "-";
TIMES   = "*";
DIVIDE  = "/";
sep     = \s;

%%
/* ------------------------Section des Regles Lexicales----------------------*/

/* regles */

{CHIFFRE}   { return new Symbol(SimpleParserSym.CHIFFRE, yyline, yycolumn, new Integer(yytext())); }
{PLUS}      { return new Symbol(SimpleParserSym.PLUS, yyline, yycolumn); }
{MINUS}     { return new Symbol(SimpleParserSym.MINUS, yyline, yycolumn); }
{TIMES}     { return new Symbol(SimpleParserSym.TIMES, yyline, yycolumn); }
{DIVIDE}    { return new Symbol(SimpleParserSym.DIVIDE, yyline, yycolumn); }
{PAR_OPEN}  { return new Symbol(SimpleParserSym.PAR_OPEN, yyline, yycolumn); }
{PAR_CLOSE} { return new Symbol(SimpleParserSym.PAR_CLOSE, yyline, yycolumn); }
{MOD}       { return new Symbol(SimpleParserSym.MOD, yyline, yycolumn); }
{EQUAL}     { return new Symbol(SimpleParserSym.EQUAL, yyline, yycolumn); }
{VARIABLE}  { return new Symbol(SimpleParserSym.VARIABLE, yyline, yycolumn, new String(yytext())); }
{LET}       { return new Symbol(SimpleParserSym.LET, yyline, yycolumn); }
";"			{ return new Symbol(SimpleParserSym.SEMI, yyline, yycolumn);   }
{COMMENTARY} {  ; /* on fait rien */ }
\s+          { ; /* on fait rien */ }
.           { return new Symbol(SimpleParserSym.ERROR, yyline, yycolumn); }
