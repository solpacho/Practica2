{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio. Para cada venta generar código de producto, fecha y
cantidad de unidades vendidas. Finalizar con el código de producto 0. Un producto puede estar en más de una venta. Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto. Los códigos repetidos van a la derecha.

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe 
contener el código de producto y la cantidad total de unidades vendidas.

iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe 
contener el código de producto y la lista de las ventas realizadas del producto.

Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad total de productos vendidos en la fecha recibida.
1TALLER DE PROGRAMACIÓN – Módulo Imperativo 2024
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto con mayor cantidad total de unidades vendidas.
c. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto con mayor cantidad de ventas.}

program ej2final;
type
	fecha=record
		dia: 1..31;
		mes:1..12;
		anio: 2000..2024;
	end;
	venta1 = record
		cod: integer;
		f: fecha;
		cdadU: integer;
	end;
	arbol1=^nodoArbol;
	nodoArbol=record 
		dato: venta1;
		HI: arbol1;
        HD: arbol1;
    end;
    venta2 = record
		cod: integer;
		cdadU: integer;
	end;
	arbol2=^nodoArbol2;
	nodoArbol2=record
		dato: venta2;
		HI: arbol2;
        HD: arbol2;
    end;
    lista=^nodo;
    nodo=record
		dato: venta;
		sig: lista;
	end;
    venta3 = record
		cod: integer;
		ventasRealizadas: lista;
	end;
    arbol3=^nodoArbol3;
	nodoArbol3=record
		dato: venta3;
		HI: arbol3;
        HD: arbol3;
    end;

{procedure generarArbol2(var a2: arbol2; v2: venta2);
begin
	if a2=nil then begin
		new(a2); a2^.dato:=v2; a2^.HI:=nil; a2^.HD:=nil;
	end
	else begin
		if (v2.cod < a2^.dato.cod) then
			generarArbol2(a2^.HI,v2)
		else 
			generarArbol2(a2^.HD,v2);	
	end;
end;}

procedure generarArbol3(v1: venta; var a3:arbol3);

var
begin
	if a3 = nil then begin
		new(a3); a3^.dato.cod:=v1.cod; a3^.dato.ventasRealizadas:=nil;
	end
	else begin 
end;

procedure generarVentas(var a1: arbol1; var a2: arbol2);
	
	procedure generarArbol2(var a2: arbol2; v2: venta2);
	begin
		if a2=nil then begin
			new(a2); a2^.dato:=v2; a2^.HI:=nil; a2^.HD:=nil;	
		end
		else begin
			if (v2.cod < a2^.dato.cod) then begin
				generarArbol2(a2^.HI,v2);
			end
			else begin 
				generarArbol2(a2^.HD,v2);	
			end;
		end;
	end;
	
	procedure cargarVenta(var v1:venta1);
	begin
		v1.cod:=random(100);
		if v1.cod <> 0 then begin
			v1.f.dia:=random(31)+1;
			v1.f.mes:=random(12)+1;
			v1.f.anio:=(24) + 2000;
			v1.cdadU:=random(100) + 1;
		end;
	end;
	
	procedure agregarVenta(var a1: arbol1; v1:venta1); // cod: integer; cdadU: integer;
	var
		v2: venta2;
	begin
		v2.cod:=v1.cod; v2.cdadU:=v1.cdadU;
		generarArbol2(a2,v2);
		generarArbol3(a3,v3);
		if a1=nil then begin
			new(a1); a1^.dato:=v1; a1^.HI:=nil; a1^.HD:=nil;
		end
		else begin
			if (v1.cod < a1^.dato.cod) then begin
				agregarVenta(a1^.HI,v1);
			end
			else begin 
				agregarVenta(a1^.HD,v1);	
			end;
		end;
	end;
	
var
	//a1: arbol1; a2: arbol2; 
	v1:venta1; 
begin 
	cargarVenta(v1);
	while v1.cod <> 0 do begin // con while funciona, con if como quedaría?
		agregarVenta(a1, v1);
		cargarVenta(v1);
	end;
end;

procedure imprimirRegistro(v1:venta1);
begin
		writeln('código numero ', v1.cod);
		writeln(v1.f.dia);
		writeln(v1.f.mes);
		writeln(v1.f.anio);
		writeln('cantidad ', v1.cdadU);
end;

procedure imprimirArbolNuevo(a1:arbol1);
begin
	if a1 <> nil then begin
		imprimirRegistro(a1^.dato);
		imprimirArbolNuevo(a1^.HI);
		imprimirArbolNuevo(a1^.HD);
	end;
end;
procedure imprimirRegistro2(v2:venta2);
begin
		writeln('código numero ', v2.cod);
		writeln('cantidad ',v2.cdadU);
end;
procedure imprimirArbolDOS(a2:arbol2);
begin
	if a2 <> nil then begin
		imprimirRegistro2(a2^.dato);
		imprimirArbolDOS(a2^.HI);
		imprimirArbolDOS(a2^.HD);
	end;
end;

var
	a1: arbol1; a2: arbol2; a3: arbol3;
BEGIN
	randomize;
	a1:=nil; a2:=nil; a3:=nil;
	generarVentas(a1,a2);
	imprimirArbolNuevo(a1);
	writeln('empieza arbol 2');
	imprimirArbolDOS(a2);
	incisoTres(a1,a3);
END.
