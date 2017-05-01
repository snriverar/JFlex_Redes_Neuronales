%{

#include <math.h>
#include <stdio.h>
void pal_reservada(char const *cadena);
void identificador(char const *cadena);
void entero(char const *cadena);
void real(char const *cadena);
void teminador(char const *ter);
void parentesis(char const *par);
void operadorar(char const *oper_ar);
void operadorlog(char const *oper_log);
void operadorrel(char const *oper_rel);
void opasig(char const *op_as);
void opdif(char const *op_dif);
void opcomp(char const *op_comp);
void corchete(char const *corc);
void comilla(char const *com);
void dospunt(char const *ds_pun);
void operadorcom(char const *comn);

%}


DIGITO              [0-9]
LETRA               [a-zA-Z]
ENTERO              ({DIGITO}?({DIGITO})*)
REAL                ({DIGITO}+"."{DIGITO}*)
EXPONENTE           ([eE](\+?|-){ENTERO})

RESERVADA           if|else|true|false|switch|case|break|default|while|do|for|return|length|constant|adicionar|conectar|eliminar|deconectar|crear|destruir|aprender|nombre|peso|celula|entrada_celula|salida_celula|arreglo_entrada|arreglo_salida|printf|function|mod|int|double|char|string
ID                  ({LETRA}({LETRA}|{DIGITO})*)
TERMINADOR          [;]
PARENTESIS          [()]
OPASIG              ['=']
OPDIF               !=
OPCOMP              ==
CORCHETE            [\{|\}]
OPERADORAR          ['+'|\-|'*'|'/']
OPERADORLOG         &|\|
OPERADORREL         <|>|>=|<=
COMILLAS            ['"']
DOSPUNTOS           [':']
COMENTARIOS         ##


BINARIO                 {0|1}


nombre                  {ID}        //NOMBRE DE LA CELULA
peso                    {ENTERO}               //PESO DE LA NEURONA
celula                  {{NOMBRE} ?(,{PESO})    //CELULA
entrada_celula          {BINARIO}               //ENTRADA DE CELULA
salida_celula           {BINARIO}               //SALIDA DE CELULA
arreglo_entrada         \[({ENTRADA_CELULA}) (\,{ENTRADA_CELULA})*\]     //CONJUNTO DE VALORES DE ENTRADA DE CELULAS DE LA CAPA ENTRADA
arreglo_salida          \[({ENTRADA_CELULA}) (\,{ARREGLO_SALIDA})*\]     //CONJUNTO DE VALORES DE SALIDA DE CELULAS DE LA CAPA DE SALIDA

%%

{ENTERO}        entero(yytext);


{REAL}          real(yytext);
{RESERVADA}     pal_reservada(yytext);
{ID}            identificador(yytext);

{TERMINADOR}     teminador(yytext);
{PARENTESIS}     parentesis(yytext);
{COMILLAS}       comilla(yytext);
{DOSPUNTOS}      dospunt(yytext);
{OPCOMP}         opcomp(yytext);
{OPASIG}         opasig(yytext);
{OPDIF}          opdif(yytext);
{OPERADORLOG}    operadorlog(yytext);
{OPERADORAR}     operadorar(yytext);
{OPERADORREL}    operadorrel(yytext);
{CORCHETE}       corchete(yytext);
{COMENTARIOS}   operadorcom(yytext);


"/*"[^}\n]*"*/"     /* consumir lineas de comentarios */

[ \t\n\r\b]+	     /* consumir espacios */

.	                printf( "Caracter desconocido: %s\n", yytext );


%%

int main(int argc, char *argv[])
{
    ++argv, --argc;  /* se salta el nombre del programa */
    if (argc > 0){
        yyin = fopen(argv[0], "r");
        //printf("++++++++++++%d\n",yyin);


    }

    else
        yyin = stdin;
    yylex();
    printf("\n");

    return 0;
}


void entero(char const *cadena){
    printf("Un entero: %s \n", cadena );
}

void real(char const *cadena){
    printf("Un real: %s \n", cadena );
}

void pal_reservada(char const *cadena){
    printf("Una palabra reservada: %s \n", cadena );
}

void identificador(char const *cadena){
    printf("Un identificador: %s \n", cadena );
}

void teminador(char  const *ter){
    printf("Terminador de instrucción: %s \n",ter );
}

void parentesis(char const *par ){
    if(*par == '(' ){
        printf("Un parentesis que abre: %s \n", par);
    }else if (*par == ')') {
        printf("Un parentesis que cierra: %s \n",par );
    }

}

void operadorar(char const *oper_ar){
    printf("Un operador aritmetico: %s\n", oper_ar);

}

void operadorlog(char const *oper_log){
    printf("Un operador lógico: %s \n", oper_log);
}

void operadorrel(char const *oper_rel){
    printf("Un operador relacional: %s \n", oper_rel);
}

void opasig(char const *op_as){
    printf("Un operador de asignación: %s \n", op_as);
}

void opdif(char const *op_dif){
    printf("Un operador de diferencia: %s\n", op_dif);
}

void opcomp(char const *op_comp){
    printf("Un operador de comparación: %s \n", op_comp);
}

void corchete(char const *corc){
    printf("Un corchete: %s \n", corc);
}

void dospunt(char const *ds_pun){
    printf("caracter dos puntos: %s \n",ds_pun);
}
void comilla(char const *com){
    printf("caracter comilla: %s \n",com);
}
void operadorcom(char const *comn){
    printf("Operador para comentarios: %s\n", comn);
}
