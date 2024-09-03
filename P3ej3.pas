{3. Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de Informática y los almacene en una estructura de 
datos. La información que se lee es legajo, código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y su cantidad de finales aprobados (nota mayor o
 igual a 4).
c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe retornar los legajos y promedios de los alumnos cuyo 
promedio supera el valor ingresado.}
program ejercicio3;
type
	subrangoDia = 1..31;
	subrangoMes = 1..12;
	subrangoAnio = 2000..2024;
	f = record
		dia:subrangoDia;
		mes:subrangoMes;
		anio:subrangoAnio;
	end;
	
	final = record
		codMateria: integer;
		fecha: f;
		nota: integer;
	end;
	
	listaFinales=^nodo;
	nodo=record
		dato: final;
		sig: listaFinales;
	end;
	
	alumno = record
		legajo: integer;
		finales: listaFinales;
	end;
	
	arbol=^nodoArbol;
	nodoArbol=record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;

procedure generarAlumno(var a: arbol);

	procedure agregarAlArbol(a: arbol; alu:alumno);
	begin
		if a = nil then begin
			new(a); a^.dato:=alu; a^.HI:=nil; a^.HD:=nil;
		end
		else if alu.legajo < a^.dato.legajo then
				agregarAlArbol(a^.HI,alu)
		else if alu.legajo > a^.dato.legajo then
				agregarAlArbol(a^.HD, alu)
		else begin
		// Si el legajo ya existe, simplemente agregamos el final a la lista de finales
			agregarALaLista(a^.dato.finales, alu.finales^.dato); 
			end;
	end;
	procedure leerFinal(var fi: final);
	begin
		writeln('cod');
		readln(fi.codMateria);
		writeln('dia');
		readln(fi.fecha.dia);
		writeln('mes');
		readln(fi.fecha.mes);
		writeln('año');
		readln(fi.fecha.anio);
		writeln('nota');
		readln(fi.nota);
	end;
	
	procedure agregarALaLista(var l:listaFinales; fi:final);
	var
		nue:listaFinales;
	begin
		new(nue); nue^.dato:=fi; nue^.sig:=l; l:=nue;
	end;
	
	procedure leerAlumno(var alu: alumno; var l:listaFinales);
	var
		act: integer; fi: final;
	begin
		act:=alu.legajo;
		if alu.legajo = act then begin
			leerFinal(fi);
			agregarALaLista(l, fi);
			writeln('escribir legajo');
			read(alu.legajo);
			if (alu.legajo <> 0) and (alu.legajo = act) then
				leerAlumno(alu,l);
		end;
	end;
var
	alu: alumno; l:listaFinales;
begin
	l:=nil;
	writeln('escribir legajo');
	read(alu.legajo);
	while alu.legajo <> 0 do begin
		agregarAlArbol(a,alu);
		leerAlumno(alu,l);
		writeln('escribir legajo');
		read(alu.legajo);
	end;
end;

procedure imprimirRegistro(alu:alumno);
var
	l:listaFinales;
begin
		writeln('Legajo: ', alu.legajo);
		l := alu.finales;
		while l <> nil do begin
			writeln('  Código de Materia: ', l^.dato.codMateria);
			writeln('  Fecha: ', l^.dato.fecha.dia, '/', l^.dato.fecha.mes, '/', l^.dato.fecha.anio);
			writeln('  Nota: ', l^.dato.nota);
			l := l^.sig;
		end;
end;

procedure imprimirArbol(a:arbol);
begin
	if a <> nil then begin
		imprimirRegistro(a^.dato);
		imprimirArbol(a^.HI);
		imprimirArbol(a^.HD);
	end;
end;
var  
	a:arbol;
BEGIN
	generarAlumno(a);
	imprimirArbol(a);
END.
