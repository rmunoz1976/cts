

delete from t133t_unidades_medidas where id > 0;
delete from t132t_magnitudes_medidas where id > 0; 
delete from t181t_paises_monedas where id > 0;
delete from t130t_monedas where id > 0;
delete from t168t_municipios where id > 0;
delete from t165t_departamentos where id > 0;
delete from t162t_paises where id > 0;
delete from t171t_tipos_terceros where id > 0;
delete from t518m_productos where id > 0;
delete from t515m_subgrupo_productos where id > 0;
delete from t512m_grupo_productos where id > 0;
delete from t225e_empresas_datos where id > 0;
delete from t045t_website where id > 0;
delete from t046t_website_historico where id > 0;
delete from t040t_compania where id > 0;
delete from t160t_usuarios_roles where id > 0;
delete from t174t_tipos_documentos where id > 0;
delete from t150t_usuarios where id > 0;
delete from t155t_roles where id > 0;
delete from t140t_empresas where id > 0;
delete from t121t_estado_registros where id > 0;

INSERT INTO t040t_compania (id,codigo,nit,dv,nombre_corto,nombre_largo,sigla,fecha) 
VALUES (1,'1',123456789,1,'MyCompany','MyCompanyLarge','MC','2022-12-28');

INSERT INTO t121t_estado_registros (id,codigo,descripcion) VALUES (1,'1','ACTIVO');
INSERT INTO t121t_estado_registros (id,codigo,descripcion) VALUES (2,'2','INACTIVO');
INSERT INTO t121t_estado_registros (id,codigo,descripcion) VALUES (3,'3','ELIMINADO');

INSERT INTO t155t_roles (id,codigo,descripcion,name) VALUES (1,1,'USUARIO','ROLE_USER');
INSERT INTO t155t_roles (id,codigo,descripcion,name) VALUES (2,2,'MODERADOR','ROLE_MODERATOR');
INSERT INTO t155t_roles (id,codigo,descripcion,name) VALUES (3,3,'ADMINISTRADOR','ROLE_ADMIN');


----------


CREATE TABLE `t040t_compania` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(4) NOT NULL COMMENT 'Código de la compañiia',
  `nit` int(11) NOT NULL COMMENT 'Nit de la compañiia',
  `dv` int(2) NOT NULL COMMENT 'Dígito de verificación de la compañiia',
  `nombre_corto` varchar(256) NOT NULL COMMENT 'Nombre corto de la compañiia',
  `nombre_largo` varchar(256) NOT NULL COMMENT 'Nombre largo de la compañiia',
  `sigla` varchar(32) NOT NULL COMMENT 'Sigla de la compañiia',
  `fecha` date NOT NULL COMMENT 'Fecha de la compañiia',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los datos de la compañia.';

INSERT INTO t040t_compania (id,codigo,nit,dv,nombre_corto,nombre_largo,sigla,fecha) 
VALUES (1,'1',123456789,1,'MyCompany','MyCompanyLarge','MC','2022-12-28');
--CTS

CREATE TABLE `t121t_estado_registros` (
  `id` int(11) NOT NULL COMMENT 'Consecutivo único del registro',
  `codigo` varchar(4) NOT NULL COMMENT 'Código del estado',
  `descripcion` varchar(32) NOT NULL COMMENT 'Descripción del estado',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los estados de los registros.';

INSERT INTO t121t_estado_registros (id,codigo,descripcion) VALUES (1,'1','ACTIVO');
INSERT INTO t121t_estado_registros (id,codigo,descripcion) VALUES (2,'2','INACTIVO');
INSERT INTO t121t_estado_registros (id,codigo,descripcion) VALUES (3,'3','ELIMINADO');


CREATE TABLE `t140t_empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de la empresa',
  `nit` int(11) NOT NULL COMMENT 'Nit de la empresa',
  `dv` int(11) NOT NULL COMMENT 'Dígito de verificación de la empresa',
  `nombre_corto` varchar(128) NOT NULL COMMENT 'Nombre corto de la empresa',
  `nombre_largo` varchar(256) NOT NULL COMMENT 'Nombre largo de la empresa',
  `sigla` varchar(64) NOT NULL COMMENT 'Sigla de la empresa',
  `email` varchar(256) NOT NULL COMMENT 'Email de la empresa',
  `estado_empresa` int(11) NOT NULL COMMENT 'Indica el estado de la empresa (0=Inactivo / 1=Activo )',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_corto_UNIQUE` (`nombre_corto`),
  UNIQUE KEY `nombre_largo_UNIQUE` (`nombre_largo`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena las empresas.';


CREATE TABLE `t150t_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `primer_nombre` varchar(32) NOT NULL COMMENT 'Primer nombre del usuario',
  `segundo_nombre` varchar(32) DEFAULT NULL COMMENT 'Segundo nombre del usuario',
  `primer_apellido` varchar(32) NOT NULL COMMENT 'Primer apellido del usuario',
  `segundo_apellido` varchar(32) DEFAULT NULL COMMENT 'Segundo apellido del usuario',
  `nombre_completo` varchar(128) NOT NULL COMMENT 'Nombre completo del usuario',
  `username` varchar(45) DEFAULT NULL COMMENT 'Username del usuario',
  `password` varchar(256) NOT NULL COMMENT 'Password del usuario',
  `email` varchar(256) NOT NULL COMMENT 'email del usuario',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `idx_t150t_01` (`id_empresa`),
  KEY `idx_t150t_03` (`id_rol`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_t150t_02` FOREIGN KEY (`id_empresa`) REFERENCES `t140t_empresas` (`id`),
  CONSTRAINT `fk_t150t_03` FOREIGN KEY (`id_rol`) REFERENCES `t155t_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los usuarios.';

CREATE TABLE `t155t_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del rol',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción del rol',
  `name` varchar(16) NOT NULL COMMENT 'Tipo del rol',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los roles';

CREATE TABLE `t160t_usuarios_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `id_rol` int(11) NOT NULL COMMENT 'Identificador del rol',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t160t_01` (`id_empresa`),
  KEY `idx_t160t_02` (`id_usuario`),
  KEY `idx_t160t_03` (`id_rol`),
  CONSTRAINT `fk_t160t_01` FOREIGN KEY (`id_empresa`) REFERENCES `t140t_empresas` (`id`),
  CONSTRAINT `fk_t160t_02` FOREIGN KEY (`id_usuario`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t160t_03` FOREIGN KEY (`id_rol`) REFERENCES `t155t_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los roles por usuarios.';


CREATE TABLE `t225e_empresas_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `nombre_persona_juridica` varchar(128) NOT NULL COMMENT 'Nombre de la persona jurídica',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t225e_01` (`id_empresa`),
  KEY `idx_t225e_02` (`id_usuario_creacion`),
  KEY `idx_t225e_03` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t225e_01` FOREIGN KEY (`id_empresa`) REFERENCES `t140t_empresas` (`id`),
  CONSTRAINT `fk_t225e_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t225e_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información las empresas.';



CREATE TABLE `t045t_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_compania` int(11) NOT NULL,
  `logo` varchar(1024) NOT NULL COMMENT 'Logo de la compañia',
  `noticias` varchar(1024) NOT NULL COMMENT 'Noticias de la compañia',
  `contexto` varchar(1024) NOT NULL COMMENT 'Contexto de la compañia',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t045t_02` (`id_usuario_creacion`),
  KEY `idx_t045t_03` (`id_usuario_modificacion`),
  KEY `idx_t045t_01` (`id_compania`),
  CONSTRAINT `fk_t045t_01` FOREIGN KEY (`id_compania`) REFERENCES `t040t_compania` (`id`),
  CONSTRAINT `fk_t045t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t045t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los datos actuales que se muestan en el web site de la compañia.';

CREATE TABLE `t046t_website_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `logo` varchar(1024) NOT NULL COMMENT 'Logo de la compañia',
  `noticias` varchar(1024) NOT NULL COMMENT 'Noticias de la compañia',
  `contexto` varchar(1024) NOT NULL COMMENT 'Contexto de la compañia',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t046t_02` (`id_usuario_creacion`),
  KEY `idx_t046t_03` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t046t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t046t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los datos historicos que se han mostrado en el web site de la compañia.';


------

CREATE TABLE `t130t_monedas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de la moneda',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción de la moneda',
  `simbolo` varchar(8) NOT NULL COMMENT 'Símbolo de la moneda',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t130t_01` (`id_estado_registro`),
  KEY `idx_t130t_02` (`id_usuario_creacion`),
  KEY `idx_t130t_03` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t130t_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t130t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t130t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena las monedas.';

CREATE TABLE `t132t_magnitudes_medidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de la magnitud de medida',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción de la magnitud de medida',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t132t_01` (`id_estado_registro`),
  KEY `idx_t132t_02` (`id_usuario_creacion`),
  KEY `idx_t132t_03` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t132t_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t132t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t132t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena las magnitudes de medidas.';

CREATE TABLE `t133t_unidades_medidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de la unidad de medida',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción de la unidad de medida',
  `id_magnitud_medida` int(11) NOT NULL COMMENT 'Identificador del tipo de magnitud de medida',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t133t_01` (`id_estado_registro`),
  KEY `idx_t133t_02` (`id_usuario_creacion`),
  KEY `idx_t133t_03` (`id_usuario_modificacion`),
  KEY `idx_t133t_10` (`id_magnitud_medida`),
  CONSTRAINT `fk_t133t_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t133t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t133t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t133t_10` FOREIGN KEY (`id_magnitud_medida`) REFERENCES `t132t_magnitudes_medidas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena las unidades de medidas.';




CREATE TABLE `t162t_paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del del país',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del país',
  `codigo_dane` varchar(32) NOT NULL COMMENT 'Código DANE del país',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_dane_UNIQUE` (`codigo_dane`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `idx_t162t_01` (`id_estado_registro`),
  KEY `idx_t162t_02` (`id_usuario_creacion`),
  KEY `idx_t162t_03` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t162t_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t162t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t162t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los países.';

CREATE TABLE `t165t_departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Códgio del departamento (o estado)',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del departamento (o estado)',
  `codigo_dane` varchar(16) NOT NULL COMMENT 'Código DANE del departamento (o estado)',
  `id_pais` int(11) NOT NULL COMMENT 'Identificador del país',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`descripcion`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `codigo_dane_UNIQUE` (`codigo_dane`),
  KEY `idx_t165t_01` (`id_estado_registro`),
  KEY `idx_t165t_02` (`id_usuario_creacion`),
  KEY `idx_t165t_03` (`id_usuario_modificacion`),
  KEY `idx_t165t_04` (`id_pais`),
  CONSTRAINT `fk_t165t_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t165t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t165t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t165t_04` FOREIGN KEY (`id_pais`) REFERENCES `t162t_paises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los departamentos (o estados).';

CREATE TABLE `t168t_municipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de la ciudad (o municipio)',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripcion de la ciudad (o municipio)',
  `codigo_dane` varchar(16) NOT NULL COMMENT 'Código DANE de la ciudad (o municipio)',
  `id_departamento` int(11) NOT NULL COMMENT 'Identificador del departaemnto (o estado)',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_dane_UNIQUE` (`codigo_dane`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `idx_t168t_01` (`id_estado_registro`),
  KEY `idx_t168t_02` (`id_usuario_creacion`),
  KEY `idx_t168t_03` (`id_usuario_modificacion`),
  KEY `idx_t168t_04` (`id_departamento`),
  CONSTRAINT `fk_t168t_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t168t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t168t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t168t_04` FOREIGN KEY (`id_departamento`) REFERENCES `t165t_departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información las ciudades (o municipios).';

CREATE TABLE `t171t_tipos_terceros` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del tipo de tercero',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del tipo de tercero',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t171t_01` (`id_estado_registro`),
  KEY `idx_t171t_02` (`id_usuario_creacion`),
  KEY `idx_t171t_03` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t171t_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t171t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t171t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los tipos de terceros.';

CREATE TABLE `t174t_tipos_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del tipo de documento',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del tipo de documento',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `idx_t174t_01` (`id_estado_registro`),
  KEY `idx_t174t_02` (`id_usuario_creacion`),
  KEY `idx_t174t_03` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t174t_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t174t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t174t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los tipos de documentos.';

CREATE TABLE `t181t_paises_monedas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_pais` int(11) NOT NULL COMMENT 'Identificación del país',
  `id_moneda` int(11) NOT NULL COMMENT 'Identificación de la moneda',
  `moneda_principal` int(11) NOT NULL COMMENT 'Indíca si es la moneda principal del pais (0=No / 1=Si)',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pai_id_mon_UNIQUE` (`id_pais`,`id_moneda`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t181t_01` (`id_estado_registro`),
  KEY `idx_t181t_02` (`id_usuario_creacion`),
  KEY `idx_t181t_03` (`id_usuario_modificacion`),
  KEY `idx_t181t_10` (`id_pais`),
  KEY `idx_t181t_11` (`id_moneda`),
  CONSTRAINT `fk_t181t_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t181t_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t181t_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t181t_10` FOREIGN KEY (`id_pais`) REFERENCES `t162t_paises` (`id`),
  CONSTRAINT `fk_t181t_11` FOREIGN KEY (`id_moneda`) REFERENCES `t130t_monedas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información las monedas que se usan en el país.';


CREATE TABLE `t512m_grupo_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del grupo de productos',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción del grupo de productos',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t512m_01` (`id_estado_registro`),
  KEY `idx_t512m_02` (`id_empresa`),
  KEY `idx_t512m_03` (`id_usuario_creacion`),
  KEY `idx_t512m_04` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t512m_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t512m_02` FOREIGN KEY (`id_empresa`) REFERENCES `t140t_empresas` (`id`),
  CONSTRAINT `fk_t512m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t512m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los grupos de productos.';

CREATE TABLE `t515m_subgrupo_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del subgrupo de productos',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción del subgrupo de productos',
  `id_grupo_producto` int(11) NOT NULL COMMENT 'Identificador del grupo de producto',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t515m_01` (`id_estado_registro`),
  KEY `idx_t515m_03` (`id_usuario_creacion`),
  KEY `idx_t515m_04` (`id_usuario_modificacion`),
  KEY `idx_t515m_10` (`id_grupo_producto`),
  CONSTRAINT `fk_t515m_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t515m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t515m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t515m_10` FOREIGN KEY (`id_grupo_producto`) REFERENCES `t512m_grupo_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los subgrupos de productos.';

CREATE TABLE `t518m_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código el producto',
  `nombre_corto` varchar(64) NOT NULL COMMENT 'Nombre corto del producto',
  `nombre_largo` varchar(128) NOT NULL COMMENT 'Nombre largo del producto',
  `ruta_imagen` varchar(512) DEFAULT NULL COMMENT 'Ruta de la imagen grande',
  `nombre_imagen` varchar(128) DEFAULT NULL COMMENT 'Ruta de la imagen mediana',
  `id_subgrupo_producto` int(11) NOT NULL COMMENT 'Identificador del subgrupo de producto',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_corto_UNIQUE` (`nombre_corto`),
  UNIQUE KEY `nombre_largo_UNIQUE` (`nombre_largo`),
  UNIQUE KEY `ruta_imagen_g_UNIQUE` (`ruta_imagen`),
  UNIQUE KEY `ruta_imagen_m_UNIQUE` (`nombre_imagen`),
  KEY `idx_t518m_01` (`id_estado_registro`),
  KEY `idx_t518m_03` (`id_usuario_creacion`),
  KEY `idx_t518m_04` (`id_usuario_modificacion`),
  KEY `idx_t518m_10` (`id_subgrupo_producto`),
  CONSTRAINT `fk_t518m_01` FOREIGN KEY (`id_estado_registro`) REFERENCES `t121t_estado_registros` (`id`),
  CONSTRAINT `fk_t518m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t518m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t150t_usuarios` (`id`),
  CONSTRAINT `fk_t518m_10` FOREIGN KEY (`id_subgrupo_producto`) REFERENCES `t512m_grupo_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los productos.';
