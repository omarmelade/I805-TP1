/* --------------------------Section de Code Utilisateur---------------------*/
package fr.evaluator;
import java_cup.runtime.Symbol;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleEvaluator
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym EvaluatorSym
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
{sep}      { /* pas d'action */ }
{CHIFFRE}+   { return new Symbol(EvaluatorSym.CHIFFRE, yyline, yycolumn); }
{PLUS}      { return new Symbol(EvaluatorSym.PLUS, yyline, yycolumn); }
{MINUS}     { return new Symbol(EvaluatorSym.MINUS, yyline, yycolumn); }
{TIMES}     { return new Symbol(EvaluatorSym.TIMES, yyline, yycolumn); }
{DIVIDE}    { return new Symbol(EvaluatorSym.DIVIDE, yyline, yycolumn); }
.           { return new Symbol(EvaluatorSym.ERROR, yyline, yycolumn); }
";"			{ return new Symbol(EvaluatorSym.SEMI, yyline, yycolumn) ;}
