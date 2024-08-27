{2.- Escribir un programa que:
a.Implemente un módulo recursivo que genere y retorne una lista de números enteros “random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en orden inverso al que están 
almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva verdadero si dicho valor se encuentra en la lista
o falso en caso contrario.}
program ej2;
const
	min=100;
	max=200;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;
procedure agregarAdelante(var l: lista; r:integer);
var
	nue:lista;
begin
	new(nue); nue^.dato:=r; nue^.sig:=l; l:=nue;
end;
procedure imprimirRandom(var l: lista; r:integer); // l:lista?

begin
	Randomize;
	if r <> 100 then begin
		r:=random(max - min + 1) + min;
		agregarAdelante(l,r);
		imprimirRandom(l, r);
	end
	else // hace falta?
		r:=100;
end;

procedure imprimirLista(l:lista);

begin
	if l <> nil then begin
		writeln(l^.dato);
		imprimirLista(l^.sig);
	end;
end;
procedure imprimirInverso(l:lista);

begin
	if l <> nil then begin
		imprimirLista(l^.sig);
		writeln(l^.dato);
	end;
end;
function minimo(l:lista; sig: lista; min:integer):integer; // preguntar
var
begin
	if l^.sig <> nil then
		if l^.dato < l^.sig then
			minimo(l^.dato,l^.sig,min);
end;
var
	r:integer; l:lista; min: integer;
BEGIN
	l:=nil; r:=random(max - min + 1);
	imprimirRandom(l,r);
	imprimirLista(l);
	imprimirInverso(l);
	minimo(l, min);
END.
