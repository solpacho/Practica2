{3.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300 y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.}
program ej3;
const
	min=300;
	max=1550;
type
	subrango=1..20;
	vecEnteros=array[subrango] of integer;
procedure cargarVector(var vE:vecEnteros; var dimL: integer);
var
	n: integer;
begin
	n:=random(max-min+1) + 300;
	if dimL <= 20 then begin
		vE[dimL]:=n;
		dimL:= dimL+1;
		cargarVector(vE, dimL);
	end;
end;
procedure imprimirVector(vE:vecEnteros;  dimL:integer);
begin
	if dimL <= 20 then begin
		writeln(vE[dimL]);
		dimL:=dimL+1;
		imprimirVector(vE,dimL);
	end;
end;
var
	vE:vecEnteros; dimL:integer;
BEGIN
	Randomize; dimL:=1;
	cargarVector(vE,dimL);
	imprimirVector(vE,1); // dimL no porque queda modificado en 10 cuando se carga el vector
END.
