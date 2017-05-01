package jlexanalizerrn;
import static jlexanalizerrn.Token.*;

%{

void pal_reservada(String cadena);
void identificador(String cadena);
void entero(String cadena);
void real(String cadena);
void teminador(String ter);
void parentesis(String par);
void operadorar(String oper_ar);
void operadorlog(String oper_log);
void operadorrel(String oper_rel);
void opasig(String op_as);
void opdif(String op_dif);
void opcomp(String op_comp);
void corchete(String corc);
void comilla(String com);
void dospunt(String ds_pun);
void operadorcom(String comn);

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



%%

/*
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
 */

void entero(String cadena){
    System.out.print("Un entero: %s \n"+cadena);
}

void real(String cadena){
    System.out.print("Un real: %s \n"+cadena);
}

void pal_reservada(String cadena){
    System.out.print("Una palabra reservada: %s \n"+cadena);
}

void identificador(String cadena){
    System.out.print("Un identificador: %s \n"+cadena);
}

void teminador(String ter){
    System.out.print("Terminador de instrucción: %s \n"+ter );
}

void parentesis(String par ){
    if(*par == '(' ){
        System.out.print("Un parentesis que abre: %s \n"+ par);
    }else if (*par == ')') {
        System.out.print("Un parentesis que cierra: %s \n"+par );
    }

}

void operadorar(String oper_ar){
    System.out.print("Un operador aritmetico: %s\n"+ oper_ar);

}

void operadorlog(String oper_log){
    System.out.print("Un operador lógico: %s \n"+ oper_log);
}

void operadorrel(String oper_rel){
    System.out.print("Un operador relacional: %s \n"+ oper_rel);
}

void opasig(String op_as){
    System.out.print("Un operador de asignación: %s \n"+ op_as);
}

void opdif(String op_dif){
    System.out.print("Un operador de diferencia: %s\n"+ op_dif);
}

void opcomp(String op_comp){
    System.out.print("Un operador de comparación: %s \n"+ op_comp);
}

void corchete(String corc){
    System.out.print("Un corchete: %s \n"+ corc);
}

void dospunt(String ds_pun){
    System.out.print("caracter dos puntos: %s \n"+ds_pun);
}
void comilla(String com){
    System.out.print("caracter comilla: %s \n"+com);
}
void operadorcom(String comn){
    System.out.print("Operador para comentarios: %s\n"+ comn);
}