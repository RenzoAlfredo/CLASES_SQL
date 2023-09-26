
drop table Tabla_A_Clientes_Repaso;
drop table Tabla_B_Consumos_Repaso;
--Buena pr�ctica: tu c�digo tiene que ser lo m�s simple posible
--Buena pr�ctica: tu c�digo tiene que ser lo m�s ordenado posible
--Buena pr�ctica: cuando programes algo, piensa en c�mo lo leer�a otra persona...poner comentarios

--> Crear nuestras tablas
--Buena pr�ctica: el nombre de los campos debe de empezar en may�scula cada palabra, sin espacios
create table Tabla_A_Clientes_Repaso
(
NumeroDNI	NVARCHAR(8) NOT NULL,
Nombre    VARCHAR(MAX),
Apellido  VARCHAR(MAX),
Edad	int,
primary key(numeroDNI)
)

create table Tabla_B_Consumos_Repaso
(
CodigoArticulo bigint not null,
FechaConsumo   nvarchar(8),
NroDNIClienteConsumo nvarchar(8),
ImporteConsumo decimal(28,3) 
)

select* from  Tabla_A_Clientes_Repaso;
select* from  Tabla_B_Consumos_Repaso;


--> insertar datos

insert into Tabla_A_Clientes_Repaso
values
(11223344,'a','aa',15),
(11223345,'b','ee',20),
(11223346,'c','ii',25),
(11223347,'d','oo',30),
(11223348,'e','uu',35),
(11223349,null,'aa',15);  
	        	         
insert into Tabla_B_Consumos_Repaso
values
(1, 20230901,11223344,10 ),
(4, 20230901,11223344,100),
(7, 20230902,11223345,20 ),
(10,20230810,11223345,300);


--> browsing de la informaci�n
--Buena pr�ctica: siempre hacerle un select top a tus tablas
select top 10* from Tabla_A_Clientes_Repaso;
select top 10* from Tabla_B_Consumos_Repaso;

sp_help Tabla_A_Clientes_Repaso
sp_help Tabla_B_Consumos_Repaso


--> inner join
--Buena pr�ctica: se jala toda la informaci�n de la tabla a, y solo algunos campos de la tabla b
--Buena pr�ctica: tener mucho cuidado con los inner joins ya que podemos perder informaci�n, por lo que se recomienda su uso cuando estemos seguros de que solo queramos la intercecci�n sino usar left join
select a.*, b.FechaConsumo, b.ImporteConsumo
from  Tabla_A_Clientes_Repaso	a
inner join  Tabla_B_Consumos_Repaso b
on a.NumeroDNI = b.NroDNIClienteConsumo

         

