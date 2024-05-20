DROP TABLE IF EXISTS `Usuarios`;
CREATE TABLE `Usuarios` (   `id` mediumint(8) unsigned NOT NULL auto_increment, 
`nombresUsuarios` varchar(255) default NULL,   
`aoellidosUsuarios` varchar(255) default NULL,   
`correoElectronico` varchar(255) default NULL,   
PRIMARY KEY (`id`) ) AUTO_INCREMENT=1;

INSERT INTO `Usuarios` (`idUsuaeio`,`nombresUsuarios`,`aoellidosUsuarios`,`correoElectronico`) VALUES   (1,"Conan Craig","Oren Knight","Iris Walker"),   
(2,"George Pena","Piper Boyle","Brittany Pope"),   
(3,"Todd Whitfield","Colorado Kline","Henry Nelson"),   
(4,"Giacomo Fernandez","Bree Conley","Noelle Weber"),   
(5,"Caleb Cherry","Hoyt Kline","Henry Walters"),   
(6,"Katelyn Summers","Nola Bentley","Cody Zamora"),   
(7,"Cassandra Garner","Samuel Richards","Brandon Barrett"),   
(8,"Maite Stanley","Stuart Maddox","George Eaton"),   
(9,"Isabelle Wheeler","Hayley Payne","Jorden Wilkerson"),   
(10,"Wynter Osborn","Jason Sexton","Sara Gaines");

delete from Usuarios where id>=4 and id<=10;
