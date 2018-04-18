/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizador;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Stevep
 */
public class Reporte {
    	public void escritura(String parametro){
		File f;
		f = new File ("salida.txt");
		try{
			FileWriter w = new FileWriter(f, true);
			BufferedWriter bw = new BufferedWriter(w);
			PrintWriter wr = new PrintWriter (bw);
			wr.println(parametro);
			wr.close();
			bw.close();
		}catch(IOException e){
			System.out.println("NO SE PUDO ESCRIBIR EN EL ARCHIVO... "+ e);
		};
	}
}
