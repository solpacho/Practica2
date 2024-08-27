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
procedure imprimirRandom(var l: lista); // l:lista?
var
 r:integer;
begin
	r:=random(max - min + 1) + min;	
	if r <> 100 then begin
		agregarAdelante(l,r);
		imprimirRandom(l);
	end;
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
function minimo(l:lista):integer; // preguntar
var
	min:integer;
begin
	if l = nil then
		minimo:=9999
	else begin
		min:=minimo(l^.sig);
		if l^.dato < min then 
			minimo:=l^.dato
		else	
			minimo:=min;
	end;
end;
function buscarValor(l:lista; valor: integer):boolean;
begin
	if l = nil then
		buscarValor:=false
	else if l^.dato=valor then
		buscarValor:=true
		else
			buscarValor:=buscarValor(l^.sig,valor);
end;
var
	 l:lista; valor: integer;
BEGIN
Randomize;
	l:=nil; 
	imprimirRandom(l);
	writeln('imp ran termina');
	imprimirLista(l);
	writeln('imp lista termina');
	imprimirInverso(l);
	writeln('termina el inverso');
	minimo(l);
	write(minimo(l));
	writeln('escribir valor');
	readln(valor);
	buscarValor(l,valor);
	writeln(buscarValor(l,valor));
END.
