package analizador;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java_cup.runtime.Symbol;
import java.sym;
import javax.swing.table.DefaultTableModel;

/*seccion de declaraciones de Jflex*/

%%
%class lexer
%unicode
%cupsym sym
%cup
%line
%char
%column
%public
%full
%{
    private Symbol symbol (int type){
    return new Symbol (type, yyline, yycolumn);
    }

    private Symbol symbol (int type, Object value){
    return new Symbol (type, yyline, yycolumn);
    }
    
    public static Analizer analys = new Analizer();
%}
bloque = "/*" [^*] ~"*/" | "/*" "*"+ "/"
linea = "//".+|"// "
id = [a-zA-Z][a-zA-Z0-9_]*
numero = [0-9]+
real = {numero}"."{numero}
comilla = "\"" [^*] ~"\"" | "\""+"\'"
cadena = "\'" [^*] ~"\'" | "\'"+"\'"
id = [a-zA-Z][a-zA-Z0-9_]*
%%

/*PARA COMENTARIOS*/

<YYINITIAL> "%" {
    DefaultTableModel model;
    model = (DefaultTableModel) analys.Tabla1.getModel();
    Object[] obj = {"OTRO", "mod", yytext(), yyline, yycolumn};
    model.addRow(obj);
    Reporte u = new Reporte();
    u.escritura("OTRO "+"mod "+yytext()+" "+yyline+" "+yycolumn);
    return symbol (Token.otro, yyline, yychar, new String (yytet()));
}

<YYINITIAL> "abstract"           { return symbol(sym.ABSTRACT); }
