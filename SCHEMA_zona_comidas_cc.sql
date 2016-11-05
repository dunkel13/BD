DROP SCHEMA IF EXISTS `zona comidas cc` ;
CREATE SCHEMA IF NOT EXISTS `zona comidas cc`;
USE `zona comidas cc` ;

-- -----------------------------------------------------
-- Table `CENTRO COMERCIAL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CENTRO COMERCIAL` ;

CREATE TABLE IF NOT EXISTS `CENTRO COMERCIAL` (
  `CCO_id` VARCHAR(10) NOT NULL DEFAULT '1-cco',
  `CCO_nombre` VARCHAR(70) NOT NULL,
  `CCO_direccion` VARCHAR(70) NOT NULL,
  `CCO_ciudad` VARCHAR(45) NOT NULL,
  `CCO_telefono` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CCO_id`))
ENGINE = InnoDB;

-- -------------------------
-- DATOS TABLA CENTRO COMERCIAL
-- -------------------------

INSERT INTO `CENTRO COMERCIAL` VALUES ('1-cco','Centro comercial Plaza de las Americas','Transv. 71D No. 26-94 Sur','BOGOTA','446-7575');
INSERT INTO `CENTRO COMERCIAL` VALUES ('2-cco','Centro Comercial Andino','Carrera 11 # 82 -71','BOGOTA','812-2402');
INSERT INTO `CENTRO COMERCIAL` VALUES ('3-cco','Centro Comercial Atlantis','Calle 81 Carrera 14','BOGOTA','988-4963');
INSERT INTO `CENTRO COMERCIAL` VALUES ('4-cco','Centro Comercial Avenida Chile','Avenida Chile Cl 72 No.10-34','BOGOTA','134-0211');
INSERT INTO `CENTRO COMERCIAL` VALUES ('5-cco','Centro Comercial Cedritos 151','Calle 151 No. 16-56','BOGOTA','753-4321');
INSERT INTO `CENTRO COMERCIAL` VALUES ('6-cco','Centro Comercial Gran Estacion','Calle 26 No. 62-49','BOGOTA','835-6656');
INSERT INTO `CENTRO COMERCIAL` VALUES ('7-cco','Centro Comercial Iserra 100','Calle 100 Av Suba','BOGOTA','788-3806');
INSERT INTO `CENTRO COMERCIAL` VALUES ('8-cco','Centro Comercial Portal 80','Transversal 100 A No. 80 A-20','BOGOTA','784-7096');
INSERT INTO `CENTRO COMERCIAL` VALUES ('9-cco','Centro Comercial Santa Barbara','Carrera Séptima No. 115 - 60','BOGOTA','429-1835');
INSERT INTO `CENTRO COMERCIAL` VALUES ('10-cco','Centro Comercial Santa Fe','Calle 183 No. 45 - 03','BOGOTA','104-1538');

-- -----------------------------------------------------
-- Table `BANCA RESTAURANTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BANCA RESTAURANTE` ;

CREATE TABLE IF NOT EXISTS `BANCA RESTAURANTE` (
  `BANRES_id` VARCHAR(25) NOT NULL,
  `BANRES_estadoCuenta` SET('ACTIVA','INACTIVA','ANULADA','MORA') NOT NULL DEFAULT 'INACTIVA',
  `BANRES_saldo` DOUBLE NOT NULL,
  PRIMARY KEY (`BANRES_id`))
ENGINE = InnoDB;

-- ------------------
-- DATOS TABLA  BANCA RESTAURANTE
-- ------------------

INSERT INTO `BANCA RESTAURANTE` VALUES ('511298 .9629340132','ACTIVA',6970600);
INSERT INTO `BANCA RESTAURANTE` VALUES ('512466 .5124467838','ACTIVA',75616205);
INSERT INTO `BANCA RESTAURANTE` VALUES ('5128 .0982 .2020 .5561','ACTIVA',50956457);
INSERT INTO `BANCA RESTAURANTE` VALUES ('5131 .8331 .3230 .1941','ACTIVA',29798792);
INSERT INTO `BANCA RESTAURANTE` VALUES ('514346 .148111 .7084','ACTIVA',18622706);
INSERT INTO `BANCA RESTAURANTE` VALUES ('514358 .3669267462','ACTIVA',10140368);
INSERT INTO `BANCA RESTAURANTE` VALUES ('514972 .572377 .0783','ACTIVA',64824208);
INSERT INTO `BANCA RESTAURANTE` VALUES ('5150 .1668 .8704 .6569','ACTIVA',28945231);
INSERT INTO `BANCA RESTAURANTE` VALUES ('515902 .033042 .5907','ACTIVA',26292721);
INSERT INTO `BANCA RESTAURANTE` VALUES ('516 .21302 .21064 .775','ACTIVA',61505782);
INSERT INTO `BANCA RESTAURANTE` VALUES ('5175 .4838 .6102 .4590','ACTIVA',74996514);
INSERT INTO `BANCA RESTAURANTE` VALUES ('517945 .3709761022','ACTIVA',59446053);
INSERT INTO `BANCA RESTAURANTE` VALUES ('519002 .0252984122','ACTIVA',66142059);
INSERT INTO `BANCA RESTAURANTE` VALUES ('5192 .5428 .2768 .8332','ACTIVA',88369237);
INSERT INTO `BANCA RESTAURANTE` VALUES ('519776 .7635729797','ACTIVA',12351379);
INSERT INTO `BANCA RESTAURANTE` VALUES ('520 .23700 .28713 .982','ACTIVA',66789008);
INSERT INTO `BANCA RESTAURANTE` VALUES ('520 .51699 .99614 .600','ACTIVA',91745545);
INSERT INTO `BANCA RESTAURANTE` VALUES ('520 .78340 .78095 .041','ACTIVA',3758788);
INSERT INTO `BANCA RESTAURANTE` VALUES ('5207 .3632 .2653 .0543','INACTIVA',6103383);
INSERT INTO `BANCA RESTAURANTE` VALUES ('521 .66043 .18351 .622','INACTIVA',35557292);
INSERT INTO `BANCA RESTAURANTE` VALUES ('521975 .3258345990','INACTIVA',86768291);
INSERT INTO `BANCA RESTAURANTE` VALUES ('522519 .941317 .3004','INACTIVA',53975215);
INSERT INTO `BANCA RESTAURANTE` VALUES ('522646 .6025361320','INACTIVA',29317970);
INSERT INTO `BANCA RESTAURANTE` VALUES ('523 .72934 .59725 .243','INACTIVA',76207683);
INSERT INTO `BANCA RESTAURANTE` VALUES ('523064 .340668 .5444','INACTIVA',9186197);
INSERT INTO `BANCA RESTAURANTE` VALUES ('524 .47544 .81747 .902','INACTIVA',33779777);
INSERT INTO `BANCA RESTAURANTE` VALUES ('524097 .013441 .0011','INACTIVA',20764717);
INSERT INTO `BANCA RESTAURANTE` VALUES ('5248 .3372 .3268 .8298','INACTIVA',87164885);

-- -----------------------------------------------------
-- Table `RESTAURANTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RESTAURANTE` ;

CREATE TABLE IF NOT EXISTS `RESTAURANTE` (
  `RES_nit` VARCHAR(18) NOT NULL DEFAULT '111.111.111-1-res',
  `CENTRO COMERCIAL_CCO_id` VARCHAR(10) NOT NULL,
  `RES_nombre` VARCHAR(70) NOT NULL,
  `RES_local` VARCHAR(5) NOT NULL,
  `RES_telefono` VARCHAR(20) NOT NULL,
  `BANCA RESTAURANTE_BANRES_id` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`RES_nit`, `CENTRO COMERCIAL_CCO_id`),
  CONSTRAINT `fk_RESTAURANTE_CENTRO COMERCIAL1`
    FOREIGN KEY (`CENTRO COMERCIAL_CCO_id`)
    REFERENCES `CENTRO COMERCIAL` (`CCO_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_RESTAURANTE_BANCA RESTAURANTE1`
    FOREIGN KEY (`BANCA RESTAURANTE_BANRES_id`)
    REFERENCES `BANCA RESTAURANTE` (`BANRES_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -------------------
-- DATOS TABLA RESTAURANTE
-- -------------------

INSERT INTO restaurante VALUES ('858180-4906','8-cco','Frisby','114','663-8263','511298 .9629340132');
INSERT INTO restaurante VALUES ('236775-8162','8-cco','JenosPizza','116','776-3404','512466 .5124467838');
INSERT INTO restaurante VALUES ('102738-9566','8-cco','Joshua','138','439-5939','5128 .0982 .2020 .5561');
INSERT INTO restaurante VALUES ('764721-1502','8-cco','kaldivia','128','701-0133','5131 .8331 .3230 .1941');
INSERT INTO restaurante VALUES ('453020-0759','8-cco','KFC','135','729-9236','514346 .148111 .7084');
INSERT INTO restaurante VALUES ('484978-8957','8-cco','LaPonderosa','142','835-1983','514358 .3669267462');
INSERT INTO restaurante VALUES ('152350-1730','8-cco','MCDonalds','131','740-1516','514972 .572377 .0783');
INSERT INTO restaurante VALUES ('443809-1581','8-cco','MisterLee','143','305-2544','5150 .1668 .8704 .6569');
INSERT INTO restaurante VALUES ('197775-5402','8-cco','Mongolian','126','847-9350','515902 .033042 .5907');
INSERT INTO restaurante VALUES ('548113-8351','8-cco','Nicolukas','132','278-1237','516 .21302 .21064 .775');
INSERT INTO restaurante VALUES ('189704-9902','8-cco','Picos&Cafe','118','139-1769','5175 .4838 .6102 .4590');
INSERT INTO restaurante VALUES ('365305-8820','8-cco','Popsy','148','931-2449','517945 .3709761022');
INSERT INTO restaurante VALUES ('064687-9361','8-cco','Presto','139','208-9858','519002 .0252984122');
INSERT INTO restaurante VALUES ('943450-4933','8-cco','Qbano','140','653-5397','5192 .5428 .2768 .8332');
INSERT INTO restaurante VALUES ('547685-5746','8-cco','Sandwich Gourmet','134','385-5769','519776 .7635729797');
INSERT INTO restaurante VALUES ('862372-3395','8-cco','SubWay','104','054-4577','520 .23700 .28713 .982');
INSERT INTO restaurante VALUES ('018955-8604','8-cco','tacos barBQ','136','754-2491','520 .51699 .99614 .600');
INSERT INTO restaurante VALUES ('565293-4976','8-cco','temaki','112','437-3077','520 .78340 .78095 .041');

-- -----------------------------------------------------
-- Table `MENU`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MENU` ;

CREATE TABLE IF NOT EXISTS `MENU` (
  `MEN_id` VARCHAR(10) NOT NULL DEFAULT '1-men',
  `MEN_nombre` VARCHAR(60) NOT NULL,
  `MEN_tipo` SET('COMIDA','BEBIDA','POSTRE','COMBO','OTRO') NOT NULL,
  `MEN_tamano` SET('PERSONAL', 'FAMILIAR', 'INFANTIL', 'NORMAL', 'ESPECIAL', 'GRANDE', 'MEDIANO', 'PEQUEÑO') NOT NULL,
  `MEN_precio` DOUBLE NOT NULL,
  `MEN_descripcion` VARCHAR(500) NOT NULL,
  `RES_imagen` VARCHAR(100) NOT NULL,
  `RESTAURANTE_RES_nit` VARCHAR(18) NOT NULL,
  `RESTAURANTE_CENTRO COMERCIAL_CCO_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`MEN_id`),
  CONSTRAINT `fk_MENU_RESTAURANTE1`
    FOREIGN KEY (`RESTAURANTE_RES_nit` , `RESTAURANTE_CENTRO COMERCIAL_CCO_id`)
    REFERENCES `RESTAURANTE` (`RES_nit` , `CENTRO COMERCIAL_CCO_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- --------------------
-- DATOS TABLA MENU
-- --------------------

INSERT INTO menu VALUES ('5084-men','Pizza gigante','COMIDA','ESPECIAL',23250,'12 porciones','null','236775-8162','8-cco');
INSERT INTO menu VALUES ('6478-men','Lasagna pollo y champiñones','COMIDA','NORMAL',18900,'Lasagna pollo y champiñones en salsa bechamel o salsa bolognesa','null','236775-8162','8-cco');
INSERT INTO menu VALUES ('2866-men','Pizza hawaiana','COMIDA','NORMAL',15900,'cubitos de piña y jamon','null','236775-8162','8-cco');
INSERT INTO menu VALUES ('5038-men','Medio frisby apanado','COMIDA','NORMAL',16700,'4 presas de pollo apanado, crocantes, jugosas y deliciosas, acompañadsa de 6 arepas y miel','null','858180-4906','8-cco');
INSERT INTO menu VALUES ('9292-men','Frispicada','COMIDA','NORMAL',41900,'10 Nuggets, 12 Tornados de pechuga de pollo, 10 alitas apanadas (una alita equivale a un trozo de ala), 10 croquetas de yuca, 5 trozos de mazorca dulce, 8 arepas y salsa','null','236775-8162','8-cco');
INSERT INTO menu VALUES ('6701-men','Frisburrito','COMIDA','NORMAL',7000,'Con un toque mexicano, disfruta un delicioso frisburrito ranch, mexicano o BBQ','null','102738-9566','8-cco');
INSERT INTO menu VALUES ('9957-men','Super especial','COMIDA','ESPECIAL',15700,'Jamón, jamonada, jamón de cordero (contiene cerdo), salami, tomate, queso mozzarella, lechuga y salsa de la casa.','null','943450-4933','8-cco');
INSERT INTO menu VALUES ('9326-men','Ropa vieja','COMIDA','NORMAL',17700,'Carne desmechada, queso amarillo, lechuga, tomate, pimentón, apio, mostaza, salsa bbq, pasta de tomate, cebolla roja y salsa de la casa.','null','547685-5746','8-cco');
INSERT INTO menu VALUES ('8387-men','Philadelphia','COMIDA','NORMAL',18700,'Lomo de res, queso cheddar, cebolla asadas, salsa de la casa','null','862372-3395','8-cco');
INSERT INTO menu VALUES ('4206-men','Arroz frito sencillo','COMIDA','NORMAL',8000,'Combinación de arroz frito con verduras','null','443809-1581','8-cco');
INSERT INTO menu VALUES ('6568-men','Arroz mixto camaron','COMIDA','NORMAL',20900,'Arroz frito mixto, acompañados de porción de camarones','null','197775-5402','8-cco');
INSERT INTO menu VALUES ('9402-men','Combo cerdo agridulce','COMBO','PERSONAL',17300,'Cerdo agridulce, arroz sencillo, egg roll, coca cola tamaño personal para domicilio','null','548113-8351','8-cco');
INSERT INTO menu VALUES ('7755-men','Pollo teriyaki','COMIDA','NORMAL',15300,'','null','189704-9902','8-cco');
INSERT INTO menu VALUES ('2113-men','Mega 8','COMBO','FAMILIAR',29900,'8 presas y 10 arepas','null','453020-0759','8-cco');
INSERT INTO menu VALUES ('6404-men','Pop corn mediano','COMIDA','NORMAL',10400,'1 pop corn 06 onz','null','484978-8957','8-cco');
INSERT INTO menu VALUES ('2853-men','Combo casero lenteja II','COMBO','PERSONAL',13400,'Arroz, sopa, ensalada de campo, 2 presas, lentejas','null','152350-1730','8-cco');
INSERT INTO menu VALUES ('7567-men','Big box pop','COMBO','PERSONAL',17400,'1 Pop corn 4 oz, 1 papas pequeñas, 5 alitas picantes (Las alitas picantes (Hot Wings) equivalen a un trozo de ala), 1 ensalada mediana, 1 salsa snack 2 oz, 1 gaseosa en lata, 1 Chocolatina Jet Pequeña','null','443809-1581','8-cco');

-- -----------------------------------------------------
-- Table `BANCA CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BANCA CLIENTE` ;

CREATE TABLE IF NOT EXISTS `BANCA CLIENTE` (
  `BANCLI_id` VARCHAR(25) NOT NULL,
  `BANCLI_estadoCuenta` SET('ACTIVA','INACTIVA','ANULADA','MORA') NOT NULL DEFAULT 'INACTIVA',
  `BANCLI_saldo` DOUBLE NOT NULL,
  PRIMARY KEY (`BANCLI_id`))
ENGINE = InnoDB;

-- ---------------
-- DATOS BANCA CLIENTES
-- ---------------

INSERT INTO `BANCA CLIENTE` VALUES ('3668 .557328 .3039','ACTIVA',12016);
INSERT INTO `BANCA CLIENTE` VALUES ('3611 .016401 .8348','ACTIVA',53975);
INSERT INTO `BANCA CLIENTE` VALUES ('3646 .131900 .2061','ACTIVA',18165);
INSERT INTO `BANCA CLIENTE` VALUES ('3662 .932738 .4701','ACTIVA',12560);
INSERT INTO `BANCA CLIENTE` VALUES ('3621 .018182 .6036','ACTIVA',5625);
INSERT INTO `BANCA CLIENTE` VALUES ('3626 .759406 .8549','ACTIVA',57058);
INSERT INTO `BANCA CLIENTE` VALUES ('3618 .652764 .7189','ACTIVA',30996);
INSERT INTO `BANCA CLIENTE` VALUES ('3644 .640034 .6469','ACTIVA',45588);
INSERT INTO `BANCA CLIENTE` VALUES ('3606 .621661 .1045','ACTIVA',32743);
INSERT INTO `BANCA CLIENTE` VALUES ('3684 .828209 .0109','ACTIVA',97212);
INSERT INTO `BANCA CLIENTE` VALUES ('3696 .016450 .1713','ACTIVA',74472);
INSERT INTO `BANCA CLIENTE` VALUES ('3632 .678091 .9905','ACTIVA',27087);
INSERT INTO `BANCA CLIENTE` VALUES ('3653 .059474 .9917','ACTIVA',46310);
INSERT INTO `BANCA CLIENTE` VALUES ('3611 .119842 .8578','ACTIVA',83222);
INSERT INTO `BANCA CLIENTE` VALUES ('3683 .920678 .0917','ACTIVA',83552);
INSERT INTO `BANCA CLIENTE` VALUES ('3625 .191692 .6709','ACTIVA',97900);
INSERT INTO `BANCA CLIENTE` VALUES ('3600 .539162 .1247','ACTIVA',65453);
INSERT INTO `BANCA CLIENTE` VALUES ('3667 .973765 .0118','ACTIVA',9701);
INSERT INTO `BANCA CLIENTE` VALUES ('3627 .760217 .2845','ACTIVA',14596);
INSERT INTO `BANCA CLIENTE` VALUES ('3644 .418778 .7807','ACTIVA',56017);
INSERT INTO `BANCA CLIENTE` VALUES ('3615 .333005 .0563','ACTIVA',34112);
INSERT INTO `BANCA CLIENTE` VALUES ('3610 .190212 .8614','ACTIVA',93969);
INSERT INTO `BANCA CLIENTE` VALUES ('3690 .977289 .0646','ACTIVA',93340);
INSERT INTO `BANCA CLIENTE` VALUES ('3660 .045630 .7417','ACTIVA',79686);
INSERT INTO `BANCA CLIENTE` VALUES ('3600 .317974 .6799','ACTIVA',52974);
INSERT INTO `BANCA CLIENTE` VALUES ('3687 .641251 .3005','ACTIVA',14558);
INSERT INTO `BANCA CLIENTE` VALUES ('3684 .151360 .0705','ACTIVA',76655);
INSERT INTO `BANCA CLIENTE` VALUES ('3679 .087233 .9498','ACTIVA',15097);
INSERT INTO `BANCA CLIENTE` VALUES ('3606 .690761 .1064','ACTIVA',12492);
INSERT INTO `BANCA CLIENTE` VALUES ('3604 .811561 .7612','ACTIVA',87597);
INSERT INTO `BANCA CLIENTE` VALUES ('3674 .322705 .2498','ACTIVA',37121);
INSERT INTO `BANCA CLIENTE` VALUES ('3600 .006879 .6984','ACTIVA',69352);
INSERT INTO `BANCA CLIENTE` VALUES ('3689 .226407 .0580','ACTIVA',37528);
INSERT INTO `BANCA CLIENTE` VALUES ('3689 .935965 .0036','ACTIVA',28038);
INSERT INTO `BANCA CLIENTE` VALUES ('3693 .647976 .5607','ACTIVA',30770);
INSERT INTO `BANCA CLIENTE` VALUES ('3680 .659213 .3753','ACTIVA',10140);
INSERT INTO `BANCA CLIENTE` VALUES ('3649 .602647 .6117','ACTIVA',96531);
INSERT INTO `BANCA CLIENTE` VALUES ('3685 .176132 .4239','ACTIVA',90650);
INSERT INTO `BANCA CLIENTE` VALUES ('3645 .857833 .1652','ACTIVA',73196);
INSERT INTO `BANCA CLIENTE` VALUES ('3670 .659801 .7366','ACTIVA',65553);
INSERT INTO `BANCA CLIENTE` VALUES ('3604 .252878 .4739','ACTIVA',61155);
INSERT INTO `BANCA CLIENTE` VALUES ('3604 .077345 .0071','ACTIVA',57433);
INSERT INTO `BANCA CLIENTE` VALUES ('3613 .720080 .3243','ACTIVA',18656);
INSERT INTO `BANCA CLIENTE` VALUES ('3605 .482280 .3743','ACTIVA',9220);
INSERT INTO `BANCA CLIENTE` VALUES ('3667 .966517 .5625','ACTIVA',95393);
INSERT INTO `BANCA CLIENTE` VALUES ('3660 .491731 .3774','ACTIVA',55338);
INSERT INTO `BANCA CLIENTE` VALUES ('3608 .377125 .4905','ACTIVA',31177);
INSERT INTO `BANCA CLIENTE` VALUES ('3630 .858455 .4039','ACTIVA',22460);
INSERT INTO `BANCA CLIENTE` VALUES ('3609 .570348 .7825','ACTIVA',98526);
INSERT INTO `BANCA CLIENTE` VALUES ('3679 .697202 .7362','ACTIVA',17814);
INSERT INTO `BANCA CLIENTE` VALUES ('3676 .295812 .9408','ACTIVA',73423);
INSERT INTO `BANCA CLIENTE` VALUES ('3625 .098948 .6906','ACTIVA',31086);
INSERT INTO `BANCA CLIENTE` VALUES ('3696 .461405 .7839','ACTIVA',61738);
INSERT INTO `BANCA CLIENTE` VALUES ('3627 .324180 .3775','ACTIVA',84864);

-- -----------------------------------------------------
-- Table `CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CLIENTE` ;

CREATE TABLE IF NOT EXISTS `CLIENTE` (
  `CLI_id` VARCHAR(10) NOT NULL DEFAULT '1-cli',
  `CLI_usuario` VARCHAR(50) NOT NULL DEFAULT 'user1',
  `CLI_contrasena` VARCHAR(50) NOT NULL,
  `CLI_nombre` VARCHAR(60) NOT NULL,
  `CLI_email` VARCHAR(70) NOT NULL,
  `CLI_fechaCumpleanos` DATE NULL,
  `BANCA VIRTUAL_BAN_id` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`CLI_id`),
  CONSTRAINT `fk_CLIENTE_BANCA VIRTUAL1`
    FOREIGN KEY (`BANCA VIRTUAL_BAN_id`)
    REFERENCES `BANCA CLIENTE` (`BANCLI_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ---------------------
-- Datos tabla CLIENTES
-- ---------------------

INSERT INTO cliente VALUES ('1-cli','Zache','QVX27KUO4FF','Zachery Molina','zachery.molina@gmail.com','1984/10/03','3668 .557328 .3039');
INSERT INTO cliente VALUES ('2-cli','Elain','PIP77RSD8ZW','Elaine R. Potter','elaine.potter@gmail.com','1972/05/04','3611 .016401 .8348');
INSERT INTO cliente VALUES ('3-cli','Nayda','NDX35SBG1OX','Nayda N. Hopkins','nayda.hopkins@gmail.com','1992/05/03','3646 .131900 .2061');
INSERT INTO cliente VALUES ('4-cli','Nicol','VQH26FWH3XR','Nicole Y. Joyner','nicole.joyner@gmail.com','1969/01/14','3662 .932738 .4701');
INSERT INTO cliente VALUES ('5-cli','Yvonn','BJG26AOY5ZY','Yvonne E. Green','yvonne.green@gmail.com','1971/07/26','3621 .018182 .6036');
INSERT INTO cliente VALUES ('6-cli','Yetta','HEW50QKH3TP','Yetta Dejesus','yetta.dejesus@gmail.com','1960/05/22','3626 .759406 .8549');
INSERT INTO cliente VALUES ('7-cli','Carte','SHP15EMX3BK','Carter Z. Porter','carter.porter@gmail.com','1991/03/18','3618 .652764 .7189');
INSERT INTO cliente VALUES ('8-cli','Eve F','QLA62UPT7JB','Eve Frazier','eve.frazier@gmail.com','1963/05/06','3644 .640034 .6469');
INSERT INTO cliente VALUES ('9-cli','Rogan','NYI62FQD7QF','Rogan Q. Robles','rogan.robles@gmail.com','1989/12/03','3606 .621661 .1045');
INSERT INTO cliente VALUES ('10-cli','Ivory','COM54WKR9PA','Ivory Cochran','ivory.cochran@gmail.com','1991/06/01','3684 .828209 .0109');
INSERT INTO cliente VALUES ('11-cli','Judit','OET07HWJ2DT','Judith T. Carpenter','judith.carpenter@gmail.com','1985/02/18','3696 .016450 .1713');
INSERT INTO cliente VALUES ('12-cli','Chanc','NBX31UZU1GV','Chancellor Delgado','chancellor.delgado@gmail.com','1989/03/02','3632 .678091 .9905');
INSERT INTO cliente VALUES ('13-cli','Keane','NSZ52YSM6HL','Keane B. Skinner','keane.skinner@gmail.com','1995/07/19','3653 .059474 .9917');
INSERT INTO cliente VALUES ('14-cli','Xerxe','INB91IHM0RB','Xerxes R. Bowers','xerxes.bowers@gmail.com','1960/06/20','3611 .119842 .8578');
INSERT INTO cliente VALUES ('15-cli','Keeli','CLV34TXN2BH','Keelie C. Wilder','keelie.wilder@gmail.com','1971/03/10','3683 .920678 .0917');
INSERT INTO cliente VALUES ('16-cli','Leand','LQW13BAJ4IG','Leandra Henry','leandra.henry@gmail.com','1977/03/25','3625 .191692 .6709');
INSERT INTO cliente VALUES ('17-cli','Cally','FZK41HLH6RX','Cally R. Molina','cally.molina@gmail.com','1978/11/24','3600 .539162 .1247');
INSERT INTO cliente VALUES ('18-cli','Calvi','USX37BPO2SD','Calvin Q. Guy','calvin.guy@gmail.com','1960/04/11','3667 .973765 .0118');
INSERT INTO cliente VALUES ('19-cli','Cassi','BKJ45JVQ5EY','Cassidy Bonner','cassidy.bonner@gmail.com','1985/11/30','3627 .760217 .2845');
INSERT INTO cliente VALUES ('20-cli','Ingri','COO15PAK2TW','Ingrid K. Velez','ingrid.velez@gmail.com','1967/09/12','3644 .418778 .7807');
INSERT INTO cliente VALUES ('21-cli','Dunca','ELC81RRF0RC','Duncan Sweeney','duncan.sweeney@gmail.com','1965/11/08','3615 .333005 .0563');
INSERT INTO cliente VALUES ('22-cli','Yen H','TDP84NXB0XU','Yen Harrison','yen.harrison@gmail.com','1990/08/12','3610 .190212 .8614');
INSERT INTO cliente VALUES ('23-cli','Aladd','GXE62MRY2LH','Aladdin Stevens','aladdin.stevens@gmail.com','1984/12/17','3690 .977289 .0646');
INSERT INTO cliente VALUES ('24-cli','Adam ','TZD88VMF4GD','Adam Y. Gilbert','adam.gilbert@gmail.com','1994/06/19','3660 .045630 .7417');
INSERT INTO cliente VALUES ('25-cli','Maite','WCL44YSA5DP','Maite L. Key','maite.key@gmail.com','1960/03/09','3600 .317974 .6799');
INSERT INTO cliente VALUES ('26-cli','Rhian','OZY70VQW5ID','Rhiannon M. Buck','rhiannon.buck@gmail.com','1994/04/22','3687 .641251 .3005');
INSERT INTO cliente VALUES ('27-cli','Dolan','XSZ91MEJ0II','Dolan B. Little','dolan.little@gmail.com','1972/11/30','3684 .151360 .0705');
INSERT INTO cliente VALUES ('28-cli','Gisel','FUU93OQA4DD','Giselle Q. Hebert','giselle.hebert@gmail.com','1960/06/12','3679 .087233 .9498');
INSERT INTO cliente VALUES ('29-cli','Inez ','CXB94HFE7EU','Inez P. Jennings','inez.jennings@gmail.com','1960/01/22','3606 .690761 .1064');
INSERT INTO cliente VALUES ('30-cli','Lucy ','MEV00BPI3AE','Lucy Duke','lucy.duke@gmail.com','1970/01/11','3604 .811561 .7612');
INSERT INTO cliente VALUES ('31-cli','Septe','MXR69ZZV5PK','September G. Conrad','september.conrad@gmail.com','1979/01/12','3674 .322705 .2498');
INSERT INTO cliente VALUES ('32-cli','Raven','KYU26BUX0DK','Raven N. Alvarez','raven.alvarez@gmail.com','1984/01/19','3600 .006879 .6984');
INSERT INTO cliente VALUES ('33-cli','Anjol','OML49CXY3FT','Anjolie Tucker','anjolie.tucker@gmail.com','1978/01/22','3689 .226407 .0580');
INSERT INTO cliente VALUES ('34-cli','Mikay','UTS27HWS5MV','Mikayla Carpenter','mikayla.carpenter@gmail.com','1972/05/17','3689 .935965 .0036');
INSERT INTO cliente VALUES ('35-cli','Beck ','PJV27NOH1DM','Beck Buckner','beck.buckner@gmail.com','1963/01/27','3693 .647976 .5607');
INSERT INTO cliente VALUES ('36-cli','Samue','OVM66HVU6DP','Samuel Nixon','samuel.nixon@gmail.com','1981/10/18','3680 .659213 .3753');
INSERT INTO cliente VALUES ('37-cli','Fritz','ZRA48XLX7UG','Fritz G. Albert','fritz.albert@gmail.com','1985/05/11','3649 .602647 .6117');
INSERT INTO cliente VALUES ('38-cli','Jakee','KPS82NRM6IH','Jakeem Davidson','jakeem.davidson@gmail.com','1994/10/01','3685 .176132 .4239');
INSERT INTO cliente VALUES ('39-cli','Dean ','WET78TLE9DU','Dean Q. Trevino','dean.trevino@gmail.com','1962/05/29','3645 .857833 .1652');
INSERT INTO cliente VALUES ('40-cli','Eaton','YOY71UEM8XS','Eaton W. Spencer','eaton.spencer@gmail.com','1964/05/16','3670 .659801 .7366');
INSERT INTO cliente VALUES ('41-cli','Quinn','BRQ73AYX9YY','Quinn Walls','quinn.walls@gmail.com','1966/10/23','3604 .252878 .4739');
INSERT INTO cliente VALUES ('42-cli','Xavie','IRN86CKF0JJ','Xavier Walters','xavier.walters@gmail.com','1994/08/28','3604 .077345 .0071');
INSERT INTO cliente VALUES ('43-cli','Danie','DWS91QUC4TS','Daniel Y. Holden','daniel.holden@gmail.com','1968/01/06','3613 .720080 .3243');
INSERT INTO cliente VALUES ('44-cli','Kelly','OXP29VIT2YU','Kelly Flores','kelly.flores@gmail.com','1982/10/24','3605 .482280 .3743');
INSERT INTO cliente VALUES ('45-cli','Kaitl','LEE05TWZ6FB','Kaitlin G. Rich','kaitlin.rich@gmail.com','1963/02/10','3667 .966517 .5625');
INSERT INTO cliente VALUES ('46-cli','Adria','XEY97DRD9VR','Adrian Hensley','adrian.hensley@gmail.com','1963/07/07','3660 .491731 .3774');
INSERT INTO cliente VALUES ('47-cli','Echo ','NAM00CFB8ZQ','Echo Snider','echo.snider@gmail.com','1986/05/16','3608 .377125 .4905');
INSERT INTO cliente VALUES ('48-cli','Mallo','YAI21RZQ6RU','Mallory U. Graham','mallory.graham@gmail.com','1970/04/18','3630 .858455 .4039');
INSERT INTO cliente VALUES ('49-cli','Dacey','BQD64DUH5XS','Dacey L. Pennington','dacey.pennington@gmail.com','1990/03/13','3609 .570348 .7825');
INSERT INTO cliente VALUES ('50-cli','Odess','AAR32IAL1UH','Odessa X. Nunez','odessa.nunez@gmail.com','1981/09/11','3679 .697202 .7362');
INSERT INTO cliente VALUES ('51-cli','Lacy ','HEC07OHC2FA','Lacy H. Nielsen','lacy.nielsen@gmail.com','1993/01/29','3676 .295812 .9408');
INSERT INTO cliente VALUES ('52-cli','Madel','BHY86BMU0ZO','Madeline Bates','madeline.bates@gmail.com','1991/06/06','3625 .098948 .6906');
INSERT INTO cliente VALUES ('53-cli','Bruno','MLH98FDM4ZW','Bruno Hubbard','bruno.hubbard@gmail.com','1966/03/22','3696 .461405 .7839');
INSERT INTO cliente VALUES ('54-cli','Lione','VFJ97GYW1JR','Lionel Walker','lionel.walker@gmail.com','1970/09/27','3627 .324180 .3775');

-- -----------------------------------------------------
-- Table ` PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PEDIDO` ;

CREATE TABLE IF NOT EXISTS `PEDIDO` (
  `PED_id` VARCHAR(10) NOT NULL DEFAULT '1-ped',
  `PED_estado` SET('SELECCIONANDO','GENERANDO','HECHO') NOT NULL DEFAULT 'SELECCIONANDO',
  `CLIENTE_CLI_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`PED_id`),
  CONSTRAINT `fk_PEDIDO_CLIENTE1`
    FOREIGN KEY (`CLIENTE_CLI_id`)
    REFERENCES `CLIENTE` (`CLI_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

desc pedido;

-- ------------------
-- DATOS TABLA PEDIDO
-- ------------------

INSERT INTO PEDIDO VALUES ('1-ped','SELECCIONANDO','15-cli');
INSERT INTO PEDIDO VALUES ('2-ped','SELECCIONANDO','20-cli');
INSERT INTO PEDIDO VALUES ('3-ped','SELECCIONANDO','28-cli');
INSERT INTO PEDIDO VALUES ('4-ped','SELECCIONANDO','41-cli');
INSERT INTO PEDIDO VALUES ('5-ped','HECHO','32-cli');
INSERT INTO PEDIDO VALUES ('6-ped','HECHO','32-cli');
INSERT INTO PEDIDO VALUES ('7-ped','HECHO','32-cli');

-- -----------------------------------------------------
-- Table `DETALLE PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DETALLE PEDIDO` ;

CREATE TABLE IF NOT EXISTS `DETALLE PEDIDO` (
  `DPE_fecha` DATETIME NOT NULL,
  `PEDIDO_PED_id` VARCHAR(10) NOT NULL,
  `MENU_MEN_id` VARCHAR(10) NOT NULL,
  `DPE_cantidad` TINYINT NOT NULL,
  `DPE_subtotal` DOUBLE NOT NULL,
  `DPE_notas` VARCHAR(250) NULL,
  PRIMARY KEY (`DPE_fecha`, `PEDIDO_PED_id`),
  CONSTRAINT `fk_PEDIDO_has_MENU_MENU1`
    FOREIGN KEY (`MENU_MEN_id`)
    REFERENCES `MENU` (`MEN_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_DETALLE PEDIDO_PEDIDO1`
    FOREIGN KEY (`PEDIDO_PED_id`)
    REFERENCES `PEDIDO` (`PED_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -------------------
-- DATOS TABLA DETALLE PEDIDO
-- -------------------

INSERT INTO `DETALLE PEDIDO` VALUES ('2016/04/22  16:15:00','1-ped','6701-men',3,21000,'null');
INSERT INTO `DETALLE PEDIDO` VALUES ('2016/04/17  22:59:16','2-ped','7755-men',1,15300,'null');
INSERT INTO `DETALLE PEDIDO` VALUES ('2016/01/07  9:06:53','3-ped','5084-men',6,139500,'null');
INSERT INTO `DETALLE PEDIDO` VALUES ('2016/01/30  3:03:03','4-ped','6404-men',4,41600,'null');
INSERT INTO `DETALLE PEDIDO` VALUES ('2016/06/06  9:09:05','5-ped','9326-men',2,35400,'null');
INSERT INTO `DETALLE PEDIDO` VALUES ('2016/06/06  10:44:05','5-ped','7567-men',4,69600,'null');
INSERT INTO `DETALLE PEDIDO` VALUES ('2016/06/06  11:00:05','5-ped','6701-men',7,49000,'null');

-- -----------------------------------------------------
-- Table `TURNO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TURNO` ;

CREATE TABLE IF NOT EXISTS `TURNO` (
  `TUR_id` VARCHAR(10) NOT NULL DEFAULT '1-tur',
  `TUR_estado` SET('RECOGER','PREPARANDO','OTRO') NOT NULL DEFAULT 'OTRO',
  `TUR_numMesa` TINYINT NOT NULL DEFAULT 1,
  `DETALLE PEDIDO_DPE_fecha` DATETIME NOT NULL,
  `DETALLE PEDIDO_ PEDIDO_PED_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`TUR_id`),
  CONSTRAINT `fk_TURNO_ DETALLE PEDIDO1`
    FOREIGN KEY (`DETALLE PEDIDO_DPE_fecha` , `DETALLE PEDIDO_ PEDIDO_PED_id`)
    REFERENCES `DETALLE PEDIDO` (`DPE_fecha` , `PEDIDO_PED_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

----------------------
-- DATOS TABLA TURNO
----------------------

INSERT INTO TURNO VALUES ('1-tur','OTRO',2,'2016/04/22  16:15:00','1-ped');
INSERT INTO TURNO VALUES ('2-tur','OTRO',1,'2016/04/17  22:59:16','2-ped');
INSERT INTO TURNO VALUES ('3-tur','OTRO',3,'2016/01/07 9:06:53','3-ped');
INSERT INTO TURNO VALUES ('4-tur','OTRO',38,'2016/01/30  3:03:03','4-ped');
INSERT INTO TURNO VALUES ('5-tur','PREPARANDO',57,'2016/06/06  11:00:05','5-ped');
INSERT INTO TURNO VALUES ('7-tur','RECOGER',57,'2016/06/06  11:00:05','5-ped');

-- -----------------------------------------------------
-- Table `PAGO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PAGO` ;

CREATE TABLE IF NOT EXISTS `PAGO` (
  `PAG_id` VARCHAR(10) NOT NULL DEFAULT '1-pag',
  `PAG_estado` SET('NO_PAGADO','ESPERA','APROBADO','NO APROBADO', 'CANCELADO') NOT NULL DEFAULT 'ESPERA',
  PRIMARY KEY (`PAG_id`))
ENGINE = InnoDB;

-----------------
-- DATOS TABLA PAGO
-----------------

INSERT INTO PAGO VALUES ('1-pag','ESPERA');
INSERT INTO PAGO VALUES ('2-pag','ESPERA');
INSERT INTO PAGO VALUES ('3-pag','ESPERA');
INSERT INTO PAGO VALUES ('4-pag','ESPERA');
INSERT INTO PAGO VALUES ('5-pag','APROBADO');

-- -----------------------------------------------------
-- Table `EMPLEADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EMPLEADO` ;

CREATE TABLE IF NOT EXISTS `EMPLEADO` (
  `EMP_id` VARCHAR(10) NOT NULL DEFAULT '1-emp',
  `EMP_nombre` VARCHAR(50) NOT NULL,
  `EMP_cargo` SET('CAJERO','COCINERO','MESERO','OTRO') NOT NULL,
  `EMP_horarioEntrada` VARCHAR(250) NULL,
  `EMP_horarioSalida` VARCHAR(250) NULL,
  `RESTAURANTE_RES_nit` VARCHAR(18) NOT NULL,
  `RESTAURANTE_CENTRO COMERCIAL_CCO_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`EMP_id`),
  CONSTRAINT `fk_EMPLEADO_RESTAURANTE1`
    FOREIGN KEY (`RESTAURANTE_RES_nit` , `RESTAURANTE_CENTRO COMERCIAL_CCO_id`)
    REFERENCES `RESTAURANTE` (`RES_nit` , `CENTRO COMERCIAL_CCO_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `PROVEEDOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROVEEDOR` ;

CREATE TABLE IF NOT EXISTS `PROVEEDOR` (
  `PRO_nit` VARCHAR(18) NOT NULL DEFAULT '111.111.111-1-pro',
  `PRO_nombreEmpresa` VARCHAR(50) NOT NULL,
  `PRO_telefonoEmpresa` VARCHAR(25) NOT NULL,
  `PRO_direccion` VARCHAR(45) NOT NULL,
  `PRO_ciudad` VARCHAR(20) NOT NULL,
  `PRO_telefono2Empresa` VARCHAR(25) NULL,
  `PRO_nombreContacto` VARCHAR(50) NULL,
  `PRO_telefonoContacto` VARCHAR(15) NULL,
  PRIMARY KEY (`PRO_nit`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROVEEDOR_has_RESTAURANTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROVEEDOR_has_RESTAURANTE` ;

CREATE TABLE IF NOT EXISTS `PROVEEDOR_has_RESTAURANTE` (
  `PROVEEDOR_PRO_nit` VARCHAR(18) NOT NULL,
  `RESTAURANTE_RES_nit` VARCHAR(18) NOT NULL,
  `RESTAURANTE_CENTRO COMERCIAL_CCO_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`PROVEEDOR_PRO_nit`, `RESTAURANTE_RES_nit`, `RESTAURANTE_CENTRO COMERCIAL_CCO_id`),
  CONSTRAINT `fk_PROVEEDOR_has_RESTAURANTE_PROVEEDOR1`
    FOREIGN KEY (`PROVEEDOR_PRO_nit`)
    REFERENCES `PROVEEDOR` (`PRO_nit`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_PROVEEDOR_has_RESTAURANTE_RESTAURANTE1`
    FOREIGN KEY (`RESTAURANTE_RES_nit` , `RESTAURANTE_CENTRO COMERCIAL_CCO_id`)
    REFERENCES `RESTAURANTE` (`RES_nit` , `CENTRO COMERCIAL_CCO_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DETALLE PAGO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DETALLE PAGO` ;

CREATE TABLE IF NOT EXISTS `DETALLE PAGO` (
  `PAGO_PAG_id` VARCHAR(10) NOT NULL,
  `PEDIDO_PED_id` VARCHAR(10) NOT NULL,
  `DPA_fecha` DATETIME NOT NULL,
  `DPA_total` DOUBLE NOT NULL,
  PRIMARY KEY (`PAGO_PAG_id`, `PEDIDO_PED_id`),
  CONSTRAINT `fk_DETALLE PAGO_PAGO1`
    FOREIGN KEY (`PAGO_PAG_id`)
    REFERENCES `PAGO` (`PAG_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE PAGO_ PEDIDO1`
    FOREIGN KEY (`PEDIDO_PED_id`)
    REFERENCES `PEDIDO` (`PED_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--------------------------
-- DATOS TABLA DETALLE PAGO
--------------------------

INSERT INTO `DETALLE PAGO` VALUES ('1-pag','1-ped','2016/04/22  17:15:04',21000);
INSERT INTO `DETALLE PAGO` VALUES ('2-pag','2-ped','2016/04/17  23:59:16',15300);
INSERT INTO `DETALLE PAGO` VALUES ('3-pag','3-ped','2016/01/07  10:06:53',139500);
INSERT INTO `DETALLE PAGO` VALUES ('4-pag','4-ped','2016/01/30  4:03:03',41600);
INSERT INTO `DETALLE PAGO` VALUES ('5-pag','5-ped','2016/06/06  12:40:05',154000);
