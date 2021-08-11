use cobis
go
/* Variables */
declare	   
	@w_id_menu			int,
	@w_id_menu2			int,
	@w_id_menu3			int,
	@w_id_menu4			int,
	@w_id_menu5			int,
	@w_id_producto 		int,
	@w_id_rol			int,
	@w_id_url			varchar(300),
	@w_me_name			varchar(50),
	@w_me_description	varchar(80),
	@w_id_url2			varchar(300),
	@w_me_name2			varchar(50),
	@w_me_description2	varchar(80),
	@w_id_url3			varchar(300),
	@w_me_name3			varchar(50),
	@w_me_description3	varchar(80),
	@w_id_url4			varchar(300),
	@w_me_name4			varchar(50),
	@w_me_description4	varchar(80),
	@w_id_url5			varchar(300),
	@w_me_name5			varchar(50),
	@w_me_description5	varchar(80),
	@w_id_select		int,
	@w_pd_descripcion	varchar(50),
	@w_ro_descripcion	varchar(50),
	@w_me_container		varchar(50),
	@me_id_parent		int
--==========================ASIGNACION DE VARIABLES GLOBAL==========================
select	@w_pd_descripcion	=	'CLIENTES'
select	@w_ro_descripcion	=	'CAPACITACION'
select	@w_me_container		=	'CWC'
select 	@me_id_parent		=	7966
--==========================FIN ASIGNACION DE VARIABLES GLOBAL=============================

--=====================ASIGNACION DE VARIABLE ESTUDIANTE 1 ================================
select	@w_id_url			=	'views/GRAWC/ESTDN/T_GRAWCBMIGGNYY_599/1.0.0/VC_ESTUDIANUU_589599_TASK.html'
select 	@w_me_name			=	'FORM_KOU'			/*nombre que aparecera en el menu, pertenece a cew_menu*/
select	@w_me_description	=	'GRUPOA'
--=====================FIN ASIGNACION DE VARIABLE ESTUDIANTE 1 ============================

--=====================ASIGNACION DE VARIABLE ESTUDIANTE 2 ================================
select	@w_id_url2			=	''
select 	@w_me_name2			=	''			/*nombre que aparecera en el menu, pertenece a cew_menu*/
select	@w_me_description2	=	'GRUPOA'
--=====================FIN ASIGNACION DE VARIABLE ESTUDIANTE 2 ============================

--=====================ASIGNACION DE VARIABLE ESTUDIANTE 3 ================================
select	@w_id_url3			=	'views/GRAWC/ESTDN/T_GRAWCNLNGQCIX_617/1.0.0/VC_ESTUDIANTT_532617_TASK.html'
select 	@w_me_name3			=	'MNU_TONY_GRA'			/*nombre que aparecera en el menu, pertenece a cew_menu*/
select	@w_me_description3	=	'GRUPOA'
--=====================FIN ASIGNACION DE VARIABLE ESTUDIANTE 3 ============================

--=====================ASIGNACION DE VARIABLE ESTUDIANTE 4 ================================
select	@w_id_url4			=	'web/views/GRAWC/ESTDN/T_GRAWCJFYKXDTH_245/1.0.0/VC_ESTUDIANZE_388245_TASK.html'
select 	@w_me_name4			=	'MNU_RSZR_GRA'			/*nombre que aparecera en el menu, pertenece a cew_menu*/
select	@w_me_description4	=	'GRUPOA'
--=====================FIN ASIGNACION DE VARIABLE ESTUDIANTE 4 ============================

--=====================ASIGNACION DE VARIABLE ESTUDIANTE 5 ================================
select	@w_id_url5			=	''
select 	@w_me_name5			=	''			/*nombre que aparecera en el menu, pertenece a cew_menu*/
select	@w_me_description5	=	'GRUPOA'
--=====================FIN ASIGNACION DE VARIABLE ESTUDIANTE 5 ============================

/*Selects*/
--id productos
select	@w_id_producto	=	pd_producto		
from 	cl_producto 
where	pd_descripcion	=	@w_pd_descripcion
--id rol
select	@w_id_rol		=	ro_rol
from	ad_rol
where	ro_descripcion	=	@w_ro_descripcion
select	@w_id_rol



/*Insert Into*/
select	@w_id_select	=	me_id 
from	cew_menu
where	me_url			=	@w_id_url

if  exists(select 1 from cew_menu_role where mro_id_role =  @w_id_rol	)
	begin
		delete from cew_menu_role
		where 	mro_id_menu  	= 	@w_id_select 
		and 	mro_id_role		=  	@w_id_rol
		print	'Borrando Registro del rol...'
	end
-- cew_menu
if  exists(select 1 from cew_menu where me_url = @w_id_url)
	begin
		delete from cew_menu where me_url = @w_id_url
		print 	'Borrando URL1...'
	end

if  exists(select 1 from cew_menu where me_url = @w_id_url2)
	begin
		delete from cew_menu where me_url = @w_id_url2
		print 	'Borrando URL2...'
	end

if  exists(select 1 from cew_menu where me_url = @w_id_url3)
	begin
		delete from cew_menu where me_url = @w_id_url3
		print 	'Borrando URL3...'
	end

if  exists(select 1 from cew_menu where me_url = @w_id_url4)
	begin
		delete from cew_menu where me_url = @w_id_url4
		print 	'Borrando URL4...'
	end

if  exists(select 1 from cew_menu where me_url = @w_id_url5)
	begin
		delete from cew_menu where me_url = @w_id_url5
		print 	'Borrando URL5...'
	end
--select * from cew_menu order by me_id
--select * from cew_menu_role
--DELETE from cew_menu WHERE me_name = '1MNU_KUG_BVDA'
--DELETE from cew_menu_role WHERE mro_id_menu = 7553
--=============================================================
/*Selects*/
--id menu
select	@w_id_menu	=	max(me_id) 	
from	cew_menu
select	@w_id_menu	+=	1
select	@w_id_menu
--=====================ASIGNACION DE VARIABLE ESTUDIANTE 5 ================================
--select	@w_id_url5			=	''
--select 	@w_me_name5			=	''			/*nombre que aparecera en el menu, pertenece a cew_menu*/
--select	@w_me_description5
insert into cew_menu ( 
	me_id,		me_id_parent,	me_name,		me_visible,	me_url,		me_order,	me_id_cobis_product,	me_option,	me_description,		me_version,	me_container)
values (
	@w_id_menu,	@me_id_parent,	@w_me_name,		1,			@w_id_url,	1,			@w_id_producto, 		0,			@w_me_description,	NULL, 		@w_me_container)

	
select	@w_id_menu2	=	@w_id_menu + 1
select	@w_id_menu2
	insert into cew_menu ( 
	me_id,			me_id_parent,	me_name,		me_visible,	me_url,		me_order,	me_id_cobis_product,	me_option,	me_description,		me_version,	me_container)
values (
	@w_id_menu2,	@me_id_parent,	@w_me_name2,		1,		@w_id_url2,	1,			@w_id_producto, 		0,			@w_me_description2,	NULL, 		@w_me_container)

select	@w_id_menu3	=	@w_id_menu2 + 1
select	@w_id_menu3
insert into cew_menu ( 
	me_id,			me_id_parent,	me_name,		me_visible,	me_url,		me_order,	me_id_cobis_product,	me_option,	me_description,		me_version,	me_container)
values (
	@w_id_menu3,	@me_id_parent,	@w_me_name3,		1,		@w_id_url3,	1,			@w_id_producto, 		0,			@w_me_description3,	NULL, 		@w_me_container)

select	@w_id_menu4	=	@w_id_menu3 + 1
select	@w_id_menu4
insert into cew_menu ( 
	me_id,			me_id_parent,	me_name,		me_visible,	me_url,		me_order,	me_id_cobis_product,	me_option,	me_description,		me_version,	me_container)
values (
	@w_id_menu4,	@me_id_parent,	@w_me_name4,		1,		@w_id_url4,	1,			@w_id_producto, 		0,			@w_me_description4,	NULL, 		@w_me_container)

	
select	@w_id_menu5	=	@w_id_menu4 + 1
select	@w_id_menu5
insert into cew_menu ( 
	me_id,			me_id_parent,	me_name,		me_visible,	me_url,		me_order,	me_id_cobis_product,	me_option,	me_description,		me_version,	me_container)
values (
	@w_id_menu5,	@me_id_parent,	@w_me_name5,		1,		@w_id_url5,	1,			@w_id_producto, 		0,			@w_me_description5,	NULL, 		@w_me_container)

-- ad_rol
INSERT INTO dbo.cew_menu_role (
	mro_id_menu,	mro_id_role)
VALUES (
	@w_id_menu,		@w_id_rol)

INSERT INTO dbo.cew_menu_role (
	mro_id_menu,	mro_id_role)
VALUES (
	@w_id_menu2,		@w_id_rol)

INSERT INTO dbo.cew_menu_role (
	mro_id_menu,	mro_id_role)
VALUES (
	@w_id_menu3,		@w_id_rol)

INSERT INTO dbo.cew_menu_role (
	mro_id_menu,	mro_id_role)
VALUES (
	@w_id_menu4,		@w_id_rol)

INSERT INTO dbo.cew_menu_role (
	mro_id_menu,	mro_id_role)
VALUES (
	@w_id_menu5,		@w_id_rol)
	
/*PRINTS*/
print	'Valor id menu: '		+	convert(varchar(10),	@w_id_menu)
print	'Valor id menu: '		+	convert(varchar(10),	@w_id_menu2)
print	'Valor id menu: '		+	convert(varchar(10),	@w_id_menu3)
print	'Valor id menu: '		+	convert(varchar(10),	@w_id_menu4)
print	'Valor id menu: '		+	convert(varchar(10),	@w_id_menu5)
print	'Valor id producto: '	+	convert(varchar(10),	@w_id_producto)
