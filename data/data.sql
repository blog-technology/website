create table code_masters (
  master varchar(100) not null,
  code varchar(100) not null,
  name varchar(100),
  sequence int8,
  status char(1),
  primary key (master, code)
);
create table modules (
  module_id varchar(40) primary key,
  module_name varchar(255) not null,
  status char(1) not null,
  path varchar(255),
  resource_key varchar(255),
  icon varchar(255),
  sequence int not null,
  actions int4 null,
  parent varchar(40),
  created_by varchar(40),
  created_at timestamptz,
  updated_by varchar(40),
  updated_at timestamptz
);

create table users (
  user_id varchar(40) primary key,
  username varchar(255) not null,
  email varchar(255) not null,
  display_name varchar(255),
  status char(1) not null,
  gender char(1),
  phone varchar(20),
  title varchar(10),
  position varchar(40),
  image_url varchar(500),
  language varchar(5),
  dateformat varchar(12),
  max_password_age integer,
  created_by varchar(40),
  created_at timestamptz,
  updated_by varchar(40),
  updated_at timestamptz
);
create table passwords (
  user_id varchar(40) primary key,
  password varchar(255),
  success_time timestamptz,
  fail_time timestamptz,
  fail_count integer,
  locked_until_time timestamptz,
  changed_time timestamptz,
  history character varying[]
);
create table passcodes (
  id varchar(40) primary key,
  code varchar(500) not null,
  expired_at timestamptz not null
);
create table roles (
  role_id varchar(40) primary key,
  role_name varchar(255) not null,
  status char(1) not null,
  remark varchar(255),
  created_by varchar(40),
  created_at timestamptz,
  updated_by varchar(40),
  updated_at timestamptz
);
create table user_roles (
  user_id varchar(40) not null,
  role_id varchar(40) not null,
  primary key (user_id, role_id)
);
create table role_modules (
  role_id varchar(40) not null,
  module_id varchar(40) not null,
  permissions int not null,
  primary key (role_id, module_id)
);

create table audit_logs (
  id varchar(255) primary key,
  resource varchar(255),
  user_id varchar(255),
  ip varchar(255),
  action varchar(255),
  time timestamptz,
  status varchar(255),
  remark varchar(255)
);
insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('admin','Admin','A','/admin','admin','contacts',2,7,'');
insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('setup','Setup','A','/setup','setup','settings',3,7,'');
insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('report','Report','A','/report','report','pie_chart',4,7,'');

insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('user','User Management','A','/users','user','person',1,7,'admin');
insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('role','Role Management','A','/roles','role','credit_card',2,7,'admin');
insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('audit_log','Audit Log','A','/audit-logs','audit_log','zoom_in',4,1,'admin');

insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('content','Content','A','/contents','content','public',1,7,'setup');
insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('article','Article','A','/articles','article','assignment',2,7,'setup');
insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('job','Job','A','/jobs','jobs','work',3,7,'setup');
insert into modules (module_id,module_name,status,path,resource_key,icon,sequence,actions,parent) values ('contact','Contact','A','/contacts','contact','mail',4,7,'setup');

insert into roles (role_id, role_name, status, remark) values ('admin','Admin','A','Admin');
insert into roles (role_id, role_name, status, remark) values ('call_center','Call Center','A','Call Center');
insert into roles (role_id, role_name, status, remark) values ('it_support','IT Support','A','IT Support');
insert into roles (role_id, role_name, status, remark) values ('operator','Operator Group','A','Operator Group');

insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00001','gareth.bale','gareth.bale@gmail.com','Gareth Bale','https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Liver-RM_%282%29_%28cropped%29.jpg/440px-Liver-RM_%282%29_%28cropped%29.jpg','A','M','0987654321','Mr','M');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00002','cristiano.ronaldo','cristiano.ronaldo@gmail.com','Cristiano Ronaldo','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Cristiano_Ronaldo_2018.jpg/400px-Cristiano_Ronaldo_2018.jpg','I','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00003','james.rodriguez','james.rodriguez@gmail.com','James Rodríguez','https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/James_Rodriguez_2018.jpg/440px-James_Rodriguez_2018.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00004','zinedine.zidane','zinedine.zidane@gmail.com','Zinedine Zidane','https://upload.wikimedia.org/wikipedia/commons/f/f3/Zinedine_Zidane_by_Tasnim_03.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00005','kaka','kaka@gmail.com','Kaká','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Kak%C3%A1_visited_Stadium_St._Petersburg.jpg/500px-Kak%C3%A1_visited_Stadium_St._Petersburg.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00006','luis.figo','luis.figo@gmail.com','Luís Figo','https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/UEFA_TT_7209.jpg/440px-UEFA_TT_7209.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00007','ronaldo','ronaldo@gmail.com','Ronaldo','https://upload.wikimedia.org/wikipedia/commons/c/c8/Real_Valladolid-Valencia_CF%2C_2019-05-18_%2890%29_%28cropped%29.jpg','I','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00008','thibaut.courtois','thibaut.courtois@gmail.com','Thibaut Courtois','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Courtois_2018_%28cropped%29.jpg/440px-Courtois_2018_%28cropped%29.jpg','I','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00009','luka.modric','luka.modric@gmail.com','Luka Modrić','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/ISL-HRV_%287%29.jpg/440px-ISL-HRV_%287%29.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00010','xabi.alonso','xabi.alonso@gmail.com','Xabi Alonso','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Xabi_Alonso_Training_2017-03_FC_Bayern_Muenchen-3_%28cropped%29.jpg/440px-Xabi_Alonso_Training_2017-03_FC_Bayern_Muenchen-3_%28cropped%29.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00011','karim.benzema','karim.benzema@gmail.com','Karim Benzema','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Karim_Benzema_2018.jpg/440px-Karim_Benzema_2018.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00012','marc-andre.ter.stegen','marc-andre.ter.stegen@gmail.com','Marc-André ter Stegen','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Marc-Andr%C3%A9_ter_Stegen.jpg/500px-Marc-Andr%C3%A9_ter_Stegen.jpg','I','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00013','sergino.dest','sergino.dest@gmail.com','Sergiño Dest','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Sergino_Dest.jpg/440px-Sergino_Dest.jpg','I','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00014','gerard.pique','gerard.pique@gmail.com','Gerard Piqué','https://upload.wikimedia.org/wikipedia/commons/4/4e/Gerard_Piqu%C3%A9_2018.jpg','A','M','0987654321','Mr','M');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00015','ronald.araujo','ronald.araujo@gmail.com','Ronald Araújo','https://pbs.twimg.com/media/EtnqxaEU0AAc6A6.jpg','A','M','0987654321','Mr','M');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00016','sergio.busquets','sergio.busquets@gmail.com','Sergio Busquets','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Sergio_Busquets_2018.jpg/440px-Sergio_Busquets_2018.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00017','antoine.griezmann','antoine.griezmann@gmail.com','Antoine Griezmann','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Antoine_Griezmann_in_2018_%28cropped%29.jpg/440px-Antoine_Griezmann_in_2018_%28cropped%29.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00018','miralem.pjanic','miralem.pjanic@gmail.com','Miralem Pjanić','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/20150331_2025_AUT_BIH_2130_Miralem_Pjani%C4%87.jpg/440px-20150331_2025_AUT_BIH_2130_Miralem_Pjani%C4%87.jpg','A','M','0987654321','Mrs','M');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00019','martin.braithwaite','martin.braithwaite@gmail.com','Martin Braithwaite','https://img.a.transfermarkt.technology/portrait/header/95732-1583334177.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00020','ousmane.dembele','ousmane.dembele@gmail.com','Ousmane Dembélé','https://upload.wikimedia.org/wikipedia/commons/7/77/Ousmane_Demb%C3%A9l%C3%A9_2018.jpg','A','M','0987654321','Ms','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00021','riqui.puig','riqui.puig@gmail.com','Riqui Puig','https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Bar%C3%A7a_Napoli_12_%28cropped%29.jpg/440px-Bar%C3%A7a_Napoli_12_%28cropped%29.jpg','A','M','0987654321','Ms','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00022','philip.coutinho','philip.coutinho@gmail.com','Philip Coutinho','https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Norberto_Murara_Neto_2019.jpg/440px-Norberto_Murara_Neto_2019.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00023','victor.lindelof','victor.lindelof@gmail.com','Victor Lindelöf','https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/CSKA-MU_2017_%286%29.jpg/440px-CSKA-MU_2017_%286%29.jpg','I','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00024','eric.bailly','eric.bailly@gmail.com','Eric Bailly','https://upload.wikimedia.org/wikipedia/commons/c/cf/Eric_Bailly_-_ManUtd.jpg','I','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00025','phil.jones','phil.jones@gmail.com','Phil Jones','https://upload.wikimedia.org/wikipedia/commons/f/fa/Phil_Jones_2018-06-28_1.jpg','I','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00026','harry.maguire','harry.maguire@gmail.com','Harry Maguire','https://upload.wikimedia.org/wikipedia/commons/b/be/Harry_Maguire_2018-07-11_1.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00027','paul.pogba','paul.pogba@gmail.com','Paul Pogba','https://upload.wikimedia.org/wikipedia/commons/b/be/Harry_Maguire_2018-07-11_1.jpg','I','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00028','edinson.cavani','edinson.cavani@gmail.com','Edinson Cavani','https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Edinson_Cavani_2018.jpg/440px-Edinson_Cavani_2018.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00029','juan.mata','juan.mata@gmail.com','Juan Mata','https://upload.wikimedia.org/wikipedia/commons/7/70/Ukr-Spain2015_%286%29.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00030','anthony.martial','anthony.martial@gmail.com','Anthony Martial','https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Anthony_Martial_27_September_2017_cropped.jpg/440px-Anthony_Martial_27_September_2017_cropped.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00031','marcus.rashford','marcus.rashford@gmail.com','Marcus Rashford','https://upload.wikimedia.org/wikipedia/commons/5/5e/Press_Tren_CSKA_-_MU_%283%29.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00032','mason.greenwood','mason.greenwood@gmail.com','Mason Greenwood','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Mason_Greenwood.jpeg/440px-Mason_Greenwood.jpeg','A','M','0987654321','Ms','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00033','lee.grant','lee.grant@gmail.com','Lee Grant','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/LeeGrant09.jpg/400px-LeeGrant09.jpg','A','M','0987654321','Ms','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00034','jesse.lingard','jesse.lingard@gmail.com','Jesse Lingard','https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Jesse_Lingard_2018-06-13_1.jpg/440px-Jesse_Lingard_2018-06-13_1.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00035','keylor.navas','keylor.navas@gmail.com','Keylor Navas','https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Keylor_Navas_2018_%28cropped%29.jpg/220px-Keylor_Navas_2018_%28cropped%29.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00036','achraf.hakimi','achraf.hakimi@gmail.com','Achraf Hakimi','https://upload.wikimedia.org/wikipedia/commons/9/91/Iran-Morocco_by_soccer.ru_14_%28Achraf_Hakimi%29.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00037','presnel.kimpembe','presnel.kimpembe@gmail.com','Presnel Kimpembe','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Presnel_Kimpembe.jpg/400px-Presnel_Kimpembe.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00038','sergio.ramos','sergio.ramos@gmail.com','Sergio Ramos','https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/FC_RB_Salzburg_versus_Real_Madrid_%28Testspiel%2C_7._August_2019%29_09.jpg/440px-FC_RB_Salzburg_versus_Real_Madrid_%28Testspiel%2C_7._August_2019%29_09.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00039','marquinhos','marquinhos@gmail.com','Marquinhos','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Brasil_conquista_primeiro_ouro_ol%C3%ADmpico_nos_penaltis_1039278-20082016-_mg_4916_%28cropped%29.jpg/440px-Brasil_conquista_primeiro_ouro_ol%C3%ADmpico_nos_penaltis_1039278-20082016-_mg_4916_%28cropped%29.jpg','A','M','0987654321','Mr','E');
insert into users (user_id,username,email,display_name,image_url,status,gender,phone,title,position) values ('00040','marco.verratti','marco.verratti@gmail.com','Marco Verratti','https://upload.wikimedia.org/wikipedia/commons/d/d0/Kiev-PSG_%289%29.jpg','A','M','0987654321','Mr','E');

update users set language = 'en', dateformat = 'd/M/yyyy';

insert into passwords(user_id, password)
select user_id, '$2b$10$LWBgFYSRFpw/lysdne3ybuODJRAk1/qi2z.nhu9fXKA5vH/10AYY.' from users;
/* Password1! */

insert into user_roles(user_id, role_id) values ('00001','admin');
insert into user_roles(user_id, role_id) values ('00003','admin');
insert into user_roles(user_id, role_id) values ('00004','admin');
insert into user_roles(user_id, role_id) values ('00005','it_support');
insert into user_roles(user_id, role_id) values ('00007','admin');
insert into user_roles(user_id, role_id) values ('00008','call_center');
insert into user_roles(user_id, role_id) values ('00009','it_support');
insert into user_roles(user_id, role_id) values ('00010','call_center');
insert into user_roles(user_id, role_id) values ('00011','it_support');
insert into user_roles(user_id, role_id) values ('00012','call_center');
insert into user_roles(user_id, role_id) values ('00012','it_support');

insert into role_modules(role_id, module_id, permissions) values ('admin', 'setup', 7);
insert into role_modules(role_id, module_id, permissions) values ('admin', 'report', 7);
insert into role_modules(role_id, module_id, permissions) values ('admin', 'admin', 7);
insert into role_modules(role_id, module_id, permissions) values ('admin', 'user', 7);
insert into role_modules(role_id, module_id, permissions) values ('admin', 'role', 7);
insert into role_modules(role_id, module_id, permissions) values ('admin', 'audit_log', 7);

insert into role_modules(role_id, module_id, permissions) values ('it_support', 'admin', 7);
insert into role_modules(role_id, module_id, permissions) values ('it_support', 'user', 7);
insert into role_modules(role_id, module_id, permissions) values ('it_support', 'role', 7);
insert into role_modules(role_id, module_id, permissions) values ('it_support', 'audit_log', 7);
insert into role_modules(role_id, module_id, permissions) values ('it_support', 'setup', 7);
insert into role_modules(role_id, module_id, permissions) values ('it_support', 'content', 7);
insert into role_modules(role_id, module_id, permissions) values ('it_support', 'article', 7);
insert into role_modules(role_id, module_id, permissions) values ('it_support', 'job', 7);
insert into role_modules(role_id, module_id, permissions) values ('it_support', 'contact', 7);

insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('6xydt3Qap', 'authentication', '00005', '188.239.138.226', 'authenticate', '2023-07-02 21:00:06.811', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('gRAIVh1tM', 'term', '00005', '188.239.138.226', 'patch', '2023-07-03 12:09:51.659', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('d8sQRO1ap', 'entity', '00005', '188.239.138.226', 'patch', '2023-07-03 13:04:20.950', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('gMu1Rh1aM', 'entity', '00005', '188.239.138.226', 'patch', '2023-07-03 13:04:24.491', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('jrFkzsQaM', 'authentication', '00005', '188.239.138.226', 'authenticate', '2023-07-03 16:00:42.627', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('4lVacs1aM', 'authentication', '00001', '::1', 'authenticate', '2023-07-03 16:22:13.157', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('a8Y-cbQtM', 'product', '00001', '95.194.49.166', 'patch', '2023-07-03 16:22:23.430', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('Wvc4Us1aM', 'term', '00001', '95.194.49.166', 'patch', '2023-07-03 20:43:31.757', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('tcztIsQap', 'term', '00001', '::1', 'create', '2023-07-03 20:44:02.086', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('dO7zIb1ap', 'entity', '00001', '::1', 'patch', '2023-07-03 20:44:47.349', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('K-KcIbQtp', 'company', '00001', '::1', 'patch', '2023-07-03 20:45:55.702', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('G5JcIsQap', 'company', '00001', '::1', 'patch', '2023-07-03 20:45:59.129', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('HaLnIb1tM', 'company', '00001', '::1', 'patch', '2023-07-03 20:46:02.818', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('h_kcUbQap', 'company', '00001', '219.62.20.91', 'patch', '2023-07-03 20:46:05.519', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('jpTZIbQtM', 'company', '00001', '70.182.126.53', 'patch', '2023-07-03 20:46:07.779', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('UH_ZUsQtp', 'company', '00001', '70.182.126.53', 'patch', '2023-07-03 20:46:32.408', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('wP1SUsQtp', 'company', '00001', '70.182.126.53', 'patch', '2023-07-03 20:46:34.747', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('BxYPUb1aM', 'role', '00001', '::1', 'patch', '2023-07-03 20:46:42.944', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('rjegUs1tM', 'role', '00001', '::1', 'patch', '2023-07-03 20:47:02.120', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('lbmgUbQtM', 'role', '00001', '::1', 'patch', '2023-07-03 20:47:09.713', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('5o7-JsQap', 'role', '00001', '::1', 'patch', '2023-07-03 21:02:15.442', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('6eTFGbQap', 'role', '00001', '::1', 'patch', '2023-07-03 21:05:48.155', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('14S3JsQaM', 'role', '00001', '::1', 'patch', '2023-07-03 21:05:55.771', 'fail', 'pq: duplicate key text violates unique constraint "rolemodules_pkey"');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('DOYhJb1tp', 'article', '00001', '::1', 'patch', '2023-07-03 21:06:22.692', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('gKzOGs1tp', 'article', '00001', '::1', 'patch', '2023-07-03 21:06:25.995', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('SD3OJsQaM', 'authentication', '00005', '188.239.138.226', 'authenticate', '2023-07-03 21:06:32.586', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('wD-7GbQaM', 'term', '00005', '188.239.138.226', 'patch', '2023-07-03 21:08:36.507', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('n3x7Js1tp', 'product', '00005', '188.239.138.226', 'patch', '2023-07-03 21:08:41.929', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('Jm2NJbQap', 'product', '00005', '188.239.138.226', 'patch', '2023-07-03 21:08:47.577', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('mHJNJbQtM', 'product', '00005', '188.239.138.226', 'patch', '2023-07-03 21:08:54.878', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('u2RuJs1tM', 'user', '00005', '188.239.138.226', 'patch', '2023-07-03 21:09:32.212', 'success', '');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('2GrXJb1tM', 'user', '00005', '188.239.138.226', 'patch', '2023-07-03 21:09:43.729', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('tx0dJsQtM', 'user', '00005', '188.239.138.226', 'patch', '2023-07-03 21:10:10.950', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('Ua9dJbQaM', 'user', '00005', '188.239.138.226', 'patch', '2023-07-03 21:10:15.896', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('QD3KJb1tp', 'user', '00005', '188.239.138.226', 'patch', '2023-07-03 21:10:21.980', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('CU5dGs1tM', 'user', '00005', '188.239.138.226', 'patch', '2023-07-03 21:10:26.719', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('UnAKJs1tM', 'user', '00005', '188.239.138.226', 'patch', '2023-07-03 21:10:31.352', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('SiyKGs1ap', 'user', '00005', '188.239.138.226', 'patch', '2023-07-03 21:10:38.634', 'fail', 'Data Validation Failed');
insert into audit_logs (id, resource, user_id, ip, "action", "time", status, remark) values('yYReJsQaM', 'user', '00005', '188.239.138.226', 'patch', '2023-07-03 21:11:10.110', 'success', '');

insert into code_masters(master, code, name, sequence, status) values ('language','en','English',1,'A');
insert into code_masters(master, code, name, sequence, status) values ('language','vi','Tiếng Việt',2,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','yyyy/M/d','yyyy/M/d',1,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','yyyy/MM/dd','yyyy/MM/dd',2,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','yyyy-M-d','yyyy-M-d',3,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','yyyy-MM-dd','yyyy-MM-dd',4,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','yyyy.MM.dd','yyyy.MM.dd',5,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','yy.MM.dd','yy.MM.dd',6,'I');
insert into code_masters(master, code, name, sequence, status) values ('date_format','d/M/yyyy','d/M/yyyy',7,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','d/MM/yyyy','d/MM/yyyy',8,'I');
insert into code_masters(master, code, name, sequence, status) values ('date_format','dd/MM/yyyy','dd/MM/yyyy',9,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','dd/MM yyyy','dd/MM yyyy',10,'I');
insert into code_masters(master, code, name, sequence, status) values ('date_format','dd/MM/yy','dd/MM/yy',11,'I');
insert into code_masters(master, code, name, sequence, status) values ('date_format','d-M-yyyy','d-M-yyyy',12,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','dd-MM-yyyy','dd-MM-yyyy',13,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','dd-MM-yy','dd-MM-yy',14,'I');
insert into code_masters(master, code, name, sequence, status) values ('date_format','d.M.yyyy','d.M.yyyy',15,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','d.MM.yyyy','d.MM.yyyy',16,'I');
insert into code_masters(master, code, name, sequence, status) values ('date_format','dd.MM.yyyy','dd.MM.yyyy',17,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','dd.MM.yy','dd.MM.yy',18,'I');
insert into code_masters(master, code, name, sequence, status) values ('date_format','M/d/yyyy','M/d/yyyy',19,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','MM/dd/yyyy','MM/dd/yyyy',20,'A');
insert into code_masters(master, code, name, sequence, status) values ('date_format','MM.dd.yyyy','MM.dd.yyyy',21,'A');

/*
alter table user_roles add foreign key (user_id) references users (user_id);
alter table user_roles add foreign key (role_id) references roles (role_id);

alter table modules add foreign key (parent) references modules (module_id);

alter table role_modules add foreign key (role_id) references roles (role_id);
alter table role_modules add foreign key (module_id) references modules (module_id);

drop table modules;
drop table users;
drop table roles;
drop table user_roles;
drop table role_modules;
drop table audit_logs;

drop table categories;
*/
create table categories (
  id varchar(40) primary key,
  name varchar(255) not null,
  status char(1) not null,
  path varchar(255),
  resource_key varchar(255),
  icon varchar(255),
  sequence int not null,
  type varchar(40),
  parent varchar(40),
  created_by varchar(40),
  created_at timestamptz,
  updated_by varchar(40),
  updated_at timestamptz
);
/*
basic concept
 + microservices
 + docker
 + kubernetes
 + RTO, RPO, DRP
 + reverse proxy
 + ORM
 + CI/CD
 + DevOps
 + cloud

security
 + WAF
 + HIPS
 + FIM
node
 + data validation
 + export data
 + import data
 + express + mongodb
 + express + SQL
 + nestjs
 + graphql
frontend
 + chips
 + editor
 + reactjs
 + angular
 + vuejs
golang
 + data validation
 + export data
 + import data
 + SQL
 + MONGO
 + rest api
 + gRPC
*/

insert into categories (id,name,status,path,resource_key,icon,sequence,type,parent) values
 ('home','Home','A','/','home','home',1,'content',''),
 ('concept','Basic Concept','A','/concept','concept','settings',2,'content',''),
 ('architecture','Architecture','A','/architecture','architecture','settings',2,'content',''),
 ('security','Security','A','/security','security','settings',3,'content',''),
 ('go','Golang','A','/go','go','mail',4,'',''),
 ('node','node','A','/node','node','credit_card',5,'',''),
 ('frontend','Frontend','A','/frontend','frontend','work',6,'',''),

 ('bcp-drp','BCP - DRP','A','/bcp-drp','bcp_drp','assignment',1,'','concept'),
 ('cluster','Cluster','A','/cluster','cluster','settings',2,'','concept'),
 ('virtual-machine','Virtual Machine','A','/virtual-machine','virtual_machine','mail',3,'','concept'),
 ('docker','Docker','A','/docker','docker','mail',4,'','concept'),
 ('kubernetes','Kubernetes','A','/kubernetes','kubernetes','assignment',5,'','concept'),
 ('cicd','CI/CD','A','/cicd','cicd','assignment',6,'','concept'),
 ('devops','DevOps','A','/devops','devops','assignment',7,'','concept'),
 ('devsecops','DevSecOps','A','/devsecops','devsecops','assignment',8,'','concept'),
 ('ldap','LDAP','A','/ldap','ldap','assignment',9,'','concept'),
 ('orm','ORM','A','/orm','orm','assignment',10,'','concept'),
 ('cdn','CDN','A','/cdn','cdn','mail',11,'','concept'),
 ('message-queue','Message Queue','A','/message-queue','message_queue','assignment',12,'','concept'),
 ('cms','CMS','A','/cms','cms','assignment',13,'','concept'),
 ('forward-proxy','Forward Proxy','A','/forward-proxy','forward_proxy','assignment',14,'','concept'),
 ('reverse-proxy','Reverse Proxy','A','/reverse-proxy','reverse_proxy','assignment',15,'','concept'),

 ('soa','Service Oriented Architecture (SOA)','A','/soa','soa','settings',5,'','architecture'),
 ('microservices','Microservices','A','/microservices','microservices','mail',1,'','concept'),
 ('cqrs','CQRS Architecture','A','/cqrs','cqrs','settings',7,'','architecture'),
 ('event-driven-architecture','Event Driven Architecture','A','/event-driven-architecture','event_driven_architecture','settings',8,'','architecture'),
 ('event-sourcing-architecture','Event Sourcing Architecture','A','/event-sourcing-architecture','event_sourcing_architecture','settings',9,'','architecture'), 
 ('microkernel-architecture','Microkernel Architecture','A','/microkernel-architecture','microkernel_architecture','settings',10,'','architecture'),
 ('serverless-architecture','Serverless Architecture','A','/serverless-architecture','serverless_architecture','settings',11,'','architecture'),

 ('owasp','OWASP','A','/owasp','owasp','assignment',1,'','security'),
 ('waf-hips-fim','WAF, HIPS, FIM Protection','A','/waf-hips-fim-protection','waf_hips_fim_protection','assignment',2,'','security'),
 ('hardening-va-scan-pentest','Hardening Scan - VA Scan - Pentest','A','/hardening-va-scan-pentest','waf_hips_fim_protection','assignment',3,'','security'),
 ('sql-injection','SQL Injection','A','/sql-injection','sql_injection','assignment',4,'','security'),
 ('cross-site-scripting','Cross-Site Scripting (XSS)','A','/cross-site-scripting','cross_site_scripting','assignment',5,'','security'),
 ('cross-site-request-forgery','Cross-Site Request Forgery (CSRF)','A','/cross-site-request-forgery','cross_site_request_forgery','assignment',6,'','security'),
 ('file-inclusion','File Inclusion','A','/file-inclusion','file_inclusion','assignment',7,'','security'),
 ('ddos','DDoS Attack','A','/ddos','ddos','assignment',8,'','security'),
 ('ransomware-attack','Ransomware Attack','A','/ransomware-attack','ransomware_attack','assignment',9,'','security'),
 ('malware-virus-trojan-worms','Malware, Virus, Trojan, Worms','A','/malware-virus-trojan-worms','malware_virus_trojan_worms','assignment',10,'','security'),
 ('mac-dac','MAC - DAC','A','/mac-dac','mac_dac','assignment',11,'','security'),
 ('rbac','Role-Based Access Control (RBAC)','A','/rbac','rbac','assignment',12,'','security'),
 ('maker-checker','Maker/Checker','A','/maker-checker','maker_checker','assignment',13,'','security'),

 ('node-project-layout','Node Project Layout','A','/node-project-layout','node_project_layout','assignment',1,'','node'),
 ('node-interview-questions','Node Interview Questions','A','/node-interview-questions','node_interview_questions','assignment',2,'','node'),
 ('node-developer-roadmap','Node Developer Roadmap','A','/node-developer-roadmap','node_developer_roadmap','assignment',3,'','node'),
 ('node-data-validation','Node Data Validation','A','/node-data-validation','node_data_validation','assignment',4,'','node'),
 ('node-export-data','Node Export Data','A','/node-export-data','node_export_data','assignment',5,'','node'),
 ('node-import-data','Node Import Data','A','/node-import-data','node_import_data','assignment',6,'','node'),
 ('node-sql','Node SQL','A','/node-sql','node_sql','assignment',7,'','node'),
 ('node-mongo','Node MongoDB','A','/node-mongo','node_mongo','assignment',8,'','node'),
 ('express-sql','Express SQL','A','/express-sql','express_sql','assignment',9,'','node'),
 ('express-mongo','Express MongoDB','A','/express-mongo','express_mongo','assignment',10,'','node'),

 ('go-syntax','Go Syntax','A','/go-syntax','go_syntax','assignment',1,'','go'),
 ('go-developer-roadmap','Go Developer Roadmap','A','/go-developer-roadmap','go_developer_roadmap','assignment',2,'','go'),
 ('go-interview-questions','Go Interview Questions','A','/go-interview-questions','go_interview_questions','assignment',3,'','go'),
 ('go-project-layout','Go Project Layout','A','/go-project-layout','go_project_layout','assignment',4,'','go'),
 ('go-data-validation','Go Data Validation','A','/go-data-validation','go_data_validation','assignment',5,'','go'),
 ('go-export-data','Go Export Data','A','/go-export-data','go_export_data','assignment',6,'','go'),
 ('go-import-data','Go Import Data','A','/go-import-data','go_import_data','assignment',7,'','go'),
 ('go-sql','Go SQL','A','/go-sql','go_sql','assignment',8,'','go'),
 ('go-sql-orm','Go ORM','A','/go-sql-orm','go_sql_orm','assignment',9,'','go'),
 ('go-mongo','Go Mongo','A','/go-mongo','go_mongo','assignment',10,'','go'),
 ('go-rest-api','Go REST API','A','/go-rest-api','go_rest_api','assignment',11,'','go'),
 ('go-grpc','GRPC','A','/go-grpc','go_grpc','assignment',12,'','go'),

 ('chips','Chips','A','/chips','chips','assignment',1,'','frontend'),
 ('editor','Editor','A','/editor','editor','assignment',2,'','frontend'),
 ('react','React','A','/react','react','assignment',3,'','frontend'),
 ('angular','Angular','A','/angular','angular','assignment',4,'','frontend'),
 ('vue','Vue','A','/vue','vue','assignment',5,'','frontend');