# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.17)
# Database: zurmo
# Generation Time: 2016-10-07 20:06:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table __role_children_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `__role_children_cache`;

CREATE TABLE `__role_children_cache` (
  `permitable_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permitable_id`,`role_id`),
  UNIQUE KEY `permitable_id` (`permitable_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table _group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_group`;

CREATE TABLE `_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  `_group_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_eman` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `_group` WRITE;
/*!40000 ALTER TABLE `_group` DISABLE KEYS */;

INSERT INTO `_group` (`id`, `name`, `permitable_id`, `_group_id`)
VALUES
	(1,'Super Administrators',2,NULL),
	(2,'Everyone',3,NULL);

/*!40000 ALTER TABLE `_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table _group__user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_group__user`;

CREATE TABLE `_group__user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `_group_id` int(11) unsigned DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_resu__di_puorg_` (`_group_id`,`_user_id`),
  KEY `di_puorg_` (`_group_id`),
  KEY `di_resu_` (`_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `_group__user` WRITE;
/*!40000 ALTER TABLE `_group__user` DISABLE KEYS */;

INSERT INTO `_group__user` (`id`, `_group_id`, `_user_id`)
VALUES
	(1,1,1),
	(2,1,2);

/*!40000 ALTER TABLE `_group__user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table _right
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_right`;

CREATE TABLE `_right` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `modulename` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(11) DEFAULT NULL,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `_right` WRITE;
/*!40000 ALTER TABLE `_right` DISABLE KEYS */;

INSERT INTO `_right` (`id`, `modulename`, `name`, `type`, `permitable_id`)
VALUES
	(1,'UsersModule','Login Via Web',1,3),
	(2,'UsersModule','Login Via Mobile',1,3),
	(3,'UsersModule','Login Via Web API',1,3),
	(4,'AccountsModule','Access Accounts Tab',1,3),
	(5,'AccountsModule','Create Accounts',1,3),
	(6,'AccountsModule','Delete Accounts',1,3),
	(7,'CampaignsModule','Access Campaigns Tab',1,3),
	(8,'CampaignsModule','Create Campaigns',1,3),
	(9,'CampaignsModule','Delete Campaigns',1,3),
	(10,'ContactsModule','Access Contacts Tab',1,3),
	(11,'ContactsModule','Create Contacts',1,3),
	(12,'ContactsModule','Delete Contacts',1,3),
	(13,'ConversationsModule','Access Conversations Tab',1,3),
	(14,'ConversationsModule','Create Conversations',1,3),
	(15,'ConversationsModule','Delete Conversations',1,3),
	(16,'EmailMessagesModule','Access Emails Tab',1,3),
	(17,'EmailMessagesModule','Create Emails',1,3),
	(18,'EmailMessagesModule','Delete Emails',1,3),
	(19,'EmailTemplatesModule','Access Email Templates',1,3),
	(20,'EmailTemplatesModule','Create Email Templates',1,3),
	(21,'EmailTemplatesModule','Delete Email Templates',1,3),
	(22,'LeadsModule','Access Leads Tab',1,3),
	(23,'LeadsModule','Create Leads',1,3),
	(24,'LeadsModule','Delete Leads',1,3),
	(25,'LeadsModule','Convert Leads',1,3),
	(26,'OpportunitiesModule','Access Opportunities Tab',1,3),
	(27,'OpportunitiesModule','Create Opportunities',1,3),
	(28,'OpportunitiesModule','Delete Opportunities',1,3),
	(29,'MarketingModule','Access Marketing Tab',1,3),
	(30,'MarketingListsModule','Access Marketing Lists Tab',1,3),
	(31,'MarketingListsModule','Create Marketing Lists',1,3),
	(32,'MarketingListsModule','Delete Marketing Lists',1,3),
	(33,'MeetingsModule','Access Meetings',1,3),
	(34,'MeetingsModule','Create Meetings',1,3),
	(35,'MeetingsModule','Delete Meetings',1,3),
	(36,'MissionsModule','Access Missions Tab',1,3),
	(37,'MissionsModule','Create Missions',1,3),
	(38,'MissionsModule','Delete Missions',1,3),
	(39,'NotesModule','Access Notes',1,3),
	(40,'NotesModule','Create Notes',1,3),
	(41,'NotesModule','Delete Notes',1,3),
	(42,'ReportsModule','Access Reports Tab',1,3),
	(43,'ReportsModule','Create Reports',1,3),
	(44,'ReportsModule','Delete Reports',1,3),
	(45,'TasksModule','Access Tasks',1,3),
	(46,'TasksModule','Create Tasks',1,3),
	(47,'TasksModule','Delete Tasks',1,3),
	(48,'HomeModule','Access Dashboards',1,3),
	(49,'HomeModule','Create Dashboards',1,3),
	(50,'HomeModule','Delete Dashboards',1,3),
	(51,'ExportModule','Access Export Tool',1,3),
	(52,'SocialItemsModule','Access Social Items',1,3),
	(53,'ProductsModule','Access Products Tab',1,3),
	(54,'ProductsModule','Create Products',1,3),
	(55,'ProductsModule','Delete Products',1,3),
	(56,'ProductTemplatesModule','Access Catalog Items Tab',1,3),
	(57,'ProductTemplatesModule','Create Catalog Items',1,3),
	(58,'ProductTemplatesModule','Delete Catalog Items',1,3),
	(59,'ProjectsModule','Access Projects Tab',1,3),
	(60,'ProjectsModule','Create Projects',1,3),
	(61,'ProjectsModule','Delete Projects',1,3),
	(62,'CalendarsModule','Access Calandar Tab',1,3),
	(63,'CalendarsModule','Create Calendar',1,3),
	(64,'CalendarsModule','Delete Calendar',1,3),
	(65,'UsersModule','Login Via Mobile',2,4),
	(66,'UsersModule','Login Via Web',2,4),
	(67,'UsersModule','Login Via Web API',2,4);

/*!40000 ALTER TABLE `_right` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table _user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user`;

CREATE TABLE `_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serializedavatardata` text COLLATE utf8_unicode_ci,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  `isrootuser` tinyint(1) unsigned DEFAULT NULL,
  `hidefromselecting` tinyint(1) unsigned DEFAULT NULL,
  `issystemuser` tinyint(1) unsigned DEFAULT NULL,
  `hidefromleaderboard` tinyint(1) unsigned DEFAULT NULL,
  `lastlogindatetime` datetime DEFAULT NULL,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  `person_id` int(11) unsigned DEFAULT NULL,
  `currency_id` int(11) unsigned DEFAULT NULL,
  `manager__user_id` int(11) unsigned DEFAULT NULL,
  `role_id` int(11) unsigned DEFAULT NULL,
  `secondaryemail_email_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_emanresu` (`username`),
  KEY `permitable_id` (`permitable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `_user` WRITE;
/*!40000 ALTER TABLE `_user` DISABLE KEYS */;

INSERT INTO `_user` (`id`, `hash`, `language`, `locale`, `timezone`, `username`, `serializedavatardata`, `isactive`, `isrootuser`, `hidefromselecting`, `issystemuser`, `hidefromleaderboard`, `lastlogindatetime`, `permitable_id`, `person_id`, `currency_id`, `manager__user_id`, `role_id`, `secondaryemail_email_id`)
VALUES
	(1,'$2y$12$tp0jd5k6Y8aeLs4DtN567uk/SrYSDAPJnxlBaaTTwzNJb1Sg4XK.u',NULL,NULL,'America/Los_Angeles','super',NULL,1,1,NULL,NULL,NULL,'2016-10-06 22:29:10',1,1,NULL,NULL,NULL,NULL),
	(2,'$2y$12$BRM.4Unb/69i7HYoLDESPO/eEtBHLuM6QZl6rSPdSPEL7JsXeT/Iy',NULL,NULL,'America/Chicago','backendjoboractionuser',NULL,0,NULL,1,1,1,NULL,4,2,NULL,NULL,NULL,NULL),
	(3,'$2y$12$pyrtyM3v5qe004Qhdr3nceoUHFk6hsqnXoiAkAoD7H0KKMruFgOo6','en','','America/Chicago','john',NULL,1,NULL,NULL,NULL,NULL,NULL,5,3,1,NULL,NULL,2);

/*!40000 ALTER TABLE `_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table _user_meeting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_meeting`;

CREATE TABLE `_user_meeting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) unsigned DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_resu__di_gniteem` (`meeting_id`,`_user_id`),
  KEY `di_gniteem` (`meeting_id`),
  KEY `di_resu_` (`_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annualrevenue` double DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `employees` int(11) DEFAULT NULL,
  `latestactivitydatetime` datetime DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officephone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officefax` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  `billingaddress_address_id` int(11) unsigned DEFAULT NULL,
  `industry_customfield_id` int(11) unsigned DEFAULT NULL,
  `primaryemail_email_id` int(11) unsigned DEFAULT NULL,
  `secondaryemail_email_id` int(11) unsigned DEFAULT NULL,
  `shippingaddress_address_id` int(11) unsigned DEFAULT NULL,
  `type_customfield_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table account_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_project`;

CREATE TABLE `account_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_tcejorp_di_tnuocca` (`account_id`,`project_id`),
  KEY `di_tnuocca` (`account_id`),
  KEY `di_tcejorp` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table account_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_read`;

CREATE TABLE `account_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `account_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table account_read_subscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_read_subscription`;

CREATE TABLE `account_read_subscription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `subscriptiontype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_modelid` (`userid`,`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table account_read_subscription_temp_build
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_read_subscription_temp_build`;

CREATE TABLE `account_read_subscription_temp_build` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accountid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table accountaccountaffiliation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accountaccountaffiliation`;

CREATE TABLE `accountaccountaffiliation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `primaryaccountaffiliation_account_id` int(11) unsigned DEFAULT NULL,
  `secondaryaccountaffiliation_account_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table accountcontactaffiliation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accountcontactaffiliation`;

CREATE TABLE `accountcontactaffiliation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `primary` tinyint(1) unsigned DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `role_customfield_id` int(11) unsigned DEFAULT NULL,
  `accountaffiliation_account_id` int(11) unsigned DEFAULT NULL,
  `contactaffiliation_contact_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table accountstarred
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accountstarred`;

CREATE TABLE `accountstarred` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `basestarredmodel_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basestarredmodel_id_account_id` (`basestarredmodel_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table activelanguage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activelanguage`;

CREATE TABLE `activelanguage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nativename` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activationdatetime` datetime DEFAULT NULL,
  `lastupdatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity`;

CREATE TABLE `activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `latestdatetime` datetime DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table activity_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity_item`;

CREATE TABLE `activity_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_meti_di_ytivitca` (`activity_id`,`item_id`),
  KEY `di_ytivitca` (`activity_id`),
  KEY `di_meti` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table actual_permissions_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actual_permissions_cache`;

CREATE TABLE `actual_permissions_cache` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `permitable_id` int(11) unsigned NOT NULL,
  `allow_permissions` tinyint(3) unsigned NOT NULL,
  `deny_permissions` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`permitable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table actual_rights_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actual_rights_cache`;

CREATE TABLE `actual_rights_cache` (
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry` int(11) unsigned NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `actual_rights_cache` WRITE;
/*!40000 ALTER TABLE `actual_rights_cache` DISABLE KEYS */;

INSERT INTO `actual_rights_cache` (`identifier`, `entry`)
VALUES
	('1AccountAccountAffiliationsModuleAccess AccountAccountAffiliations TabActualRight',1),
	('1AccountContactAffiliationsModuleAccess AccountContactAffiliations TabActualRight',1),
	('1AccountsModuleAccess Accounts TabActualRight',1),
	('1AccountsModuleCreate AccountsActualRight',1),
	('1CalendarsModuleAccess Calandar TabActualRight',1),
	('1CampaignsModuleAccess Campaigns TabActualRight',1),
	('1ConfigurationModuleAccess Administration TabActualRight',1),
	('1ContactsModuleAccess Contacts TabActualRight',1),
	('1ContactsModuleCreate ContactsActualRight',1),
	('1ContactWebFormsModuleAccess Contact Web Forms TabActualRight',1),
	('1ContactWebFormsModuleCreate Contact Web FormsActualRight',1),
	('1ConversationsModuleAccess Conversations TabActualRight',1),
	('1ConversationsModuleCreate ConversationsActualRight',1),
	('1DesignerModuleAccess Designer ToolActualRight',1),
	('1EmailMessagesModuleAccess Email ConfigurationActualRight',1),
	('1EmailMessagesModuleAccess Emails TabActualRight',1),
	('1EmailTemplatesModuleAccess Email TemplatesActualRight',1),
	('1ExportModuleAccess Export ToolActualRight',1),
	('1GameRewardsModuleAccess Game Rewards TabActualRight',1),
	('1GroupsModuleAccess Groups TabActualRight',1),
	('1HomeModuleAccess DashboardsActualRight',1),
	('1HomeModuleDelete DashboardsActualRight',1),
	('1ImportModuleAccess Import ToolActualRight',1),
	('1JobsManagerModuleAccess Jobs Manager TabActualRight',1),
	('1LeadsModuleAccess Leads TabActualRight',1),
	('1LeadsModuleCreate LeadsActualRight',1),
	('1MapsModuleAccess Maps AdministrationActualRight',1),
	('1MarketingListsModuleAccess Marketing Lists TabActualRight',1),
	('1MarketingModuleAccess Marketing ConfigurationActualRight',1),
	('1MarketingModuleAccess Marketing TabActualRight',1),
	('1MeetingsModuleAccess MeetingsActualRight',1),
	('1MissionsModuleAccess Missions TabActualRight',1),
	('1MissionsModuleCreate MissionsActualRight',1),
	('1NotesModuleAccess NotesActualRight',1),
	('1OpportunitiesModuleAccess Opportunities TabActualRight',1),
	('1OpportunitiesModuleCreate OpportunitiesActualRight',1),
	('1ProductsModuleAccess Products TabActualRight',1),
	('1ProductTemplatesModuleAccess Catalog Items TabActualRight',1),
	('1ProjectsModuleAccess Projects TabActualRight',1),
	('1ProjectsModuleCreate ProjectsActualRight',1),
	('1ReportsModuleAccess Reports TabActualRight',1),
	('1ReportsModuleCreate ReportsActualRight',1),
	('1RolesModuleAccess Roles TabActualRight',1),
	('1SendGridModuleAccess Sendgrid AdministrationActualRight',1),
	('1SocialItemsModuleAccess Social ItemsActualRight',1),
	('1TasksModuleAccess TasksActualRight',1),
	('1TasksModuleCreate TasksActualRight',1),
	('1UsersModuleAccess Users TabActualRight',1),
	('1UsersModuleCreate UsersActualRight',1),
	('1UsersModuleLogin Via Web APIActualRight',1),
	('1UsersModuleLogin Via WebActualRight',1),
	('1UsersModuleManage UsersActualRight',1),
	('1WorkflowsModuleAccess Workflows TabActualRight',1),
	('1WorkflowsModuleCreate WorkflowsActualRight',1),
	('1ZurmoModuleAccess Administration TabActualRight',1),
	('1ZurmoModuleAccess Currency ConfigurationActualRight',1),
	('1ZurmoModuleAccess Global ConfigurationActualRight',1),
	('1ZurmoModulePush Dashboard or LayoutActualRight',1);

/*!40000 ALTER TABLE `actual_rights_cache` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalid` tinyint(1) unsigned DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `postalcode` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street1` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street2` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;

INSERT INTO `address` (`id`, `city`, `country`, `invalid`, `latitude`, `longitude`, `postalcode`, `street1`, `street2`, `state`)
VALUES
	(1,'','',NULL,NULL,NULL,'','','','');

/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auditevent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auditevent`;

CREATE TABLE `auditevent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `eventname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modulename` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modelclassname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modelid` int(11) DEFAULT NULL,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modelclass_modelid_index` (`modelclassname`,`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `auditevent` WRITE;
/*!40000 ALTER TABLE `auditevent` DISABLE KEYS */;

INSERT INTO `auditevent` (`id`, `datetime`, `eventname`, `modulename`, `modelclassname`, `modelid`, `serializeddata`, `_user_id`)
VALUES
	(1,'2016-10-06 22:28:51','User Password Changed','UsersModule','User',1,'s:5:\"super\";',1),
	(2,'2016-10-06 22:28:51','Item Modified','ZurmoModule','User',1,'a:4:{i:0;s:10:\"Super User\";i:1;a:1:{i:0;s:8:\"isActive\";}i:2;s:5:\"false\";i:3;s:4:\"true\";}',1),
	(3,'2016-10-06 22:28:52','User Password Changed','UsersModule','User',2,'s:22:\"backendjoboractionuser\";',1),
	(4,'2016-10-06 22:28:52','Item Modified','ZurmoModule','User',2,'a:4:{i:0;s:11:\"System User\";i:1;a:1:{i:0;s:8:\"isActive\";}i:2;s:5:\"false\";i:3;s:4:\"true\";}',1),
	(5,'2016-10-06 22:28:52','Item Modified','ZurmoModule','User',2,'a:4:{i:0;s:11:\"System User\";i:1;a:1:{i:0;s:8:\"isActive\";}i:2;s:4:\"true\";i:3;s:5:\"false\";}',1),
	(6,'2016-10-06 22:29:31','Item Modified','ZurmoModule','User',1,'a:4:{i:0;s:10:\"Super User\";i:1;a:1:{i:0;s:8:\"timeZone\";}i:2;s:15:\"America/Chicago\";i:3;s:19:\"America/Los_Angeles\";}',1),
	(7,'2016-10-06 22:30:16','User Password Changed','UsersModule','User',3,'s:4:\"john\";',1),
	(8,'2016-10-06 22:30:16','Item Modified','ZurmoModule','User',3,'a:4:{i:0;s:8:\"John Doe\";i:1;a:1:{i:0;s:8:\"isActive\";}i:2;s:5:\"false\";i:3;s:4:\"true\";}',1);

/*!40000 ALTER TABLE `auditevent` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table autoresponder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `autoresponder`;

CREATE TABLE `autoresponder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htmlcontent` text COLLATE utf8_unicode_ci,
  `textcontent` text COLLATE utf8_unicode_ci,
  `fromoperationdurationinterval` int(11) DEFAULT NULL,
  `fromoperationdurationtype` text COLLATE utf8_unicode_ci,
  `operationtype` int(11) DEFAULT NULL,
  `enabletracking` tinyint(1) unsigned DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `marketinglist_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table autoresponderitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `autoresponderitem`;

CREATE TABLE `autoresponderitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `processdatetime` datetime DEFAULT NULL,
  `processed` tinyint(1) unsigned DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `emailmessage_id` int(11) unsigned DEFAULT NULL,
  `autoresponder_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table autoresponderitemactivity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `autoresponderitemactivity`;

CREATE TABLE `autoresponderitemactivity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emailmessageactivity_id` int(11) unsigned DEFAULT NULL,
  `autoresponderitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailmessageactivity_id_autoresponderitem_id` (`emailmessageactivity_id`,`autoresponderitem_id`),
  KEY `emailmessageactivity_id` (`emailmessageactivity_id`),
  KEY `autoresponderitem_id` (`autoresponderitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table basecustomfield
# ------------------------------------------------------------

DROP TABLE IF EXISTS `basecustomfield`;

CREATE TABLE `basecustomfield` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data_customfielddata_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `basecustomfield` WRITE;
/*!40000 ALTER TABLE `basecustomfield` DISABLE KEYS */;

INSERT INTO `basecustomfield` (`id`, `data_customfielddata_id`)
VALUES
	(1,8);

/*!40000 ALTER TABLE `basecustomfield` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table basestarredmodel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `basestarredmodel`;

CREATE TABLE `basestarredmodel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table bytimeworkflowinqueue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bytimeworkflowinqueue`;

CREATE TABLE `bytimeworkflowinqueue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `modelclassname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processdatetime` datetime DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `modelitem_item_id` int(11) unsigned DEFAULT NULL,
  `savedworkflow_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table calculatedderivedattributemetadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `calculatedderivedattributemetadata`;

CREATE TABLE `calculatedderivedattributemetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `derivedattributemetadata_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table campaign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign`;

CREATE TABLE `campaign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `supportsrichtext` tinyint(1) unsigned DEFAULT NULL,
  `sendondatetime` datetime DEFAULT NULL,
  `fromname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromaddress` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htmlcontent` text COLLATE utf8_unicode_ci,
  `textcontent` text COLLATE utf8_unicode_ci,
  `enabletracking` tinyint(1) unsigned DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `marketinglist_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table campaign_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_read`;

CREATE TABLE `campaign_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `campaign_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table campaignitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaignitem`;

CREATE TABLE `campaignitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `processed` tinyint(1) unsigned DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `emailmessage_id` int(11) unsigned DEFAULT NULL,
  `campaign_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table campaignitemactivity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaignitemactivity`;

CREATE TABLE `campaignitemactivity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emailmessageactivity_id` int(11) unsigned DEFAULT NULL,
  `campaignitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailmessageactivity_id_campaignitem_id` (`emailmessageactivity_id`,`campaignitem_id`),
  KEY `emailmessageactivity_id` (`emailmessageactivity_id`),
  KEY `campaignitem_id` (`campaignitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `item_id` int(11) unsigned DEFAULT NULL,
  `relatedmodel_id` int(11) unsigned DEFAULT NULL,
  `relatedmodel_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `companyname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `latestactivitydatetime` datetime DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `googlewebtrackingid` text COLLATE utf8_unicode_ci,
  `twitterid` text COLLATE utf8_unicode_ci,
  `facebookid` text COLLATE utf8_unicode_ci,
  `person_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  `industry_customfield_id` int(11) unsigned DEFAULT NULL,
  `secondaryaddress_address_id` int(11) unsigned DEFAULT NULL,
  `secondaryemail_email_id` int(11) unsigned DEFAULT NULL,
  `source_customfield_id` int(11) unsigned DEFAULT NULL,
  `state_contactstate_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contact_opportunity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_opportunity`;

CREATE TABLE `contact_opportunity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `opportunity_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_ytinutroppo_di_tcatnoc` (`contact_id`,`opportunity_id`),
  KEY `di_tcatnoc` (`contact_id`),
  KEY `di_ytinutroppo` (`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contact_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_project`;

CREATE TABLE `contact_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_tcejorp_di_tcatnoc` (`contact_id`,`project_id`),
  KEY `di_tcatnoc` (`contact_id`),
  KEY `di_tcejorp` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contact_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_read`;

CREATE TABLE `contact_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `contact_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contact_read_subscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_read_subscription`;

CREATE TABLE `contact_read_subscription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `subscriptiontype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_modelid` (`userid`,`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contactstarred
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contactstarred`;

CREATE TABLE `contactstarred` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `basestarredmodel_id` int(11) unsigned DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basestarredmodel_id_contact_id` (`basestarredmodel_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contactstate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contactstate`;

CREATE TABLE `contactstate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `serializedlabels` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `contactstate` WRITE;
/*!40000 ALTER TABLE `contactstate` DISABLE KEYS */;

INSERT INTO `contactstate` (`id`, `name`, `order`, `serializedlabels`)
VALUES
	(1,'New',0,NULL),
	(2,'In Progress',1,NULL),
	(3,'Recycled',2,NULL),
	(4,'Dead',3,NULL),
	(5,'Qualified',4,NULL),
	(6,'Customer',5,NULL);

/*!40000 ALTER TABLE `contactstate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contactwebform
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contactwebform`;

CREATE TABLE `contactwebform` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `redirecturl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submitbuttonlabel` text COLLATE utf8_unicode_ci,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `excludestyles` tinyint(1) unsigned DEFAULT NULL,
  `enablecaptcha` tinyint(1) unsigned DEFAULT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultpermissionsetting` tinyint(11) DEFAULT NULL,
  `defaultpermissiongroupsetting` int(11) DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `defaultstate_contactstate_id` int(11) unsigned DEFAULT NULL,
  `defaultowner__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contactwebform_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contactwebform_read`;

CREATE TABLE `contactwebform_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `contactwebform_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contactwebformentry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contactwebformentry`;

CREATE TABLE `contactwebformentry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `hashindex` text COLLATE utf8_unicode_ci,
  `item_id` int(11) unsigned DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `entries_contactwebform_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table conversation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conversation`;

CREATE TABLE `conversation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `latestdatetime` datetime DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ownerhasreadlatest` tinyint(1) unsigned DEFAULT NULL,
  `isclosed` tinyint(1) unsigned DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table conversation_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conversation_item`;

CREATE TABLE `conversation_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) unsigned DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_meti_di_noitasrevnoc` (`conversation_id`,`item_id`),
  KEY `di_noitasrevnoc` (`conversation_id`),
  KEY `di_meti` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table conversation_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conversation_read`;

CREATE TABLE `conversation_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `conversation_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table conversationparticipant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conversationparticipant`;

CREATE TABLE `conversationparticipant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hasreadlatest` tinyint(1) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  `conversation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table conversationstarred
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conversationstarred`;

CREATE TABLE `conversationstarred` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `basestarredmodel_id` int(11) unsigned DEFAULT NULL,
  `conversation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basestarredmodel_id_conversation_id` (`basestarredmodel_id`,`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table currency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ratetobase` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_edoc` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;

INSERT INTO `currency` (`id`, `active`, `code`, `ratetobase`)
VALUES
	(1,1,'USD',1);

/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table currencyvalue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currencyvalue`;

CREATE TABLE `currencyvalue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ratetobase` double DEFAULT NULL,
  `value` double DEFAULT NULL,
  `currency_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table customfield
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customfield`;

CREATE TABLE `customfield` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` text COLLATE utf8_unicode_ci,
  `basecustomfield_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `customfield` WRITE;
/*!40000 ALTER TABLE `customfield` DISABLE KEYS */;

INSERT INTO `customfield` (`id`, `value`, `basecustomfield_id`)
VALUES
	(1,'Mr.',1);

/*!40000 ALTER TABLE `customfield` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customfielddata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customfielddata`;

CREATE TABLE `customfielddata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultvalue` text COLLATE utf8_unicode_ci,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `serializedlabels` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_eman` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `customfielddata` WRITE;
/*!40000 ALTER TABLE `customfielddata` DISABLE KEYS */;

INSERT INTO `customfielddata` (`id`, `name`, `defaultvalue`, `serializeddata`, `serializedlabels`)
VALUES
	(1,'AccountContactAffiliationRoles',NULL,'a:6:{i:0;s:7:\"Billing\";i:1;s:8:\"Shipping\";i:2;s:7:\"Support\";i:3;s:9:\"Technical\";i:4;s:14:\"Administrative\";i:5;s:15:\"Project Manager\";}',NULL),
	(2,'Industries',NULL,'a:9:{i:0;s:10:\"Automotive\";i:1;s:7:\"Banking\";i:2;s:17:\"Business Services\";i:3;s:6:\"Energy\";i:4;s:18:\"Financial Services\";i:5;s:9:\"Insurance\";i:6;s:13:\"Manufacturing\";i:7;s:6:\"Retail\";i:8;s:10:\"Technology\";}',NULL),
	(3,'AccountTypes',NULL,'a:3:{i:0;s:8:\"Prospect\";i:1;s:8:\"Customer\";i:2;s:6:\"Vendor\";}',NULL),
	(4,'LeadSources',NULL,'a:4:{i:0;s:14:\"Self-Generated\";i:1;s:12:\"Inbound Call\";i:2;s:9:\"Tradeshow\";i:3;s:13:\"Word of Mouth\";}',NULL),
	(5,'MeetingCategories','Meeting','a:2:{i:0;s:7:\"Meeting\";i:1;s:4:\"Call\";}',NULL),
	(6,'SalesStages','Prospecting','a:6:{i:0;s:11:\"Prospecting\";i:1;s:13:\"Qualification\";i:2;s:11:\"Negotiating\";i:3;s:6:\"Verbal\";i:4;s:10:\"Closed Won\";i:5;s:11:\"Closed Lost\";}',NULL),
	(7,'ProductStages',NULL,'a:3:{i:0;s:4:\"Open\";i:1;s:4:\"Lost\";i:2;s:3:\"Won\";}',NULL),
	(8,'Titles',NULL,'a:4:{i:0;s:3:\"Mr.\";i:1;s:4:\"Mrs.\";i:2;s:3:\"Ms.\";i:3;s:3:\"Dr.\";}',NULL);

/*!40000 ALTER TABLE `customfielddata` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customfieldvalue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customfieldvalue`;

CREATE TABLE `customfieldvalue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `multiplevaluescustomfield_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `multiplevaluescustomfield_id` (`multiplevaluescustomfield_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dashboard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard`;

CREATE TABLE `dashboard` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isdefault` tinyint(1) unsigned DEFAULT NULL,
  `layoutid` int(11) DEFAULT NULL,
  `layouttype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;

INSERT INTO `dashboard` (`id`, `isdefault`, `layoutid`, `layouttype`, `name`, `ownedsecurableitem_id`)
VALUES
	(1,1,1,'50,50','Dashboard',8);

/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table derivedattributemetadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `derivedattributemetadata`;

CREATE TABLE `derivedattributemetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modelclassname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serializedmetadata` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dropdowndependencyderivedattributemetadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dropdowndependencyderivedattributemetadata`;

CREATE TABLE `dropdowndependencyderivedattributemetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `derivedattributemetadata_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table email
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emailaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isinvalid` tinyint(1) unsigned DEFAULT NULL,
  `optout` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;

INSERT INTO `email` (`id`, `emailaddress`, `isinvalid`, `optout`)
VALUES
	(1,'',NULL,NULL),
	(2,'',NULL,NULL);

/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table emailaccount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailaccount`;

CREATE TABLE `emailaccount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fromname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `replytoname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outboundhost` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outboundusername` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outboundpassword` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outboundsecurity` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outboundtype` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outboundport` int(11) DEFAULT NULL,
  `usecustomoutboundsettings` int(11) DEFAULT NULL,
  `replytoaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailbox`;

CREATE TABLE `emailbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `emailbox` WRITE;
/*!40000 ALTER TABLE `emailbox` DISABLE KEYS */;

INSERT INTO `emailbox` (`id`, `name`, `item_id`, `_user_id`)
VALUES
	(1,'System Notifications',24,NULL);

/*!40000 ALTER TABLE `emailbox` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table emailfolder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailfolder`;

CREATE TABLE `emailfolder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `emailbox_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `emailfolder` WRITE;
/*!40000 ALTER TABLE `emailfolder` DISABLE KEYS */;

INSERT INTO `emailfolder` (`id`, `name`, `type`, `item_id`, `emailbox_id`)
VALUES
	(1,'Draft','Draft',25,1),
	(2,'Sent','Sent',26,1),
	(3,'Outbox','Outbox',27,1),
	(4,'Outbox Error','OutboxError',28,1),
	(5,'Outbox Failure','OutboxFailure',29,1),
	(6,'Inbox','Inbox',30,1),
	(7,'Archived','Archived',31,1),
	(8,'Archived Unmatched','ArchivedUnmatched',32,1);

/*!40000 ALTER TABLE `emailfolder` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table emailmessage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessage`;

CREATE TABLE `emailmessage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sendattempts` int(11) DEFAULT NULL,
  `sentdatetime` datetime DEFAULT NULL,
  `sendondatetime` datetime DEFAULT NULL,
  `headers` text COLLATE utf8_unicode_ci,
  `mailertype` text COLLATE utf8_unicode_ci,
  `mailersettings` text COLLATE utf8_unicode_ci,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `folder_emailfolder_id` int(11) unsigned DEFAULT NULL,
  `content_emailmessagecontent_id` int(11) unsigned DEFAULT NULL,
  `sender_emailmessagesender_id` int(11) unsigned DEFAULT NULL,
  `error_emailmessagesenderror_id` int(11) unsigned DEFAULT NULL,
  `account_emailaccount_id` int(11) unsigned DEFAULT NULL,
  `sendgridaccount_sendgridemailaccount_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailmessage_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessage_read`;

CREATE TABLE `emailmessage_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `emailmessage_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailmessageactivity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessageactivity`;

CREATE TABLE `emailmessageactivity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `latestdatetime` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `latestsourceip` text COLLATE utf8_unicode_ci,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_id` int(11) unsigned DEFAULT NULL,
  `emailmessageurl_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailmessagecontent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessagecontent`;

CREATE TABLE `emailmessagecontent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `htmlcontent` text COLLATE utf8_unicode_ci,
  `textcontent` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailmessagerecipient
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessagerecipient`;

CREATE TABLE `emailmessagerecipient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `toaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toname` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `emailmessage_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remailmessage` (`emailmessage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailmessagerecipient_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessagerecipient_item`;

CREATE TABLE `emailmessagerecipient_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emailmessagerecipient_id` int(11) unsigned DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_meti_di_tneipiceregassemliame` (`emailmessagerecipient_id`,`item_id`),
  KEY `di_tneipiceregassemliame` (`emailmessagerecipient_id`),
  KEY `di_meti` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailmessagesender
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessagesender`;

CREATE TABLE `emailmessagesender` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fromaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromname` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailmessagesender_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessagesender_item`;

CREATE TABLE `emailmessagesender_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emailmessagesender_id` int(11) unsigned DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_meti_di_rednesegassemliame` (`emailmessagesender_id`,`item_id`),
  KEY `di_rednesegassemliame` (`emailmessagesender_id`),
  KEY `di_meti` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailmessagesenderror
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessagesenderror`;

CREATE TABLE `emailmessagesenderror` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createddatetime` datetime DEFAULT NULL,
  `serializeddata` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailmessageurl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailmessageurl`;

CREATE TABLE `emailmessageurl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailmessageactivity_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailsignature
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailsignature`;

CREATE TABLE `emailsignature` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `textcontent` text COLLATE utf8_unicode_ci,
  `htmlcontent` text COLLATE utf8_unicode_ci,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table emailtemplate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailtemplate`;

CREATE TABLE `emailtemplate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `isdraft` tinyint(1) unsigned DEFAULT NULL,
  `builttype` int(11) DEFAULT NULL,
  `modelclassname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htmlcontent` text COLLATE utf8_unicode_ci,
  `textcontent` text COLLATE utf8_unicode_ci,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `isfeatured` tinyint(1) unsigned DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `emailtemplate` WRITE;
/*!40000 ALTER TABLE `emailtemplate` DISABLE KEYS */;

INSERT INTO `emailtemplate` (`id`, `type`, `isdraft`, `builttype`, `modelclassname`, `name`, `subject`, `language`, `htmlcontent`, `textcontent`, `serializeddata`, `isfeatured`, `ownedsecurableitem_id`)
VALUES
	(1,NULL,0,3,NULL,'Blank','Blank','en',NULL,NULL,'{\"baseTemplateId\":\"\",\"icon\":\"icon-template-0\",\"dom\":{\"canvas1\":{\"content\":{\"builderrowelement_1393965668_53163a6448794\":{\"content\":{\"buildercolumnelement_1393965668_53163a644866d\":{\"content\":[],\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"1\"}},\"class\":\"BuilderRowElement\"}},\"properties\":{\"frontend\":{\"inlineStyles\":{\"background-color\":\"#ffffff\",\"color\":\"#545454\"}}},\"class\":\"BuilderCanvasElement\"}}}',NULL,1),
	(2,NULL,0,3,NULL,'1 Column','1 Column','en',NULL,NULL,'{\"baseTemplateId\":\"\",\"icon\":\"icon-template-5\",\"dom\":{\"canvas1\":{\"content\":{\"builderheaderimagetextelement_1393965594_53163a1a0eb53\":{\"content\":{\"buildercolumnelement_1393965594_53163a1a0ef48\":{\"content\":{\"builderimageelement_1393965594_53163a1a0ee52\":{\"content\":{\"image\":1},\"properties\":[],\"class\":\"BuilderImageElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1393965594_53163a1a145cc\":{\"content\":{\"builderheadertextelement_1393965594_53163a1a14515\":{\"content\":{\"text\":\"Acme Inc. Newsletter\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"color\":\"#ffffff\",\"font-weight\":\"bold\",\"text-align\":\"right\"}}},\"class\":\"BuilderHeaderTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"1:2\",\"header\":\"1\"},\"frontend\":{\"inlineStyles\":{\"background-color\":\"#282a76\"}}},\"class\":\"BuilderHeaderImageTextElement\"},\"builderrowelement_1393965668_53163a6448794\":{\"content\":{\"buildercolumnelement_1393965668_53163a644866d\":{\"content\":{\"buildertitleelement_1393965668_53163a6447762\":{\"content\":{\"text\":\"Hello there William S...\"},\"properties\":{\"backend\":{\"headingLevel\":\"h3\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#666666\",\"font-size\":\"24\",\"font-weight\":\"bold\",\"text-align\":\"center\"}}},\"class\":\"BuilderTitleElement\"},\"builderimageelement_1393970522_53164d5a3787a\":{\"content\":{\"image\":3},\"properties\":[],\"class\":\"BuilderImageElement\"},\"builderexpanderelement_1393970557_53164d7d2881e\":{\"content\":[],\"properties\":{\"frontend\":{\"height\":\"10\"}},\"class\":\"BuilderExpanderElement\"},\"buildertextelement_1393965781_53163ad53b77c\":{\"content\":{\"text\":\"\\n<p>\\n    Orsino, the <i>Duke of Illyria<\\/i>, is consumed by his passion for the melancholy Countess Olivia. His ostentatious musings on the nature of love begin with what has become one of Shakespeare\'s most famous lines: \\\"If music be the food of love, play on.\\\" It is apparent that Orsino\'s love is hollow. He is a romantic dreamer, for whom the idea of being in love is most important. When Valentine gives him the terrible news that <b>Olivia<\\/b> plans to seclude herself for seven years to mourn her deceased brother, Orsino seems unfazed, and hopes Olivia may one day be as bewitched by love (the one self king) as he. Fittingly, the scene ends with Orsino off to lay in a bed of flowers, where he can be alone with his love-thoughts. Later in the play it will be up to Viola to teach Orsino the true meaning of love.\\n<\\/p>\\n\"},\"properties\":[],\"class\":\"BuilderTextElement\"},\"builderbuttonelement_1393965942_53163b76e666c\":{\"content\":[],\"properties\":{\"backend\":{\"text\":\"Call Me\",\"sizeClass\":\"medium-button\",\"align\":\"left\"},\"frontend\":{\"href\":\"http:\\/\\/localhost\\/Zurmo\\/app\\/index.php\",\"target\":\"_blank\",\"inlineStyles\":{\"background-color\":\"#97c43d\",\"border-color\":\"#7cb830\"}}},\"class\":\"BuilderButtonElement\"},\"builderdividerelement_1393965948_53163b7cb98ae\":{\"content\":[],\"properties\":{\"frontend\":{\"inlineStyles\":{\"border-top-width\":\"1\",\"border-top-style\":\"solid\",\"border-top-color\":\"#cccccc\"}},\"backend\":{\"divider-padding\":\"10\"}},\"class\":\"BuilderDividerElement\"},\"buildersocialelement_1394060039_5317ab07cf03d\":{\"content\":[],\"properties\":{\"backend\":{\"layout\":\"vertical\",\"services\":{\"Twitter\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/www.twitter.com\\/\"},\"Facebook\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/www.facebook.com\\/\"},\"GooglePlus\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/gplus.com\"}}}},\"class\":\"BuilderSocialElement\"},\"builderexpanderelement_1393970592_53164da0bd137\":{\"content\":[],\"properties\":{\"frontend\":{\"height\":\"10\"}},\"class\":\"BuilderExpanderElement\"},\"builderfooterelement_1393966090_53163c0ac51bd\":{\"content\":{\"text\":\"[[GLOBAL^MARKETING^FOOTER^HTML]]\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"background-color\":\"#efefef\",\"font-size\":\"10\"}}},\"class\":\"BuilderFooterElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"}},\"properties\":{\"frontend\":{\"inlineStyles\":{\"background-color\":\"#ffffff\",\"color\":\"#545454\"}}},\"class\":\"BuilderCanvasElement\"}}}',NULL,2),
	(3,NULL,0,3,NULL,'2 Columns','2 Columns','en',NULL,NULL,'{\"baseTemplateId\":\"\",\"icon\":\"icon-template-2\",\"dom\":{\"canvas1\":{\"content\":{\"builderheaderimagetextelement_1393965594_53163a1a0eb53\":{\"content\":{\"buildercolumnelement_1393965594_53163a1a0ef48\":{\"content\":{\"builderimageelement_1393965594_53163a1a0ee52\":{\"content\":{\"image\":1},\"properties\":[],\"class\":\"BuilderImageElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1393965594_53163a1a145cc\":{\"content\":{\"builderheadertextelement_1393965594_53163a1a14515\":{\"content\":{\"text\":\"Acme Inc. Newsletter\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"color\":\"#ffffff\",\"font-weight\":\"bold\",\"text-align\":\"right\"}}},\"class\":\"BuilderHeaderTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"1:2\",\"header\":\"1\"},\"frontend\":{\"inlineStyles\":{\"background-color\":\"#282a76\"}}},\"class\":\"BuilderHeaderImageTextElement\"},\"builderrowelement_1394062546_5317b4d264a62\":{\"content\":{\"buildercolumnelement_1394062546_5317b4d26488b\":{\"content\":{\"buildertitleelement_1394062546_5317b4d263942\":{\"content\":{\"text\":\"Hello there William S...\"},\"properties\":{\"backend\":{\"headingLevel\":\"h1\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#666666\",\"font-size\":\"28\",\"font-weight\":\"bold\",\"line-height\":\"200\"}}},\"class\":\"BuilderTitleElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"},\"builderrowelement_1393965668_53163a6448794\":{\"content\":{\"buildercolumnelement_1393965668_53163a644866d\":{\"content\":{\"buildertextelement_1393965781_53163ad53b77c\":{\"content\":{\"text\":\"\\n<p>\\n    Orsino, the <i>Duke of Illyria<\\/i>, is consumed by his passion for the melancholy Countess Olivia. His ostentatious musings on the nature of love begin with what has become one of Shakespeare\'s most famous lines: \\\"If music be the food of love, play on.\\\" It is apparent that Orsino\'s love is hollow. He is a romantic dreamer, for whom the idea of being in love is most important. When Valentine gives him the terrible news that <b>Olivia<\\/b> plans to seclude herself for seven years to mourn her deceased brother, Orsino seems unfazed, and hopes Olivia may one day be as bewitched by love (the one self king) as he. Fittingly, the scene ends with Orsino off to lay in a bed of flowers, where he can be alone with his love-thoughts. Later in the play it will be up to Viola to teach Orsino the true meaning of love.\\n<\\/p>\\n\"},\"properties\":[],\"class\":\"BuilderTextElement\"},\"builderbuttonelement_1393965942_53163b76e666c\":{\"content\":[],\"properties\":{\"backend\":{\"text\":\"Contact Us Now\",\"sizeClass\":\"medium-button\",\"align\":\"left\"},\"frontend\":{\"href\":\"http:\\/\\/localhost\\/Zurmo\\/app\\/index.php\",\"target\":\"_blank\",\"inlineStyles\":{\"background-color\":\"#97c43d\",\"border-color\":\"#7cb830\"}}},\"class\":\"BuilderButtonElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1394061698_5317b182c1f19\":{\"content\":{\"buildertextelement_1394061967_5317b28fc8088\":{\"content\":{\"text\":\"\\n<b>New Articles<\\/b>\\n<ul>\\n    <li>Article Name about something<\\/li>\\n    <li>10 ways to create email templates<\\/li>\\n    <li>Great new marketing tools from Acme<\\/li>\\n    <li>Best blog post of the year<\\/li>\\n    <li>Meet our new chef<\\/li>\\n<\\/ul>\\n\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"background-color\":\"#f6f6f7\",\"color\":\"#323232\",\"font-size\":\"16\"}}},\"class\":\"BuilderTextElement\"},\"builderexpanderelement_1394062193_5317b37137abc\":{\"content\":[],\"properties\":{\"frontend\":{\"height\":\"10\"}},\"class\":\"BuilderExpanderElement\"},\"buildertitleelement_1394062361_5317b419e1c51\":{\"content\":{\"text\":\"Acme Elsewhere\"},\"properties\":{\"backend\":{\"headingLevel\":\"h3\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#6c1d1d\",\"font-weight\":\"bold\",\"line-height\":\"200\"}}},\"class\":\"BuilderTitleElement\"},\"buildersocialelement_1394060039_5317ab07cf03d\":{\"content\":[],\"properties\":{\"backend\":{\"layout\":\"vertical\",\"services\":{\"Twitter\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/www.twitter.com\\/\"},\"Facebook\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/www.facebook.com\\/\"},\"GooglePlus\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/gplus.com\"}}}},\"class\":\"BuilderSocialElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"2\"}},\"class\":\"BuilderRowElement\"},\"builderrowelement_1394062652_5317b53c906f9\":{\"content\":{\"buildercolumnelement_1394062652_5317b53c90615\":{\"content\":{\"builderdividerelement_1394062652_5317b53c901fc\":{\"content\":[],\"properties\":{\"frontend\":{\"inlineStyles\":{\"border-top-width\":\"1\",\"border-top-style\":\"dotted\",\"border-top-color\":\"#efefef\"}},\"backend\":{\"divider-padding\":\"10\"}},\"class\":\"BuilderDividerElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"},\"builderrowelement_1394062641_5317b53112a36\":{\"content\":{\"buildercolumnelement_1394062641_5317b5311291a\":{\"content\":{\"builderfooterelement_1394062641_5317b5311226e\":{\"content\":{\"text\":\"[[GLOBAL^MARKETING^FOOTER^HTML]]\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"font-size\":\"11\",\"background-color\":\"#ebebeb\"}}},\"class\":\"BuilderFooterElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"}},\"properties\":{\"frontend\":{\"inlineStyles\":{\"background-color\":\"#ffffff\",\"color\":\"#545454\"}}},\"class\":\"BuilderCanvasElement\"}}}',NULL,3),
	(4,NULL,0,3,NULL,'2 Columns with strong right','2 Columns with strong right','en',NULL,NULL,'{\"baseTemplateId\":\"\",\"icon\":\"icon-template-3\",\"dom\":{\"canvas1\":{\"content\":{\"builderheaderimagetextelement_1393965594_53163a1a0eb53\":{\"content\":{\"buildercolumnelement_1393965594_53163a1a0ef48\":{\"content\":{\"builderimageelement_1393965594_53163a1a0ee52\":{\"content\":{\"image\":1},\"properties\":[],\"class\":\"BuilderImageElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1393965594_53163a1a145cc\":{\"content\":{\"builderheadertextelement_1393965594_53163a1a14515\":{\"content\":{\"text\":\"Acme Inc. Newsletter\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"color\":\"#ffffff\",\"font-weight\":\"bold\",\"text-align\":\"right\"}}},\"class\":\"BuilderHeaderTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"1:2\",\"header\":\"1\"},\"frontend\":{\"inlineStyles\":{\"background-color\":\"#282a76\"}}},\"class\":\"BuilderHeaderImageTextElement\"},\"builderrowelement_1394062546_5317b4d264a62\":{\"content\":{\"buildercolumnelement_1394062546_5317b4d26488b\":{\"content\":{\"buildertitleelement_1394062546_5317b4d263942\":{\"content\":{\"text\":\"Hello there William S...\"},\"properties\":{\"backend\":{\"headingLevel\":\"h1\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#666666\",\"font-size\":\"28\",\"font-weight\":\"bold\",\"line-height\":\"200\"}}},\"class\":\"BuilderTitleElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"},\"builderrowelement_1393965668_53163a6448794\":{\"content\":{\"buildercolumnelement_1393965668_53163a644866d\":{\"content\":{\"buildertextelement_1394061967_5317b28fc8088\":{\"content\":{\"text\":\"\\n <b>New Products<\\/b>\\n<ul>\\n    <li><a href=\\\"#\\\" target=\\\"_blank\\\">AcmeMaster 10,000<\\/a><\\/li>\\n    <li><a href=\\\"#\\\">ProAcme 5,000<\\/a><\\/li>\\n    <li><a href=\\\"#\\\">AcmeMaster++<\\/a><\\/li>\\n    <li><a href=\\\"#\\\" target=\\\"_blank\\\">The Acme Beginner pro<\\/a><\\/li>\\n<\\/ul>\\n\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"background-color\":\"#f6f6f7\",\"color\":\"#323232\",\"font-size\":\"16\"}}},\"class\":\"BuilderTextElement\"},\"buildertitleelement_1394062361_5317b419e1c51\":{\"content\":{\"text\":\"Follow Us!\"},\"properties\":{\"backend\":{\"headingLevel\":\"h3\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#6c1d1d\",\"font-weight\":\"bold\",\"line-height\":\"200\"}}},\"class\":\"BuilderTitleElement\"},\"buildersocialelement_1394060039_5317ab07cf03d\":{\"content\":[],\"properties\":{\"backend\":{\"layout\":\"vertical\",\"services\":{\"Twitter\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/www.twitter.com\\/\"},\"Facebook\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/www.facebook.com\\/\"},\"GooglePlus\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/gplus.com\"}}}},\"class\":\"BuilderSocialElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1394061698_5317b182c1f19\":{\"content\":{\"buildertextelement_1393965781_53163ad53b77c\":{\"content\":{\"text\":\"\\n<p>\\n    Orsino, the <i>Duke of Illyria<\\/i>, is consumed by his passion for the melancholy Countess Olivia. His ostentatious musings on the nature of love begin with what has become one of Shakespeare\'s most famous lines: \\\"If music be the food of love, play on.\\\" It is apparent that Orsino\'s love is hollow. He is a romantic dreamer, for whom the idea of being in love is most important. When Valentine gives him the terrible news that <b>Olivia<\\/b> plans to seclude herself for seven years to mourn her deceased brother, Orsino seems unfazed, and hopes Olivia may one day be as bewitched by love (the one self king) as he. Fittingly, the scene ends with Orsino off to lay in a bed of flowers, where he can be alone with his love-thoughts. Later in the play it will be up to Viola to teach Orsino the true meaning of love.\\n<\\/p>\\n\"},\"properties\":[],\"class\":\"BuilderTextElement\"},\"builderbuttonelement_1393965942_53163b76e666c\":{\"content\":[],\"properties\":{\"backend\":{\"text\":\"Contact Us Now\",\"sizeClass\":\"medium-button\",\"align\":\"left\"},\"frontend\":{\"href\":\"http:\\/\\/localhost\\/Zurmo\\/app\\/index.php\",\"target\":\"_blank\",\"inlineStyles\":{\"background-color\":\"#97c43d\",\"border-color\":\"#7cb830\"}}},\"class\":\"BuilderButtonElement\"},\"builderexpanderelement_1394062193_5317b37137abc\":{\"content\":[],\"properties\":{\"frontend\":{\"height\":\"10\"}},\"class\":\"BuilderExpanderElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"1:2\"}},\"class\":\"BuilderRowElement\"},\"builderrowelement_1394062652_5317b53c906f9\":{\"content\":{\"buildercolumnelement_1394062652_5317b53c90615\":{\"content\":{\"builderdividerelement_1394062652_5317b53c901fc\":{\"content\":[],\"properties\":{\"frontend\":{\"inlineStyles\":{\"border-top-width\":\"1\",\"border-top-style\":\"dotted\",\"border-top-color\":\"#efefef\"}},\"backend\":{\"divider-padding\":\"10\"}},\"class\":\"BuilderDividerElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"},\"builderrowelement_1394062641_5317b53112a36\":{\"content\":{\"buildercolumnelement_1394062641_5317b5311291a\":{\"content\":{\"builderfooterelement_1394062641_5317b5311226e\":{\"content\":{\"text\":\"[[GLOBAL^MARKETING^FOOTER^HTML]]\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"font-size\":\"11\",\"background-color\":\"#ebebeb\"}}},\"class\":\"BuilderFooterElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"}},\"properties\":{\"frontend\":{\"inlineStyles\":{\"background-color\":\"#ffffff\",\"color\":\"#545454\"}}},\"class\":\"BuilderCanvasElement\"}}}',NULL,4),
	(5,NULL,0,3,NULL,'3 Columns','3 Columns','en',NULL,NULL,'{\"baseTemplateId\":\"\",\"icon\":\"icon-template-4\",\"dom\":{\"canvas1\":{\"content\":{\"builderheaderimagetextelement_1393965594_53163a1a0eb53\":{\"content\":{\"buildercolumnelement_1393965594_53163a1a0ef48\":{\"content\":{\"builderimageelement_1393965594_53163a1a0ee52\":{\"content\":{\"image\":1},\"properties\":[],\"class\":\"BuilderImageElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1393965594_53163a1a145cc\":{\"content\":{\"builderheadertextelement_1393965594_53163a1a14515\":{\"content\":{\"text\":\"Acme Inc. Newsletter\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"color\":\"#ffffff\",\"font-weight\":\"bold\",\"text-align\":\"right\"}}},\"class\":\"BuilderHeaderTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"1:2\"},\"frontend\":{\"inlineStyles\":{\"background-color\":\"#282a76\"}}},\"class\":\"BuilderHeaderImageTextElement\"},\"builderrowelement_1394062546_5317b4d264a62\":{\"content\":{\"buildercolumnelement_1394062546_5317b4d26488b\":{\"content\":{\"buildertitleelement_1394062546_5317b4d263942\":{\"content\":{\"text\":\"Latest entries on our database\"},\"properties\":{\"backend\":{\"headingLevel\":\"h1\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#666666\",\"font-size\":\"28\",\"font-weight\":\"bold\",\"line-height\":\"200\"}}},\"class\":\"BuilderTitleElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"},\"builderrowelement_1393965668_53163a6448794\":{\"content\":{\"buildercolumnelement_1393965668_53163a644866d\":{\"content\":{\"builderimageelement_1394063801_5317b9b9eedc5\":{\"content\":{\"image\":2},\"properties\":[],\"class\":\"BuilderImageElement\"},\"buildertitleelement_1394063416_5317b838c6ce1\":{\"content\":{\"text\":\"Property at NYC\"},\"properties\":{\"backend\":{\"headingLevel\":\"h2\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#323232\",\"font-size\":\"18\",\"font-family\":\"Georgia\",\"font-weight\":\"bold\"}}},\"class\":\"BuilderTitleElement\"},\"builderplaintextelement_1394063772_5317b99cab31e\":{\"content\":{\"text\":\"Orsino, the Duke of Illyria, is consumed by his passion for the melancholy Countess Olivia. His ostentatious musings on the nature of love begin with what has become one of Shakespeare\'s most famous lines: \\\"If music be the food of love, play on.\\\" It is apparent that Orsino\'s love is hollow. He is a romantic dreamer, for whom the idea of being in love is most important. When Valentine gives him the terrible news that Olivia plans to seclude herself for seven years to mourn her deceased brother, Orsino seems unfazed, and hopes Olivia may one day be as bewitched by love (the one self king) as he. Fittingly, the scene ends with Orsino off to lay in a bed of flowers, where he can be alone with his love-thoughts. Later in the play it will be up to Viola to teach Orsino the true meaning of love.\"},\"properties\":[],\"class\":\"BuilderPlainTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1394061698_5317b182c1f19\":{\"content\":{\"builderimageelement_1394063806_5317b9be406a3\":{\"content\":{\"image\":2},\"properties\":[],\"class\":\"BuilderImageElement\"},\"buildertitleelement_1394063420_5317b83cb81a3\":{\"content\":{\"text\":\"Chalet in Bs. As.\"},\"properties\":{\"backend\":{\"headingLevel\":\"h3\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#323232\",\"font-size\":\"18\",\"font-family\":\"Georgia\",\"font-weight\":\"bold\"}}},\"class\":\"BuilderTitleElement\"},\"builderplaintextelement_1394063737_5317b979ce2a3\":{\"content\":{\"text\":\"Orsino, the Duke of Illyria, is consumed by his passion for the melancholy Countess Olivia. His ostentatious musings on the nature of love begin with what has become one of Shakespeare\'s most famous lines: \\\"If music be the food of love, play on.\\\" It is apparent that Orsino\'s love is hollow. He is a romantic dreamer, for whom the idea of being in love is most important. When Valentine gives him the terrible news that Olivia plans to seclude herself for seven years to mourn her deceased brother, Orsino seems unfazed, and hopes Olivia may one day be as bewitched by love (the one self king) as he. Fittingly, the scene ends with Orsino off to lay in a bed of flowers, where he can be alone with his love-thoughts. Later in the play it will be up to Viola to teach Orsino the true meaning of love.\"},\"properties\":[],\"class\":\"BuilderPlainTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1394063404_5317b82c72b5c\":{\"content\":{\"builderimageelement_1394063809_5317b9c1da156\":{\"content\":{\"image\":2},\"properties\":[],\"class\":\"BuilderImageElement\"},\"buildertitleelement_1394063425_5317b8410f24b\":{\"content\":{\"text\":\"Tiny Island\"},\"properties\":{\"backend\":{\"headingLevel\":\"h3\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#323232\",\"font-size\":\"18\",\"font-family\":\"Georgia\",\"font-weight\":\"bold\"}}},\"class\":\"BuilderTitleElement\"},\"builderplaintextelement_1394063741_5317b97d68d8d\":{\"content\":{\"text\":\"Orsino, the Duke of Illyria, is consumed by his passion for the melancholy Countess Olivia. His ostentatious musings on the nature of love begin with what has become one of Shakespeare\'s most famous lines: \\\"If music be the food of love, play on.\\\" It is apparent that Orsino\'s love is hollow. He is a romantic dreamer, for whom the idea of being in love is most important. When Valentine gives him the terrible news that Olivia plans to seclude herself for seven years to mourn her deceased brother, Orsino seems unfazed, and hopes Olivia may one day be as bewitched by love (the one self king) as he. Fittingly, the scene ends with Orsino off to lay in a bed of flowers, where he can be alone with his love-thoughts. Later in the play it will be up to Viola to teach Orsino the true meaning of love.\"},\"properties\":[],\"class\":\"BuilderPlainTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"3\"}},\"class\":\"BuilderRowElement\"},\"builderrowelement_1394062652_5317b53c906f9\":{\"content\":{\"buildercolumnelement_1394062652_5317b53c90615\":{\"content\":{\"builderbuttonelement_1394063832_5317b9d8a797c\":{\"content\":[],\"properties\":{\"backend\":{\"text\":\"Click for more details\",\"sizeClass\":\"large-button\",\"width\":\"100%\",\"align\":\"center\"},\"frontend\":{\"href\":\"http:\\/\\/google.com\",\"target\":\"_blank\",\"inlineStyles\":{\"background-color\":\"#8224e3\",\"color\":\"#ffffff\",\"font-weight\":\"bold\",\"text-align\":\"center\",\"border-color\":\"#8224e3\",\"border-width\":\"1\",\"border-style\":\"solid\"}}},\"class\":\"BuilderButtonElement\"},\"builderdividerelement_1394062652_5317b53c901fc\":{\"content\":[],\"properties\":{\"frontend\":{\"inlineStyles\":{\"border-top-width\":\"1\",\"border-top-style\":\"dotted\",\"border-top-color\":\"#efefef\"}},\"backend\":{\"divider-padding\":\"10\"}},\"class\":\"BuilderDividerElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"},\"builderrowelement_1394062641_5317b53112a36\":{\"content\":{\"buildercolumnelement_1394062641_5317b5311291a\":{\"content\":{\"builderfooterelement_1394062641_5317b5311226e\":{\"content\":{\"text\":\"[[GLOBAL^MARKETING^FOOTER^HTML]]\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"font-size\":\"11\",\"background-color\":\"#ebebeb\"}}},\"class\":\"BuilderFooterElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"}},\"properties\":{\"frontend\":{\"inlineStyles\":{\"background-color\":\"#ffffff\",\"color\":\"#545454\"}}},\"class\":\"BuilderCanvasElement\"}}}',NULL,5),
	(6,NULL,0,3,NULL,'3 Columns with Hero','3 Columns with Hero','en',NULL,NULL,'{\"baseTemplateId\":\"\",\"icon\":\"icon-template-1\",\"dom\":{\"canvas1\":{\"content\":{\"builderheaderimagetextelement_1393965594_53163a1a0eb53\":{\"content\":{\"buildercolumnelement_1393965594_53163a1a0ef48\":{\"content\":{\"builderimageelement_1393965594_53163a1a0ee52\":{\"content\":{\"image\":1},\"properties\":[],\"class\":\"BuilderImageElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1393965594_53163a1a145cc\":{\"content\":{\"builderheadertextelement_1393965594_53163a1a14515\":{\"content\":{\"text\":\"Acme Real Estate\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"color\":\"#ffffff\",\"font-weight\":\"bold\",\"text-align\":\"right\"}}},\"class\":\"BuilderHeaderTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"1:2\",\"header\":\"1\",\"border-negation\":{\"border-top\":\"none\",\"border-right\":\"none\",\"border-bottom\":\"none\",\"border-left\":\"none\"}},\"frontend\":{\"inlineStyles\":{\"background-color\":\"#282a76\"}}},\"class\":\"BuilderHeaderImageTextElement\"},\"builderrowelement_1394062546_5317b4d264a62\":{\"content\":{\"buildercolumnelement_1394062546_5317b4d26488b\":{\"content\":{\"buildertitleelement_1394062546_5317b4d263942\":{\"content\":{\"text\":\"New on our Downtown NYC locations\"},\"properties\":{\"backend\":{\"headingLevel\":\"h1\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#323232\",\"font-size\":\"28\",\"font-weight\":\"bold\",\"line-height\":\"100\"}}},\"class\":\"BuilderTitleElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"},\"builderrowelement_1394122137_53189d999cade\":{\"content\":{\"buildercolumnelement_1394122137_53189d999c769\":{\"content\":{\"builderimageelement_1394122137_53189d999b21b\":{\"content\":{\"image\":4},\"properties\":[],\"class\":\"BuilderImageElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"},\"builderrowelement_1393965668_53163a6448794\":{\"content\":{\"buildercolumnelement_1393965668_53163a644866d\":{\"content\":{\"builderimageelement_1394063801_5317b9b9eedc5\":{\"content\":{\"image\":2},\"properties\":[],\"class\":\"BuilderImageElement\"},\"buildertitleelement_1394063416_5317b838c6ce1\":{\"content\":{\"text\":\"Property at NYC\"},\"properties\":{\"backend\":{\"headingLevel\":\"h2\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#323232\",\"font-size\":\"18\",\"font-family\":\"Georgia\",\"font-weight\":\"bold\"}}},\"class\":\"BuilderTitleElement\"},\"builderplaintextelement_1394063772_5317b99cab31e\":{\"content\":{\"text\":\"With its welcoming fireplace, wood-paneled ceiling, limestone floor, and luminous\\nview into a stunning courtyard, The Sterling Mason lobby imparts the intimate warmth of home.\"},\"properties\":{\"backend\":{\"border-negation\":{\"border-top\":\"none\",\"border-right\":\"none\",\"border-bottom\":\"none\",\"border-left\":\"none\"}}},\"class\":\"BuilderPlainTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1394061698_5317b182c1f19\":{\"content\":{\"builderimageelement_1394063806_5317b9be406a3\":{\"content\":{\"image\":2},\"properties\":[],\"class\":\"BuilderImageElement\"},\"buildertitleelement_1394063420_5317b83cb81a3\":{\"content\":{\"text\":\"Chalet in Bs. As.\"},\"properties\":{\"backend\":{\"headingLevel\":\"h3\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#323232\",\"font-size\":\"18\",\"font-family\":\"Georgia\",\"font-weight\":\"bold\"}}},\"class\":\"BuilderTitleElement\"},\"builderplaintextelement_1394063737_5317b979ce2a3\":{\"content\":{\"text\":\"With its welcoming fireplace, wood-paneled ceiling, limestone floor, and luminous\\nview into a stunning courtyard, The Sterling Mason lobby imparts the intimate warmth of home.\"},\"properties\":{\"backend\":{\"border-negation\":{\"border-top\":\"none\",\"border-right\":\"none\",\"border-bottom\":\"none\",\"border-left\":\"none\"}}},\"class\":\"BuilderPlainTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"},\"buildercolumnelement_1394063404_5317b82c72b5c\":{\"content\":{\"builderimageelement_1394063809_5317b9c1da156\":{\"content\":{\"image\":2},\"properties\":[],\"class\":\"BuilderImageElement\"},\"buildertitleelement_1394063425_5317b8410f24b\":{\"content\":{\"text\":\"Luminus Loft\"},\"properties\":{\"backend\":{\"headingLevel\":\"h3\"},\"frontend\":{\"inlineStyles\":{\"color\":\"#323232\",\"font-size\":\"18\",\"font-family\":\"Georgia\",\"font-weight\":\"bold\"}}},\"class\":\"BuilderTitleElement\"},\"builderplaintextelement_1394063741_5317b97d68d8d\":{\"content\":{\"text\":\"With its welcoming fireplace, wood-paneled ceiling, limestone floor, and luminous\\nview into a stunning courtyard, The Sterling Mason lobby imparts the intimate warmth of home.\"},\"properties\":{\"backend\":{\"border-negation\":{\"border-top\":\"none\",\"border-right\":\"none\",\"border-bottom\":\"none\",\"border-left\":\"none\"}}},\"class\":\"BuilderPlainTextElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":{\"backend\":{\"configuration\":\"3\"}},\"class\":\"BuilderRowElement\"},\"builderrowelement_1394062641_5317b53112a36\":{\"content\":{\"buildercolumnelement_1394062641_5317b5311291a\":{\"content\":{\"buildersocialelement_1394121396_53189ab49a77c\":{\"content\":[],\"properties\":{\"backend\":{\"layout\":\"horizontal\",\"services\":{\"Facebook\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/www.facebook.com\\/\"},\"GooglePlus\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/gplus.con\"},\"Instagram\":{\"enabled\":\"1\",\"url\":\"http:\\/\\/www.instagram.com\\/\"}}}},\"class\":\"BuilderSocialElement\"},\"builderfooterelement_1394062641_5317b5311226e\":{\"content\":{\"text\":\"[[GLOBAL^MARKETING^FOOTER^HTML]]\"},\"properties\":{\"frontend\":{\"inlineStyles\":{\"font-size\":\"11\",\"background-color\":\"#ebebeb\"}}},\"class\":\"BuilderFooterElement\"}},\"properties\":[],\"class\":\"BuilderColumnElement\"}},\"properties\":[],\"class\":\"BuilderRowElement\"}},\"properties\":{\"frontend\":{\"inlineStyles\":{\"background-color\":\"#fefefe\",\"color\":\"#545454\",\"border-color\":\"#284b7d\",\"border-width\":\"10\",\"border-style\":\"solid\"}},\"backend\":{\"border-negation\":{\"border-top\":\"none\",\"border-right\":\"none\",\"border-bottom\":\"none\",\"border-left\":\"none\"}}},\"class\":\"BuilderCanvasElement\"}}}',NULL,6),
	(7,1,0,3,'Opportunity','We closed a deal - Sample Email Template','We closed a deal','en','<p>Hello!!!</p>\n<p>We just closed new deal, please check details: [[MODEL^URL]]</p>\n<p>Thanks!</p>','Hello!!!\nWe just closed new deal, please check details: [[MODEL^URL]]\nThanks!',NULL,NULL,7);

/*!40000 ALTER TABLE `emailtemplate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table emailtemplate_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailtemplate_read`;

CREATE TABLE `emailtemplate_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `emailtemplate_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `emailtemplate_read` WRITE;
/*!40000 ALTER TABLE `emailtemplate_read` DISABLE KEYS */;

INSERT INTO `emailtemplate_read` (`id`, `securableitem_id`, `munge_id`, `count`)
VALUES
	(1,1,'G2',1),
	(2,2,'G2',1),
	(3,3,'G2',1),
	(4,4,'G2',1),
	(5,5,'G2',1),
	(6,6,'G2',1);

/*!40000 ALTER TABLE `emailtemplate_read` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exportfilemodel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exportfilemodel`;

CREATE TABLE `exportfilemodel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filemodel_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exportitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exportitem`;

CREATE TABLE `exportitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iscompleted` tinyint(1) unsigned DEFAULT NULL,
  `exportfiletype` text COLLATE utf8_unicode_ci,
  `exportfilename` text COLLATE utf8_unicode_ci,
  `modelclassname` text COLLATE utf8_unicode_ci,
  `processoffset` int(11) DEFAULT NULL,
  `serializeddata` longtext COLLATE utf8_unicode_ci,
  `isjobrunning` tinyint(1) unsigned DEFAULT NULL,
  `cancelexport` tinyint(1) unsigned DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `exportfilemodel_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exportitem_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exportitem_read`;

CREATE TABLE `exportitem_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `exportitem_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table externalapiemailmessageactivity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `externalapiemailmessageactivity`;

CREATE TABLE `externalapiemailmessageactivity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api` text COLLATE utf8_unicode_ci,
  `type` int(11) DEFAULT NULL,
  `emailaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemclass` text COLLATE utf8_unicode_ci,
  `itemid` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `item_id` int(11) unsigned DEFAULT NULL,
  `emailmessageactivity_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table filecontent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `filecontent`;

CREATE TABLE `filecontent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `filecontent` WRITE;
/*!40000 ALTER TABLE `filecontent` DISABLE KEYS */;

INSERT INTO `filecontent` (`id`, `content`)
VALUES
	(1,X'474946383761C8003200E30000CCCCCC969696BEBEBEA3A3A39C9C9CB7B7B7C5C5C5AAAAAAB1B1B10000000000000000000000000000000000000000002C00000000C80032000004FE10C849ABBD38EBCDBBFF60288E64699E68AAAE6CEBBE702CCF746DDF78AEEF7CEFFFC0A070482C1A8FC8A472C96C3A9FD0A8744AAD5AAFD8AC76CBED7ABFE0B0784C2E9BCFE874543008100A1476606088B7E9A4805E0F97C8F16A43067A0304017D06866D041389736E7901079302128E8B814307010800830312089C009B7DA29DA5239015A7A487994288AB6D75029212B400B607AA8C15B9BBB044A2A00086967312C79EC9157A02B601176E080795CAD2CCC5C240D1D7AB00ABE0E0139B93B7167BCF12E3BEDC3E8EBCECEEE2F4EE148504DB15077405E8EDDEFDC0342160387B17BC71A857F09EC01CA202D499B0EC133664FB1AE999A86159C566770F7338EA3301183A93F258E9E97481E43294217510B3D02A15809AAFD20D28D47294C59BA36CC6BCA168D2244B8AC05D2257F2D0BF012929CE318428A9C3A134D4E971274011475D5EA765DB63C1C022967EC2625DCBB6ADDBB770E3CA9D4BB7AEDDBB78F3EADDCBB7AFDFBF80030B1E4CB8B061B81100003B'),
	(2,X'474946383761C800C800E30000CCCCCC969696B1B1B19C9C9CA3A3A3AAAAAAB7B7B7BEBEBEC5C5C50000000000000000000000000000000000000000002C00000000C800C8000004FE10C849ABBD38EBCDBBFF60288E64699E68AAAE6CEBBE702CCF746DDF78AEEF7CEFFFC0A070482C1A8FC8A472C96C3A9FD0A8744AAD5AAFD8AC76CBED7ABFE0B0784C2E9BCFE8B47ACD6EBBDFF0B87C4EAFDBEFF8BC7ECFEFFBFF808182838485868788898A8B8C8D8E8F909192939495969798999A9B9C9D9E9FA0A1A2A3A4A5A6A7A8A9AAABACADAEAFB0B1B2B3B4B5B6B7B8B9BABBBCBDBEBFC0C1C2C3C4C5C6C7C8C9CACBCCCDCECFD0D19902030103021606D5D7D9DBD82AD4D6DF14DAE2DDE6850401EBEB051402ECEBE300F0F1F325EAF1EE13F5ECF3FDF208190858EF800404ED00145887E060C285011A9A1818005B418701DC41948830A34286FE83B4ED031090DEBA0925EBA1AC7842E4CA6F2A25A43C2993E5A18EDFD41198A053424F9F01765E60573300079C408502F8F973695044F924561BB9708084A913AA62606780A2D10D51AF7A94A0150056B2D60ED51B59D2E4D7B6312F2C2C3097C3DA97FC68C2A529709D55BC1262EEFD7AA123480D14FFD61C27D8A6DB4207FC4A5C9CF7ADE3B872136A886C6D32C9CB7A411316542D80410A673FFE4D5D160345031B4A9F9EC03AADD9B1AA09D5835DA129D3A7493594567C61B705DFC0912B05D471E43BBE3309B7CD16541D6F0BCD8B43B71977FA9F7A9E2764DF8851E3E10BD5BADAB600BEF0C3C3E3CF032A1D6F3440C76EFD6D25FA7934EDFA7CE57F37DD7DF7FC415F3C1584C34D82DE64C0CE3E10A107A07F0A1658A1341866A8E1861C76E8E187208628E288249668E28928A6A8E28A2CB6E8E28B30C628E38C34D668E38D38E6A8E38E3CF6E8E38F400629E490441669E4914826A9E4924C36E9E493504629E594545669E5955866A9E5965C76E9E597608629E698643A1201003B'),
	(3,X'4749463837614402B400E30000CCCCCC969696A3A3A39C9C9CB1B1B1B7B7B7BEBEBEAAAAAAC5C5C50000000000000000000000000000000000000000002C000000004402B4000004FE10C849ABBD38EBCDBBFF60288E64699E68AAAE6CEBBE702CCF746DDF78AEEF7CEFFFC0A070482C1A8FC8A472C96C3A9FD0A8744AAD5AAFD8AC76CBED7ABFE0B0784C2E9BCFE8B47ACD6EBBDFF0B87C4EAFDBEFF8BC7ECFEFFBFF808182838485868788898A8B8C8D8E8F909192939495969798999A9B9C9D9E9FA0A1A2A3A4A5A6A7A8A9AAABACADAEAFB0B1B2B3B4B5B6B7B8B9BABBBCBDBEBFC0C1C2C3C4C5C6C7C8C9CACBCCCDCECFD0D1D2D3D4D5D6D7D8D9DADBDCDDDEDFE0E1E2E3E4E5E6E7E8E9EAEBECEDEEEFF0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF00030A1C48B0A0C18308132A5CC8B0A1C38710234A9C48B1A2C58B18336ADCC8B1A3C78FFE20438A1C49B2A4C9932853AA5CC9B26589003063CA9C2953C0070304040C083040000103240AE88439E040012F046A86C039B4E7CFA043791A754986A6559A033A20387035800004200A741D00340B0201336D7AD8DAF56BD8B165A97EE94A37EB06033BE90688BB81AB5E025892D254CB01AFDEBD1EFCD2052CD7CB61AB763318780C932F06C57A8F52316C95B086C9942D5FC04C5773E32D946746BE8020EFE3016033884D1D3B8AE0AB9E31B44E0D5BC36CCAB54F63C14AA0B8F1E3C54D8FEE9CD3EA810CBB551338E03A666E269CDB72200DD3275A9ACF7557273A7DBC57E15A069B4060D5F46F99C129DCB63E21BA4CD149E66BD7C09EA67BABF14DFEA0DF7912D817137EE845A15E0903863701778C59305E6F1380A6141306D2755D050D56002106130667217D095AB12009DFC157417F1756F01E4C114E90624C011A31624C03BC48600633C2141F8B24BA48538C12F418408D253A71E208135ED0A405DC05A8A372496096A3044B3AA99A9632ADF6204D52FA9724155986502600465E7026006B1AB1D39513B489655A17A469C19A728E99449E1B60C5A54C16000923063D7A99840154B249A7067E4A4853A04312BAA59E0A2E8AE2A3775A3AC19497812982910150A9E38E29E46967056572BADC4C48528AC4828812500082170C286AA41CD284A08EB466709583127007130B79DA2AE44C440230E0AEBAFEBAFAC46004987740ABF5355AA07901468981AA2074155C57C46ACA9AB500647824949E5EC0ADB34BA40653A2160C2800500618992C9A985E706300F7F679D57F5785DB6206F2D26B6F9DF95AB06FBFEC16E1EEBB1C808A1B88938E3B13B01EEC876FC02BF0B9F1631B02F0A4C53261DCF0110F57B6DD63264F3032A4178B8053B49E0ACA5371BD8AE03100C28297C1CB2BFA7CB21229F3D4C180C86A0034AAE282B03000EB76DC34C17F295DB19A530F3DC4550480C596981A208D2BD603675A76083DDA94360C3B8B9D340672EEACF50ECDE16899BC1AF4EC1CDC59CF79B6D3BA36FB82C77A0B6D769064233EB7110814401D7ED86280B44FC2DE1B77DFFE89A91633DB984B30F97456598EB9DC8B1B612CCC33C5B5EFB94CFF1D67E71CD8CC6A0C79CAAE3A808777C728ECA5236173CB46DEBA39054B5340BAE45DB52CB5EB3282BDA9E12E5F9D3BA9BD4351A6CD1B1A195FF105424F82EC3ECA2027F608CF4EBCF414FC5EFD144B9F7EAC4C44725FAEF72420CDB00A72BA4F818EF1A35FEDF0EB7B82792CA03D9229EE540A1B9B0956973314C8A980A83B60C22AF0B40042018112901FD0B4A52FE7990054215B9EE22AA041E97130813381970593804145316F80F2119C05A2368251418C76A3EB1B0C0524C3F7C544852B3CC2D2DA84411A062B5D26300F8EC49743E615D183143861107B808068516B6925EC52FED0DE46C009D6303338649EC8FC9741E9D9AC5F2D9C220EBEC6AFDD95AC8B33F155D3F0C4BB0D8C473F8612A1EE78E4C5D79D8D8E6254A30C6C86A433C60B8A12E01FBACC47810A32684B3DBA9F09F28748A829F0888CACD025057983F1286F5928FC9B9144A3480F21710486D411B55E82B97D65AF8789DCA41439798301252B43791C63EA7C4814BE754944C75BA48A5C1813E59D204FE6B18C8E72891560D691962D905D8CCEB2C958CA70752AC4DBB52AF901F5617298021B212F5526016C22CF52E60222346580B4A2800E771403CF3BFB66AE01942798E52CCE283599169C95A000C8214E72E279B17932AF9EF77CE63A5BA0C4C57CE661BDB2E155FE1AE84B727DAC8F1973170656479788BA8BA20B7581B992C7018972338A9451A7BFDA33CE98B03235B2498D4A7996D290F260A4F4DBD66366FACDAE4872A57D0417091EE69B9D66AE6A36ED41E1E0E4817AB565952D250A48E598D39EBD943277919857A0BA3FB824F507558C8A5478AA2FEAE0E800537551548A42D60D800A3FB20B21071A0A990E18C0AC44412B54F2C2D6AFFAF5AF800DAC60074BD8C21AF6B0884DAC6217CBD8C63AF6B1908DAC64274BD9CA5AF6B298CDAC6637CBD9CE7AF6B3A00DAD68474BDAD29AF6B4A84DAD6A57CBDAD6BAF6B5B08DAD6C674BDBDADAF6B6B8CDAD6E77CBDBDEFAF6B7C00DAE70874BDCE21AF7B8C84DAE729726CBDCE63AF7B9D08DAE74A74BDDEA5AF7BAD8CDAE76B7CBDDEE7AF7BBE00DAF78C74B5E8F4400003B'),
	(4,X'89504E470D0A1A0A0000000D4948445200000244000000B408030000004233C35800000300504C5445010101100F0E12120F1817161F221A21201F303D002626263035293C37342C3C5822491B384604395D38374968783B0344423D58513F63761B4744424F5743504E4E59564C5B595A455879507154615C4A605F5C6B65556A75597F6C426565666C6A686E6F747A75667977733878C74B65885771945F7DAF5F7DB2767980627CA36A8505708907738C157893176B892072872A76B1005D92797292426D87AB6484BC778AAB758EB37E90AD7B92B5549FE26B8BC26A9AD5728EC17592C77B9CD67FA0DA81461092571DAA733887754D8E7D58946B4CDA6161879A198299298499328BAE0A85A11995B6198AA6228BA3319CBB2999B33EA1BF32BDB63A8D9F438A85778B99759585609E8F6E8FA14496AD4298A757B88548AFB856BBAD4EA3C038AAC548AEC754B2CA59B5CD60DEA034E49307E69409EA960FED9813F29A1AE09D29F99D24E6A83DC6BE41D2B441D4A166D9B77BE5BD4DE7B258E7BC72EFCB58FCC275F9D862FFE16880858C938D8199958F9597998598B88EA1BF91A2BDAC9F83A09D97A5A095A5B98BAEB398B3A78EBAAF98BDB39DA5A5A5A6ADB8AFB0B0BAB6AEBAB8B5839CC68BA4CB8AA6D398AAC694ADD297B1D988AAE78BB5FD90AEE499B7E794BBFD9DBCF299BEFDA8B1C1A8BBD7B1BCCDA3BDE3BDC4919DC1FDB6C2D7B0C0DABAC4D3B8C5DABBD6CAA4C1EEACC5E9A5C4F3A3C5FDA6C8FDA8C6F4AAC8F6ABCBFDB4C7E4B6CCF0B0CEFDB2D0FEBFD3F3BAD4FDC0BDB4DAC195C9C0AEC4C0B8CBC5B8CADFAACCD1B2CEDCB2D0C9BDD2D6BCD7DEBCD2E1B7F3CA83FDCF92E8D1A7E8DDBDF7DAAAFFE199FFF0B3C0C0C0CAC7C0CFCBC3C3CCDBD4CDC2D4D1C9D8D1C6DAD5CBDDD8CED6D5D3DDD9D1DEDCD9C2CFE1C6D2E5CBD5E2C8D5EBCDD9EAC4D6F3C0D7FCC3DBFFCBDBF2CBDDFAD4DBE6D6DEEBD3DFF2DAE2C3DFEBCAD3E0D1CCE0FFDAE1EBD3E0F5D2E3FDDAE4F4DCE7F8DDE8F7D9E8FFE0DECCE1DCD3E2DED8E5E0D7E6E2DAE5EFD4EDE3D0E8E4DBFEE7C9E6E6E6E9E6E1EDEAE3E5EBF6EDF1F6E9F1FEF0EEEAF3F1EEFFF8E6F5F4F3F4F6FAF9F8F7FEFEFEFFFFFFEDC8EA0A00000001624B4744FFA507F2C5000020004944415478DABCBD5B6C1C497AA8A9A70164591EDB8220AB218868A25B07529FE9F1ECD1AC00CDECCCD1ADE762EFF8D81E82655B5E7B8E5BA26E7BA496BAA7457001820B5E165CDA26A697B204CA7CA0C04301B5258210C14BD59214A9AE87DC8C4402F544820005017CE046555245662E98D9894CECFFFF119199552C5EA433DE9869AA5855242B23BFF8EFF1C7BE295E2E5B4CB3C3D0611A2FB3A98952B95CDEB0B8C7CA75B586AE3B6118DA9A51C6A1851AFEC334B32C46FAE1008E61319E3E4D27C73331466A8D4769F548BCA9E207D34F9FE2AF7B324123C7C5DFE2ECCDDCDCDCBD5F7FF9E597BFFE1C1ECDE19316575FC527349911327AAEC458C8C5AB063EA3052E2B1B9CD1055821635C0B03B8364713EF117FC2B0E02BFC67586158E474C5135393CCC139D0E87B1BE680DE6C180637EC007F9C99A6AEB9A11C4151D3DEBC79237F6799952B47495C8F193D5CA6AB64657EE3FACD9B57E8EDC3D194A66B0E314130D2F29772CDC2AB323837E4338C59F22503EF397E60AE5E2947AFD00BEA1556A29F2995929F567CC3EF36DD8471ED46CEDA578B1380885B0E40146E1D75484CD10F035BD70C6E4A88683A690C3F4C30F43610758DEC08D1700C512EBA09CC301544F780A137F135F292B82965C90A0DDDF33535138C339B3E3B4D2D67214C1E9091C515E2E865010E7EB50CC199062FC0FB0DDB9F84CFC0601282D0E31A2B868EAF0B88E06D3C4BA4590091696ACC8BE6CDD1618AC4EF2CF172E59077D98CF8126B05DE7CE5E6CDEB37F0ED4B6A4E9F6E07919CF1817459A0C260A5187855F0612CF144040D670295B2008C734BF155523CD15BF1597C60253FB1659438E7DA0D62A8E916BC7F5F2D4EB21AD35CF8418208966FE8E52D7C98171021E592A371266E0B638AD5814A88D27B8528B32344729D4939C4E55FE325D364FC3360E8CBCF6700A2E9E5E5652E640D4D81100F56A889F77310494C49CCB2C1E8769B259C262DF03498EC9083349614B15868808C828946598D2C1501A25C092781C491EF8078A33F8A5FE06D9A01BF121932E156B1209A569F6B7A929978C83B68895F2105D1C474B9FCE22A2CF5BBF8E10BDBC8F62D82E8295C125E237C084B0FBDAC60A6444FC897F04FE9114E008E5121946271259EC3AF9C5627E7A6C96149954AD68B1BD790A1AB77F1957D92132FDF1D222CB874EA42DF0339C8384274F8FDF73DEBC0C9434051F33E0511CC03D78923DF1B372DE057937FBA5C18DE1EA2673B4034F4A812A29AEB8C2697D1155AB4C2E0F25F7C4E10BD989B9BA2A907F188B203EFB26590BA8177D1FB4924951857020AB8110A866B2494485071499164B12448E286E693200248B2F05788064B88A320CC1A4CC1A17B401A6724884CBEB16169861F26C491CEB742040AC7906B50903B4DD709EF7C0EABFDEA737C2AB3476D36B044E2C4C28F8F1FD9C11B8322485C8F143DF0BD82C662429F4BBE4C5E8E5F31154E06333B7EC248C66BB7C190B19E375DFFC9A737AF5FB9436FD8A7383979200C252C753AB37CB0230C8028FF3EBCA1BB2B3C7932F40EC5108919068E40A067F3798DE9663C294B4B854C66076D5613A2FE9D209253344482A824642AD86F96E938CE3C6AB32F67DF38CE2B9CFC659209FAD4540EEF1767BA4B368A05B2A128542F0185E68206A831B11C5128C1575A853A52E4EABAA56E2A27FD044B0CE593EB80209A12D70FEFD01D103581A5C14F128F1AFD0EE01830621B389830226371C4AAB5198BF505CDA2450C4DC1A3BB6812D16D7F3AB037419451F2043E8A07F730F4C59F8BAC1E525C7845112BCA1241BEB8198BAB52A45E385CCC4F7EF293DBCF9FDFFE098EDBB76FE03FD79B9E971544C449181EA247279B9113587830E12580E8E4FEC3FB19BE6A85752C8228D2EA302530014CD334240954C3E3B3341EC3875B5A2C64D27B87A87F8F10A9D92881C9EB789EB7FEF5D75F7FF9725EF3DF2CAF21448698AADCC45449F02167ABA4498B19814228D02C3099124ACC82AF2460988114851E6836B17CF13DA8B9D01AD7420341B6D4F320E7426E05A16B68644058C2ACA6BF4C10E1AF80DF9414479A5E81118FBF4B98D513CBF041C1AEBE7E0B9FB306F606110922FC00F0D76D6088333FE4641645E63550240C22F90CB3B608257A05DF14D950BAA0A76A3C6716A83883EF8B38398432E9D0218F38B10C3016D1260209D40DFFBCDF8C844510F1C85A971FCD2A999AAE65B3F9B35F85ABABE1576763B1B447881E0D554054738E9E44F78FAEDE645E7B2AD5D8D8BAFEF2EB20E577B6AF2D4F836FE938651BFE633910530EF2211D0D1BFD290914D37C65CC810FE3A2888255ABC96B33840A0A78D6503719CC6AC083EB568066B5A1EE38683727D08CACE10A71A405288F2C536A29D3DA30E45D488A2310DF86126595DA8D1E0BB31A1ECC815DDD441A631793A85A108176347958C48FA239406D2936AFF155A696A1144A0AB04828E17BE9EDEA151ED61AB0AA4A96904492138008FE79BF9B38E1167A34F06CF7FB61BE2EEC429C0E1DDA0732AB0ED569F479CAD12A2A69259CD7B30F161EC0FFCF32537D9EDF02446A8E08A2E82F97C08374BD8ED6AFBFF9E6EB75B8C71DED6B6B6BAF5C944E341C78E4201FD2800A8B45B86E5D2E3FA1BAD0AC061F46D84E0E53F2056E32F9550086414F44FE7D6045DA8C4C2030AB8B1CBD1B8DC49141209A91A0E22CF6242BC4918DE28809B95805D12B2588CA77AF29077F748F100D2C4BD90612D81148A04AD385F3A86C674399D7603B190A1A7CA1A4444F645F2BD9F441ADA1F8DFA73841884E7687F993C28B47E78CBCB34327F7E7AD7D274F76C1639244C090A13306C62BCAA36806B85015671F8C9E3D3BFAE0ECE0607F1E9C3CD3DCAB248A9DB39D214A48650642C70188D6DB5B2F7AC7C3CEC65463CE678D8DED819B4AA55CBFBDF15236B48901132C045FE39A1B82E2125A08A197660C2E1874E29036A15C8C92CE1C75B7CB917F8FBE17D8EE7A2441509B6902065D037114FA78E7041CE6864D16AC329A2D56258EB22C16476A29E2FB73E821E00FA136BB412FA777D1668AA102DAE3A888B4009D0419EA122AAD1C7B5B89D091FA6CA54AA164B2845082CF85CCFCF0830FCEFE10063CFAA18088471011270411DB7FF2509E38D17C4342148277EFE5F3799674F1315260980C8721245A0CD166186E3E384B26CCD0E0E0603E3F383894A960A81644CF768448CED1941202244BE8EABC8EF6AFBF6E6F5DF78F7B9D1DC178CA6F34BC146FEDF43A3ACB9D9E960A9994DC9C440FBADC20B4350F749329840C28B3ECB4259C38B02923E900C2C5512E9521FD7BDD734110BDB2D0B7A1256407AECB84F6C2301D431DA889756F6E6CD83691C6C50D4179B8451C5955914714E0A5D2F234F8F7E4E037DDC367778912C5820897D93223C74CB813F8974D52694A3BD12A51BA2D3695545052E0060676FC8A61980680132C063FEC5D5C5C0D3F180A3657AB210A290AC442150FAAA3B02C27EFAC56B0310AE381252450429F5A4CC6D9AF56373757BF3A9BB8E48C446930B3439CE8D9D01E20429F45390C5C18A102A27680280088C2E3DE7110423CA5795EE077A41A53AE72E8A5B2E29A1506AC48316C0B3F33081703E0CC816903720D649B5BC62F0ECE1EE828213498F0EFD1F7126E134C31DE068C561B16692F62CA0A7490462E4723DB506635BDDB50B46895E2C8D0AAC2D7896F6F816F76F5053ECAEC4D9B0D0C98C26A0429CAD45FB64A4639F2D2B8A286440FDA3D112BA61E8B1EB2BC4B2A7C85EFF8E083DEA10F161F0339F02578FCC350404477A3B4AF362722105D573B9C9D0860D26F21B1A449497476657575F5ECD92D971CA3B44DC4FAED206272B6BD7601918710D9CEC5F0B8E5F9416ADCB19DEE94CD52B6B004303A2DA79581EB1BDABA9C62F2D90022C0C1053BCA7735CF29BB6503BEE2E4191A57D142E00104CFA4B056505BA1420F31C9119952603131115E748C2CF866F646A4EDC18595C1E12A7124C2030985266F7EB9FC86C2D5F4DDD31DA344B1207A0AAE1D034E78183B63064BAA34AE299F08849459299458F40A4B80265C39D25F412FB0B4F9C1077DC16601D55B09E70066619BB4070BB4E4459123C78C928A8D47CE59EC9D4A881E9F1D3A7BB6EF6C6FEE49BA56982881D28E0C3DAB3549E8E14F512E0BAD6AF1A7BD56A1CE5C8028956D6D0F3A5AB3AD8ED6A8A5B26329AD3505307056B22810C4244659A0A828AF0F15DB069F9EF442DB6A4D7538A0165DC761EDBEEB5824988ACCF1CA14E1311C23F4969797414CC140F1A3B90E7863423FA06423B39A936D84BA0A7CE9A42F1F8B233E39991447AEA1258C6B69C9F2F24C1386ABDF4A9B15C4CF2AB1ABE028292FCD4A38F418FD897022A114F96F2CD6712A9C0EF87CB09A812F2B7DF060A82F380B3CA99BB06F5C6796AB1686E780F59705896B79514A2E76C4AC12374DB4A7CDE8B978A545621923D6C38313134FABAF3932899E65323BA1B42D448324899631FDCA4BF2CF39CF9F7FFDF5F3E7EB4E7BC08CCE31F0C7C63B99EBEB1D7AE0758F399D1EE925CDF734949AE4A77123E4B634B0311302C64B117C19FB920EAE9E771C05120833DF03E7CE852F7E904D897BEDB9A10B0E20BEE6D1EFA5DC2B97C9158C25B932928DAE1AFC004BC241A4893B083A7162723B716428966E44DA6C37075F3134203DAA62A0C56E9625A387A4D228FF1199CCB1E851FE84F8785624C722B7008CA20CD941E10F3F380BFFC1FF3F8884C83E34369996D5B9E529C1ED7B9667979CA4AC715CD751BFB80432099CDA12AC543B4A999534614794CB94F4C84C4C6D1BAF56EA2C4629B3C5C37F566B924498687A22C74AD15A7933FFF5CB99BFFDD9C7307EF64BC7730DD70639035F603D807411371B3C2F69C1C23AB4D01B6320DE312A42614663032073B2AD004D8777BCB5B1D567A920D5996A7483B1C64B6341E3C58EB0A3B1510B2EF9D6F157CEC52005EF715D34811C4F0333C352AE1AE76FE46D11E2282856EA2AE9B7E54448BA521C3119A451911934ABAF5FA3C73B9B44B120925122DDB70D21F7542493723DB14A53B50491E8E14C464E10379327824A2AA6C41FF585AB8B4304D1071932AC07A30FBB2F4A7B63B010E603E69DAE09B0B1A36B723CC371E3C406B77129DA001606A9A5F8B50DBA614B045161E2C9AE102551029810A5DD21D2CBD3E0C41A91B49EF9F5979FFFFB8FFFFC57FFF00FBFFAF38F3FFA57649E83E4F64075810A3384020389A1ABC007D08E4AC74203DBD08AA1669AA60EAE9BD7D1E18196F28EBF5A6BE408D1B8D73E1674C01301F8787A2AF42F85EDFAD8A54EAD3538EE788D860B04DA987BC53C3F4E3C875F86F51E6A9D0B71E424759530788CA909392AC551314A9EE0C02091D066E5BD69B30115AE9695156086F18448512ACD9088D07C48050FFA27CA7D70917A51396B89139FEA90DE3D39FBF0F5712C62F655148B70944A5A96EBE0E2B43A8E65956D8E0680EBA774CF72C478053EA4D76EB8AED1EE71C7B6805E782BD752684D4888324F86B6CBBED6F4CE325D841249A5ED2042FF153C7C346CC11D949FF8DEAFFFE2A3BFFA0739FEF6A3BF81AB025B1AD69C9DA5BA0F546022222D7F84AB9A22038346E0BF63C946E01044E53560666D2DC51022CDEBE80CC653A9E33E40D4D9E9FB29A6B5B776B7768C07C73D2FA5B96002D92A4884E6163065440CD15FC80A7114EB2A5919000B7F42554655386B0E8B326B6FAEA136BB33B55CDAC524AA30ABE9CFDAB141AB476A0D65307CCA30C4F82906D9B8D264C2768EF264BA92413C5974C4EF5C4D55041A1F8B4B11698FCAF21631D12E00E18DA57CD4FDBE87422948319FBC1790FB6B6BD3D36B3089F02EDFF161C07B3C07BE735DB0210A898AB4BD432472F8196577676AAE34E1BE72AA5D50F6E1677FF9D1AFFE73347EF5D12F2D7B6303D65C1183160216558A26F2F722792F66001C295B334CCCC51A6E168CF0572980C89110B91D9DFC1250E519A970AC33741A1D27D5E835A62C80C8859799EB82DE2849B31A2BDE12824848E7C83A12E2485606D01550449142A795CE9A2D336B68565FBF411521853D6AB3821444413122273731A52B0B16F1C00807E971961051956568568493518EF2FBD61D50AEA95331438F101E2C96B084244AB858F2214104721C2C824EF09C3D0DE61426D60517A8DC984ABD5A43883C7C9A35827500EF6B6CF758CA6BEDF036D2BBD581EC0091D066E94C25494F630F7F5AA6A4F10218DA2273FFE5A3BFFDCF89F1B71F8D991B423B934E2B576083597B518926BF87190D40F4629C1108E9984C75544254BEA47500319778F992DE091AADB1D56B87A939EE39F072A2A4D124B3DA9B5C2E2787B0B8A5758470244A94C80E5189DC4A71E417511C6190A8E92EE53FD27B72F095598DDACC900F4D21EECCB29A35FC3C70D15C636664E22AFB9A549F2A4313731865F19121F83C6D2252FDC35E953C15FFEE2BF1288B0CB6B292448D9AD6DA1A743A147E511079F49DD3997500A2D68E8ED654D0A8FB1D63DE45C74F992C056BD91BDDAD34B676AC716B0E5F9084B1EED8C39F12E24496B882B368BCF8E92F089EDFFFD6B77EF7BBF8E0173F97156B5C479D066BCEC0C257A5B199A8445377D9B6342F7449DBD99E3BD63EE978ED6BEE986D8FF96396A7E981D6618D7961762CB0DAC7DD2030758F677DBFC371C62CBBB2A411CD6A50B7498C545A538A238F93E96C45B6A525C3E3BC5A1C852E1FBB0237ED0AD537EE92C1AF36AB197C2A4B06C97561C1534A8CCC36F2CE607D4571F572B20C8D2959A98A8ED42B82A16BB7B8347D222BAF24212AC9A798410A0E7D7847BBD4D13186BE6DAA1A22DE98EA74D6A69D54A7A675A682E3BEAFA758CA07FB815DBC08A6756677886AC5861ED52C0491226948E5F0A5AD9708EAFE4FFFFEEF7F05E3F77FF7AF7FF5C7DFFA6B78F4F7DF69138E3C133A8D839CB15959AD3B95BC97D3E7599393462072020EE8E2B5576B6B65D7131ADA15595CAC5E84072E4836305A2C7A1E9D55165497346627B0886359B96389120F298E50C658717C44BE839EB038D7B1D05D8D2FC0ACBEFE2969B3A53D6AB3C8AC16CADB002328A772B925268B8484B78F18599A2824344A5B9D7EE1C4454547CF05439F46BA3A5E07F47AA4CE40B74702CE2175E69B97B64A22EE2CA7BA2375E65F74DD6C6B11206A1F67A98E56CF4D0F6CB76E766268270F7F0848EA1F428854B03AE134FFECA77F0FE36FBFF5C7F0F577F1CBDFFFECAFC98814850CA8D3BC44164925EFE5D07D061E92132AC5C7265499402256E7A8ECBE1DCAEA6B5A8958901426A2D5A25A4DDC3419AE4908251447C27436B2B1B3A6AA774A22CE04EB38AAC9A620D11D2220B3676D46341A91BE56F6BB9437AA0A8663F93DE6051DAC8112AB40E542629CAC92D0C6F0C48BA6EB950C25AA5708A77D5C5E0086E2D42B6813BD79E394D0220007456B4588CA97B29D8054ABD638E62C3BD2B06E6F1D6F644163E7D82517204B65BDF46E82A87694BA2BB32D4428AF870641B3C9955651E6FE5382E8AFBEF5677FAFC6CF7E2EE64F9A89A0D35C118041510ED60F4B64CD71E3C604AC5C0A1AA13110436428ADAF856114DC0EC3A8E4084D20CFD1A9A8821494A8569B50D5D1D51051E5916E0709D339566C3CAA06D385E60BE72948E41AE393A5B7D06626967B3A6EB40200969C4CD350A4B5548EE706F4A72BD23371DD103C5445D87180C86037AA1952976651C810BCB37C3E9BD54041B2D8362A834A46883C1D2C02D71FEB6063C158D9D73B8C8E00BED341967B6396EB82B9E08D7518BEEF74761A3EBC95777A23EFB25B68C7421055D5D89F17964DB2BA74EEA7BF4070FE1C20FAE33FFC4322E917BF146B5C14C182551DA04E9385065EA059661CEFD2C2491044F01C189B3E08233EA1B27306469719CCBCEEC529042D104545514923783206A6A02C8A124F5632540511FCB066191A71E45186B69C506C66F466D07C2024B02EF6DA17983CD1B5A1B7D06658921ADBB8E806B2B80A53CE09370CB9AA2447F86130DB4A90A9C8525474C4A824FFDA8D044325F2CC307721D6C13ED36458DB0A23AB81C8A30588E6C11BA4481A069E17600C087D7D4744FC65CD17252DF1816B8937BAC3EF06D14E82484E53BAC4F21A562830239AFC1742120988A43AFBB9DA3481B3805675E4A77199BC8F4A0A71F74F96269D310F935D1144620B18D8A72C8CBD39F8792C6F240982C9FF807C3391CF679E3D59C950953A3342597C9BD56D11114ADA7689871C6F2E99D5DF28676D70700FC9574B09BC6CE4D38B0D4A465425059FC2A0DA58B9C270D78EE44833F528F0284AD05535D22DC1D06449ECF720786279232092D758C992F1E68D08792452AD22EBCFC9B7563544B1E0948F96768B128DEC36B685089D0F53CB6B8619154C95677E2621FA2E7CFDFDEF12447F855135B16070372258D54CFA69F88D2888304DDA0D111427272D19DE052B3C609302A21265E6F08A417E24729968D6A0C8270C3DE6316956A33AF290C0A9691822246B57420412CD6034FDA592A1714FC420239991D8E650869FBDD374F3D6ADBB71F0C831F283B028FB7A613CDED937038BDF328DA8365CA2135D8345C8AB301BA212E9B568EBA0728011277E0BB7975D6F9A9C62A6BAEDC905C2559C28B15E244B9A2663F589F46B39F148BA719173585609E1C2BB99447B816891FE80C1F259DCD125E0BEF7971FFDC5DFC1F8C3DFFDB3BFFBB3DFFD2E3CFA8B8F7F592E45D3A1B9C2AA263F2D4BDFD0222C994223692088549E01941D55854CA198368438C3AAD8A437E7608E4B26E142166A8885C141405BDC2F4FBF7AE5ACAD796B41E0618AD6A6FB20F66A31906828C35058D3DF129E18161EC9F5ECE2A0E423CAF34FAFDF9A9D79136F5923E4FA7B7A060B85C73DBDC33BFA662464C8374BE4A962E9CDB952665654FB9AD46B34C92A21C0B870EEAF3CA71D4CF13095D0C404C77825447294382E7952095BF3F5894758BA42697DAE76518FFE1B4384AE2A6A3553CCCA679FFFF4177F47147DEB5BDFFA7D7CF08B9FFFDF84B89494A19A27D069BEDCF7416A0EAB418BFEE4A4938004779C19935362A35E59181811639128D24C4C49F16C28535465B01D6DCF61DC591B739ABBBC638CD505DDCD2ED67F711958319843D694D7D5E5A95924712436C6A2950E3AC024C2BCAEE637376EDE9D7DCFE5499F3FF4F359A2CA7FDC335C032295C04FF86646A446182932F930AAB4348C92DA059AE00887A63331044357EF4C4E4E6A2C31345DD3C641015A8EE787614D8848FEB03CEE44E634408C25B08E212A49E6988E13665540F4160EFECE397C394F4B42E2D1CE52C28897E73EFFF22F3FFEBB8AF1719B10E3B4963056ADF223CC88367B809AC3ABD17D7BDC09B99E481D82E472493808171037D36BC214E02473D0419369010D2591982CA7BED92EEF6F595BDB0F8BC9DF9FCDEE0FE09D64413AAE10312809312BD4D2E2B9EA0587973DD255E0663BDEFE9696C32D3EBC1A58FAFCBD2F6666F6C36FB08B4E248EB468C7C5E3DEAD0E7E466E83C3047E440E6E37118C94CB12231E79AA22DB21DC0CDC0C6248FBC84A0CE1DC37DDB3B60C4AD3FB1E7C76A6D79644B2BF00662DCBC25EE6261385F9159228363935AABB86D733BBE43CB671CE862A18AA99C35F2A8B5D7434B43C8A24DCFCFAD35FFC4562FCE2BBA60A68830528A2422284CDECB0A8FC34DBC0A700033F8C360BCB893782B0A8C97DC3184BB11857E28464134C5D5640E4B110DCDAF12C33BDEEBA40DB5FEFE60F07AC181044453DF0ADBCE907BAADEB9E9DF743DF31752F686931F3AE6F69E087733FEFE63DCFDCF03702C6DDFDA000F7078E6E334B9B9FBD736766BFEF7B79BBB0E47AA689224B8B65522C8A92DA0CFC49438B05AB25A20F068F8C230B454F74256A373E8BCC6ED26B8A1227B4ADB96BE4DCDFA227C24A8A1843AF9E9191998428329B5478178C02C7EB68EEE8765C6509E1FFD4DBAC18A2BCF2529732E9B70E570344E9DD21227BD032D5D0E0EE612B87FFF9A3FF94181FFF6B29EE70A189AD1E346358DB38893A0D5EB63730840D923F08290FC9131A0B5548C0745062B471DAAFA880E67C1C9E038306EC00E67BA14B25589E6F1E729AEBF77B2D0D415D8B80A80534DAE1E6C3DD415D5DF3A186F7EB8F84F691FABA86A0E5C8FB754702ADCE039914ECAF6B0E1AEAEA8FB4A179B4DF71CD4341F6F091EE9663EBED872E1E03A28E34BC7FB87FF3645D5D5D189A28883E8101FF3CEADB469B81BF19D983CA472B19519A0C43D2A5F86194AE07011119B74A5F39A0EB294074FD06E9B66C984DAA33A6C043542B2092858BCA2203510472B6D9B1341B5D7C741B682671EF38BEAD143B679A3035E4E75B5A7C5B88467687887E753182C864598DFA81FCF4A709867E4E7322260A2B402CB50635DF03D76B12648FA3712ABBD2AD50CD7894B816D7E2E1EE57AAD1171B1F95FD883600BA5564078441004E13D3C635ADE41CD28EE4EBF2EF7713449A2620CAA384AAEBF6BA0F59CE112D7F04C0095A1A3CEF485E416406ECB0E735373BA046F6D7D51D6A0BB4C320AD8EADBF777BE6C5FEA0ABC15B3D927F746465E548B793DD8821323B65763AA9CD848E2DE696A5F59308BA1BD1BA6751C8D132A24259980E653245BE3B6602294074BDE9857C22E16124BCF66A88E484034B4B9902FECEAC09101DC36251B3A3488521E8BBDAD1DBD06212B5DC5A5994545A8572A150585A7C9BE4EBCE7675254425333118F503F92F1FFD8962E84F3F1A837760E4D692854351AF0B2B14C9C849D069C5AC45B39248A325555A5967E0A7912D9255ECD8910D404E15D80159CBF564D4CEF1DE6F3BE4B5B51C66498818C81C8028EFE5EB3CA72EEB371F6936419D01342D0A222FE8A2478E667AFBC370E34837BCD70788F6CFCCB8FB83FA166FA52EDF721824D1E062971643649941511BACD2666591F2C04015035B282EEFB68C4A460446E4A4264201E22D51C1AC154C92730F46B5A4CA4FE4021369035E132254AE99070F1E0C0C5996A695EDFA86E671BB5E6BB0DDB6660D7C57D70F3CB40ED12B0577C28275CD3432FFE1479786F1C20A85DF3E4499C534E0594474D5A07E20BFBEF7CB8F6365E688EE2D96EA16A39A8068A12563815352A7D1D6B3F89259D209B3C888758D3088D82932368E36401628A23C8A65789EBC51B6D756F7BEA7D51DF293EAEC709B9B4F40C44D1B441242D41043E475D5B92E3C5776409DF9615B9B5667BBCDC7D60FDD99F7F6070D0451D7FB2B30167A1FC710B10DCAC2E507ABB419735C7195D360EF46F17063B99A11C44895E8F108081003662C882CD1C3AAE9AEDC49A43995BB0EA44042A564D482889710A2070F96C019DAC8366F6C784EC378D1EBEC761A827C4383E6E5B188DDF1C69B616D817C2A471E3E4044E6CBD236BED99E760BD586E8597A38937E98CE5443F4F98BF2CFFE540AA2EF72DA9A48813383BA0000200049444154D7A0AB5C2BCE1810132525A44EB3C238D4875E8C55510C0D622CD473E4D5123B8C4BAB81692A81C68268B57BFAFE2ED739F4BEEB114442121DEE0259144194D70EEB3A407458CF1FB25C9056871122B0A6F2E61184C8DBEF39EC48B756173A8DC7D6EB2F5A2DFB83EE2385FE43F9A5C3FD2B5D8BAFFB7AA252112FEBABD8D1E0501488A55B6F8F4FCABC3D0795413AC3D245F64C16F1AAEB8BF67C5404CEA544E63C14CEFDF55BD22200B3D28BDF08968CCA7B94786D49C4CBC31222B3ECE53B3C2F6026E867D6DCE504F556B93968768024D76AF0AC86C004A27864CD15448622FD76826868078894DA1F05833DFDF0E18304443368127DA669CFBFF33FD2F8CE3F4C61E5B4F0C022AB1AB7041743369118A8D3422B5A967104A582220B03B7D57D600C4CFADB7207B52BAA434DDBAD333DB7A5CBF79AC12C1271A280D535743704CDBAA7377B4E33F3BBEBC066EAEEAA072B098CA5862E78A7478F9A0922DCAAD5E569CDE17AEAD2FA2CBCAB2EF05BEAEED7F56F0EBE5FD7B2B290265144EC30335178941F8A6A1A2D8304D4E4E444A96C3B1E83E56DF0E436ED64E448D946184F52D758E2922E2D98170C5D9B9382889531A261A9BC47A922E2530B22A34C0C3DC8C034C265B535B3CE0EAD3EE870BB9B597D73437330563FE6390091E5E5797DB3E51A79F5A335DB12ED665627C2443B40343030F0F0E1C3E104446857FF7A065CC39FFF1419FAF8BB677B0D436A2BB4AA23531F809A9CA8A0480B3DD56626A2444F8A22E684BAD87157B5C0A618051C4DF0FD0C4F5487961D9941A4BD4698680C44C9B047A16B1876E861E6D111A948D755EF743CCBF3809DB2EC42018AB33C333B3B3BF3864A913756160F155099ADBC4EA7877B1E9300DA78D495EC9B15DAFAE0D04086227B8E9BE51E35420439545F5FDF0DEB3B2168B0CF83CAE497226914471F659696F192B10ECE3D9656CEA82DBC5801914DE43D2A62CFB520322D01D183022FD3F506C158170BBADADABAEC06DC89D57D6CC3628EA337B7F941D718F8A6D91D21DA5599C58520DB433440103D28240CEBCF84362B97FF9544D1C7FF1775B4C15CAAAB515DB5321C01A8A94A88DC0A5F437213BB6816EE2115331BED18A780A36190E74F99B790F97299626309D01FD4D2C6714A2277060FB0C38D053F67E26E427CCEA497E8FD6278CD870F377BAE7A06FE79D174EBD6CDEBB43BC23B72E470D7CA685ACEC8706FCFE3C2606F4F6F3A33A857C4B2797650085FCE6503BBA235DEEC79F5CC2DC7CE85CAE4AB3A04018F6C83C378BC60B8E66080E81A78F78126E434F5194C8AEA786D99DB48A225059151125B3CC42A31353FC83737B3F1E6EEBC6B39DDB6D5D5E5359B0ED7A35FBFB320DAB510E4D9F61E7E9A204A9B5B4D22183FFF1818FA0F0B0FA82D92A51B586E21C2C90CEB684270FB9314814A9A93B360D784C8D4432787D383CA5F0A70E919736CDE88F48024AA20316E065996F96E3442B80C6F0B83A2BA479A2D4453F229ACAD163B851C8F2CEAC4840EF7F5F6F68940E3609E7B098EB0F3AF2A47C3C45C10DAF5A6D3061061EB1411018C438A71169E275A3446E9748BE17625D06757E7B9F0FEA980CAAB8028910F2BD58048386738AC68CF2BFE0C05F0E1AA83BCE3C0EAF1DA3AD7BADBFCFA0D9E8F3E89F54EDA6C682F1089E2ED2D107D466D87DBBEFB277FF2DDD3A30FCEAAA504429DA940A316B893D31B6C3AC9D0BA9221F6462D88B031CB749982F455FD16CA5CB59989F21E313B840ECBE50C21F7635508E6C9D636328261924CF198A32210BAA8F2D2E8E8E8C8B6D568994159C016ED5A8BCBD1B8EDF8FC18736D6C34E5955FAD7123D97E44DAB0CBA564316399AB7A3D7D06DB916093B6403663D609A2A47B866B4A584880640D884AD2397BF0307A4614B0E1C4389623D4BCE3399D0D6D6E506F62AB4B591DB2F4D675B104D1A3ED218AB499DC01602E2F57DAD566113EE0FFF31140E46D2A88B00788A72A1A717F076E589B4A32346F18CCA8920B3144BAD07666ADFB6E960DEAF90D935A1402DE1262872A644AD4705155EB27208A4B22AB98AC7AE61EEE14BA251EAB14D2B65D8707F346629748DC5C1CC86CD06CEB980FDE83E3E5DF6B809BC57931FEA3A4E32C2C9C05B854672B95A5B526D1204241B42EB3CFF87E90230A228447F4A7B2C404D580885B4F05444F2B9699082F0A3B4D28F6B5B535C7D7B2F001C52F96BED95B43146FF5D8DE24CAA481A3F4C307A5A909236957DF334DB0DCCAFFE1E33FFD1BEC6823EF1940A01B9829131DD22A541948A9372FE7E75EBE7C3957790323888CA2C8F7C30DB6F872156AA6CCE59798034E2FB2A3F279529FD584C8811FA055BB75C5567E4FB5D533E2F16E0CE1D40C62FFDAADBBD6DC0E3489C6B1FF4943F37B5AE038811B8B3C4A311B39F89C8212C2A8A4B2B4FAA7600D5DB97EF3DA3D2569A9BA0AFB3324543B4F5C410D889473F620533175F1ABC399C2128684A7A7A797B1AAB1AC166BA1E635EF0A51B4D5E3D9F6108D2E2DA601A2013E11418476F5AF67CCC2570F0BA5FFEEBBBFF85FB1A38D582964555395BE0676B03F99440896EED72F5FCED3FF2BDB2DA81C0978F7B610E339D9093871CF31058CC97D0C2D395E9410C6616C8128FAFDDC0288ACAAA6E2F217CAC52DCAFD9EC71BF065CC6D1788B0FE3CB9698D4A6FCB1C8C8DFAFA06700B3BEB5977BDAFB5B405D90E4FFA665C95EC9B89049BF2E22C032344579B6E5E6FFA46EA3AF97EE6250A1E12BB86786D4924211A4ED400C7AF2AAB7B786868E8C9AB8A9F5C7A2786620F7F0793A800F683B3B4B464E0DEAE845DFDDC7CF0F8F1574FFEF1A3EF60471BB9B7D7F56453CF20B454BE833A28E06E8AC0067C80216DFE25AB30789481830691D032B9A85B6D49EDA6122D34D1B4E645ECA1C2E39083FC65D313D35B241140C42A9F8906037472B9DC9490963722B33AD266DB31146B7A10471556B60D188990816BD737178FB1A0F30FC078D53CDB228CA2AB2E25FD7F55B7F602ACB26BD871F40BAAE1635CBDBFD2044C1629D64C7BC0CD5A1AC0CC871039C91F29E5A69E0C0E0D0D90CDF4F0E1F068062E2223CBEACAEF0651D71E2082BF60162DD19E775A9844C2392B7CF5F8719F697EE73B091A42B179436E1A9E9404A1E0FFE6EBF5F5205C4788E65FCE576A977853872645069B989ACA31199A4D4C1E56EC6B6869DA8CBFA9862831E2A5173500D8F29E5C42D54E503DB334ABADE1DD2052398F8151F4C82ABBD3320A3370CFD3EADFB3C2AEE6A2562FDC406E24726009FFDFB0A445848D22AF5C4341247BCBA9A5A655FB1165691EF19AF544B40EA4C0192074E235A5EC8B27C4921C72860BB52E790F92680F51A225CABD162D8448E8B3CFD124FA1C4CA2075F3D31CD9FFF3C129BCC09C4E60D4104A6932627F52205E8E6E77273F3EB61F0F5CBF57560C860891D17628AE84C156CE9ACE2FAD5D146AAEC42D31A8C2D4FE36FF8DE2012BF67AB244A42F459D34DD5A571EF82487603316CCF70133E3FF6EEE7DC76BDFA6ECD796F23AC6FA86FF32844552CC553152561C938C2822354A857AFA06116594492B464A0C82A45FB3DB69144020809111D5A13FB10BC326A37052C812C12F26A692786762F8CDD1122FCE01CEEB8B53C3D6DA22532F799D066303000F9CB5FC6308041AD7B54C608773B089D71DAA743C5E8FADCDC1C9B9BC77D14EB3903F55AA26242ACBBD0D29392A7DA7F126713A0690D93EA69821F526AC656D72BF19944C5A159FD9672221F43E9AAEB726FCEEE82288688FE029E6494B4B2F12811ABEC786D7ED0D60C0229F48F992E068F5DCF49C4AD2546D1EEFD5B6051A320BA2E0511099012964862A02891F748048AF66532A0BB6A406425ADEBC486E089ADE309C6024797ACF4BB09A2BD409470144B264351F49CA244CAC836FFE66FA24F68615602376F18942D9529022028C7189E6735C774611549EB5A04A3C134998605920DBDAA58769528A272612C7EE6E31828C2BF6DD10E0753B56A8A4991E101F8032ADAB8559DB14A866E5E9B938B78178612A1FC8CC054837BAD69CC491A47E05279BED7D016D48FBBDE7B7E897BDDF5F52D9E2B3730AA298DEBD672576241940C6E8390D23C90CF9137996CB9B84F18C9C3E974A1EAEAD2326A5D79EDD1353F7902FF7F1241B4DD25BF8D20DAA1222D93FC643A930EFE979FC5BE511405C15DAEA85CB05EDA0DEDC0921B62801E584382228D287AF95267685DCF8981BDA726BDADF910434E9A5C83D41306E8F4931061B1729423571059842689B5ED42D670FF227B48D4C44BF7DEDA8DA1844954205E29070366BA2E5BDE2AEB883B9ED30D1691DBD606DFDBEF995E5B47E07BA5E46ED5B86EEDEE356111DDF0709B5C32B80DABD34EAC01CBE062D580CD44100DA7FBD2C30F864746330565494B7D3620EAE3AB25D110D8D4640C0DFE1620CA6476876834291A34933132899210C55B6242ECC10E1788F5D28127B630941015DC692888D10543B333B9B997EBBA84686E6A623251201291202CEB48C1E564F22D64BE21201273194384B20AB41B96ECBD7923A491EEABAA7E052416EFE0AF9510DD6DBA9664A89CDEAB20C24DF8604333AAD017EDCCB58A0E2396C65CDF629E73CCB6CA61D89077B48640C382E7A8F622AE5B634DD785207AAE0A69F4786693C52078F48E264AF68A164194EEFBB00FF7C60D8B129001F4B6ECD10165115548E1E524430303434F9E4CA158DAEE92F72088AA72F8354576524C924944558D68579BE6D0501CE943DBC041644CB85DE0AB83CBA1C9DE725876569AC81145F32FE7E680A1A6A66BCF1310E5A68CA8404488092CB92A55A920610983970F2BDC67114478F45A24AD540F7D434184216BA1354D51F91F9B5CF8DBEEDDA06D153143A3BB0BA278DBA24375024547B45EC70A2156A1D55C78C971F31D9EE3B2C0AFCFBA4EDB7BDC139B2E9590298B4023A85421881C55E560469B8DCA22E1CC119F6C9619D1960F1B211A489F39D1974E9FF9706484C87E88CF8DA6D303F812C8A68D0DFC2D4B05124AD3150C895CC4D0D01371C9EFA4CDBAF600516CB5E114C5558D780F1F3CF86A28920296886680F83075EC5DADC53B3D192C80E5B22120D235FDE51718519B79E9688A222D6910715396AF5759D642A14F82056B855E91494D8A3BAE732C6643F2AE36B0630CBD44ED9FAA42D42F9EDFBD75E32AEDAAB8793D626869578612DA6CC965EF357499D8FFC6902BBE841C25B41AE83117382A7B6DDD9E75CC0F9ADFEBF01CD10354C4A9958CBF770DCC6A104677422EFA5D92D74FEF0278C2AC469287E0F15CDCF281257BDA3ED26627CEF4A57B4F9C1E1DEAEB1B1949A747D2C3CF9E9D4E0F0B5597A6C4F1681AAEE9D968617070F8E1007C3F1C33B4BD32DB1B447B70CE1237C7D2CC0A8886BE7AF26020326A75CFD395B8A5FD82B21533C763FEA630364A14A1593D8F7946A0E86B2E19CAFA898AD978FF6855499180680ABC7C3B0CA8E5A361126FB9F8F09A08A28848116DE464A7830878F1E2C5BD7B776F355D69BA76FD3A11049FE4C68BB76028D1A911DCADEEE6F7DE6BE8105B680D21045965DF2C3A7BCBE96EB0DD7A2D3C66151D15B73678BC455503DF0C83D5379C80360B13F6287AB2E3287A42DCDD029207E1C1724FB9CA8C7DA4CD4EF7F4F49D3ADD3B74AAE7C4D0D0E99EA1C7E9D191BE51C0696020DD77EACC89DED1677D8F47D3B80D7C98FEEB194AD760E89D204AEF04919AA9C48DE17A146AFCF53D70FB330FBEFAAA10296E2D6A8BA6FA5951C305DA45A0DADD91978F36D1E782A26F8442CBD9498328E19455FAE5D288C98661E0E3395891B1C4B68508955A08E03CBF03E07CFAE9952B579A9A9AAE2B7A0442576FDC533F55D8CDBB4F57EE9F06B79D35345BDD1D368FFAC8517887E9AC22411BB8213867F541777328DAC84A8C940A6758470482A8E91EC646C53976E31A881E57881E50F61A160B133C89902540F4300D08F59CEA3B3172AA0F1EF69C7E3CF2E1E9C73D43233D3DC3C00B3CD9D73372A2E744A6F7D4E9D3E9D1E13E20ECC4B3F45B09A21D20AACAE1D794D9E9C48D216D269C332C262A09A3289A063AF9C512FD4098DCEEA97696A924103A684C07900445B3A12694593169FE5435728AA74C4822400E5BA72577EA476746C4EFC52F732FEEDD4572001C143B4974D4B876F5D64CF443A37B602896D18B0E982FCDC7BA1BB2B499D6D0C7351D3785D1696CCCACD26AA1ED323F3806D490C52D3FA5D8296B68D63A9844A8E379309E1D07D163A3E80940F418A4B73C233141898AA27D68F79CE8EBFB1044D1E88974FA74EFE9BED1DE33A3A32746413C9D4E3F4D9F405D36D2D777E2F1E9BEF4A9C7BD209846FB4E3F1BDE03437B82E8F1F610556FABA2A11B2AFBFAE5E714532926BC6BD19D47B43CB7143C89D6F1C20626E31AA4317B892560D79BE67DA0A872FB4765CEB9028CA91CA642DEE08942FE76106191BC05F4DCBBF5E995ABC8CECD6D063075ADE9DADDB95802A6B797EBB56434082276ACDB0B783D732C3A1B21F0AC224A0CEC8C0AD68C5E0CDDA430B23088BD065E294A23D94686B32C6DB49B6FBA798D045128AD9E226EACCBE26FA256CED51545F4814B8C200207BF0764D0E889DE9E532327464680A3BED300515F1F40740A5818ED0545F718703A8166D389D1333DCFDE4E10ED00517F650EBF264409E74C68338320FA4CE5DD9549244FCF842BCC0A24A85D73C9A8AC102D9311A497E0D55BB4C7B369DED3E65895779FC839476B0E3B5FE54CEABBF386B635FB71C70B1051F21C2D505CA0B66E6C43CF7539AE35355DBDF2E9ADBBF7666282CAD6D21E1952102D6E945D3F0840B36AF5AECD081ECB96081868BA64035BECB25718E90E67CEFCCBDC380F42C7C0CE0CB82913E8FB26BC8795D5D7AF05A1103DBAA6DA3F5AD489A92250C44DE58A1AFB861E3E407D81B77CB4AFA76704A4D0B313CF46CEF40E0DF582261B4649D477FA54DFE313BD67E0C1E3133DA74FA3C8FA6D69B391478F77876829CAF1940D96B0ABA3B9B794208ACAA81412266D3AA71E8E6FA23E4A6816D1CFC928F1F5AF9D71DFD3CBC981DB61E49A13ADAA4D96CBD1896B02223237FCC4DAE4D313921E3278AAD1216840A97DFAE9A7B7EEC100DBFA8D2267A9502864327207FA1E188A211AB5CB8E6F36D43717038D4E34E025001DC130C892093C27E44056362E83C4BCE1D72FE7F5B917F3EBDF809D0C4F7D4323C04E912488B029618945A10A34D3513B16315014C531A2F553DA17E75287D1E902CF7E044C209047A0D74EF4015E677A7A4F0DF59EEE69E9EACFF4F4F69C193EDD9351DA6C6078C7CBDE1B4443DB43A464B670B54D6CA4C862883E9F29570ECC78A89E1D516F2AD9AD0814D0DC9BA8C75774E26044915BD11294A85168E269B3B95C9434141DC0DEBCA103E2A2F8DB8B99BBDBD073BDA9E9CA0DE0E6F9F3B98A0891D07B4B4B99AAD5B89B39949C99E181E1B2CB8F75D78FD70760BB94637B17BB47A1582A7A21BA5496A645D6D137C0901ADF1040628766F88292774DF230DC643492B2B09CF95A22AD185714ED4BA4C090A58724969EA119D4DB0382E8611ACD6E70D4165FBD7A353DBDF80C0CA5A11EA5CD06F62888768428BD2B444FE31BCB281CADEA402221A0D001418469200CCB4415E8515727103FF27CDCB88A31A2E81BB7521055E47ACA71C639975310E1B60F3A2F7D6EE6EEA7E8ABDFDC2A7CAE5E017DF562AE5C7B2CA5B7C649F620862AC2D599B2ABB5B90D66BDE3D9C94FAD5A7731DBD6C6750B0D20CF8B1B1E298CE6612108132A6B075489D2743712E7A5281A29B61869DB54142520AAA8F1102A6E187C37BC20B8CEC2D4F4D4C4F4D233547B8F9FA67F7B1045635BE72C695783030F4B4C3A67D1CD31A8CF0E7364B76183CE3117B844CA0C4F41999B030152AED87AAF28BAF54DA2F11B8DA4653D35353D3D8500817DA420C28290B9F9BBB7B6F283F880F0B93BF3E20D961497B71B560D8210A1DD18AA2C0371598BD7D65CEFD82423A23DD16AC23C8A96517EBFA831CDB0A87E0D4BAAE6E672B92C5AD7D4BF107C922B1582489E849CE8DC2720DABAF56C2B4449961EC443C4D89E3C7C38309C5616D19E21DA0B437B4B7A886B9AAAB0AB4590161B344A65254FB86796BA7C711C0A180B94684DF46AC5D7C4A6F36BD741C8579404252DEBE535C771C44FD11E2A4008CD9F2B55A633D9CB602DDF9B79519501A92D89B610B4173184131341345C2EBB4177A07559E0DF8B326E711AA6FABB5A10F78AA36A358DE9AC58A440D95C6E4A962B960C1056779AA4201275DA8968A49A578C982E27EB36C5556E0B515C2F24581229A32758CE98487AEC04D1BB08A25D931EB44DF515D5817CF9599CF1A44B74A46B8612499D7922D3880CA48C85077C812CE246A56C8828FAFAE55CC57E7CD9249E369079AD1D3E6DC0F3BDF2D88BF97B37B6F283F8DC6EEFEEB771DE797506A4F24F2E154633E9AD04ED09A184202221EDBA60EFB071CB9512481E93297DCA480571CB61D448DF081D3D0B6E026234AF02FC680ADCB8AE0411C99FAD55B4CCC346B4D81D576CF850DBEA7681286649D8955343031514ED0DA29DD819DA9B5D2D3ABF4B837899B4D9AFEF95D4794BA49E34D9A0114F56E4A23F83F4ED919DB2689B1A471EE351920D306EBDAC14458C63573C3C7EAF64FBA5126E7BD63B9C3BE72F9CBB337B732B3F9DFD624E6A5567C5F42C1532E91A4A6CCF9AAC4A9B819076597D7D7D433D2788940432457356934795D10C5D7E34AE1D9D314E598DB9975FA336132B46B47050161137122A9FAB76B4AE05DCE4B891CB01A27116706F1025C7F4704D51F4AE103DEADF0D223AC78B4DE5F0EC2E2168273E238866544366837AD23BC1644E1C11ED32D98E590A66867A5CB69CB52AABF3C52A8C289AAF10529E37DEDEDA8E1D505CDFC93A9FDC99B97D61FDFCBDD9CB17666F497EAE81D71EF3B33D44E8C56732B5CCE8B746282988707D512780A099B942DE28889438F534DA600062840EEBC0841A69B5B238454F861CB5C0F9F47AA5451453C4646D23F8AB22228799EC4462685F2EE1BCEE6D60A5FEF0DB40B4A316ABF4F06B6A33B4ABE9988A1CB55A2D972644BC9A3C7CD04DE49B997A88A5BB39AEC9BA323A092E3E0A177B7DA28D6BD560C80FAF5F9314CD25CD25AFF57CFB78EAFC1BA7F1F6F9B96FAFDFBE307BFBF2FAB7CF9FBF707BF696103F33F3CEE040D558AC923C113CDBE22309DA1B4295DA6CC2A276094ED0A0B94978A2BDB096231A9982C528CC2503136A011FD785F0C6E3B6F1E8D070F24AA56B16B532889A601AD1FE45822876CF4012A1D7116F5AD9EBC8C9E0523C0DDB40B48B29D495D91522B2AB2D1360D77353E0202D0B93E8F31794C5C0268D4087EEF959BC82C9A20C3382AEA3B69FF2B468A69EE395DB9C8821F622A28864972D36377BE39FCCBD98B97079FDC285F9F5F32FD6CFDFBE7C1BBECCCECCCCDCFAB4BDF3D1401EB77D54F39091F08C0ABDB50339EF84508520CA4CF0B2CBFF0046B3EF554820055394AAA0FA5952714C13A70C199469E49AE1855EE0A07F4F8288E28A82C252A2409684BBFC659C8E0D9066412911277A2796C8F07E323538BCFD5EA1DD20DADD3953FA81338DF09D2093E8CBCF50E40A6D46E71E32DCD439A187B638EB8D95A3FCEB9B782298B13CF16A0B439C4714CD83B0A306162EBB3373EFDBB35FCCDE3EBF7EF9F2FCFC85DBEBB7CF5FB8B37EF9FCEDDBE75746E8A30D15411B0C6EA128BD076EDE458FD1C824211A9E2E951D3F0810030A583375F281BC3A3D4ACCC4411EAC46A3CEB8D29DB5F06838AF89B6BCA12082853625333894324A6C9F53C5FBF2E839B149A1B4C5261228BDAD8A7B92DE0EA25D181ADA034471B75A8EA75EE68436FBF50C38DD76D97169C2740F9B745A46160B40708B1E081382088FD1A628A360C8A2DDC3D50C61BE2BA288B92081CEA55EDC6BBA3B7BEEDE175FCC92229BBF7C0140FAB6B6BAD2F5496A5042344CDB3EDE0E99FF1621944E174C334614C41C4804C7F7CD2CEB6A664891299CEEA81D6C8C4EDC08078FF5B50D4ADBC87E2E307BD804E0E695397ABB83E7FC451A39D98D5F6DF8C0C603F1A11CB50D6B49D25BA0F4E45D21DA2187AFA6B92C035C86D8139E13DAECE51B0FFB479A964D571A622E1A4FE7141650D1D58022DC32A379D1595F650CDD570489B07783145892A2AB9F3B3CF5C98BE7E76ECFDEBC3B0BD60F40347FE7DC8B379DC75756173F59195DC0862FAA5C63C886053DF4D6E45410F416082143A62A3722BB74190DEBFA63E09F1D6BF19CC8D8C55203F4CD4AB187EFF836B56077B17D56E005A2092E3967387B3722414407431889F6695181AC01AE5EB2ABF7CE10E572151A6E2F14BD234455CD1C6A404476355E4649A8296BE21E4134CB523078BBE9621CD0F3617DD9160FB1620F3B44397838B6055376DC73B85C83A2074FD2B2D69DD0500D9F5E50BBD45BB7D6C7BEFD6266F6F2E5D92F6E821F363373FBBCBDFAEDC5D5C5D40AF2F38C22F9D1005114E4FFFF4208062A10D52D0421C2B3159C66D70EB3DD9E6747A5BCB8DBBC4C5507BE263AB6581E073A0CD0D4BADB3E1EA4384F0563AD6E80DB1C75D723FFFE8A08F97B63638ECCDD4B8B48626454E53D4A7B81E86D8CA57784E8D1EE1009BBDA50DB7997A5833FABA5602D0501B646769D10ED18DF09025B34BEF3B1A39BE7BABE0F10B1923C198E8AAA4A711F4360888B4D8758243AFF59D317B3B3B3F36047CFDE3B0F06F45D00A83D757E7075A57B11E54FBA821F1A83A014F8BB88A2A7EF821058444851A279DC9265E1E5323C62D44ED8D3F2C42C6EE106E0E9123759D0DEE179C73BE13F9B9783E38C1D0FCA86CB0123CF0A9D992F60CC844ED18675D7D1814749B8589F444795E27720C61272AD5C6178ED06D1F4F4F2F27485B1549BA5775567955B3D2A18AAB2AB554E79599A44F302A21463ADA94BE3A19D4A355A41AAB5B135F0DB1B1BB97FDC77E129982E0FF7F0D3D6E8C8B8E60986366C26936BC6DCFCCCED0BE76FAFCF9F43EBF9DCED1756E19366E067646165612B3F34D22C0CBD4149C4BF3942302BB1428B8252AEE7EA218BEBABCBB82545187ECCB1A6449712168CA53CED78CAD12E051222BF6C04BE8D6545657EE7DEECCC1D5C8A1673FC8EF69206FE9AE179DCF2354F0BC03A774A8E5ED22B4E18C0E8389960FB6A33244959DE10C3E280D2B478A5364B99EDFA12ED02D1E3CCAE10299BD81491C529E9E0CFD169C70851A35BBEE8B32C2CA0F0B8E535F27198A954703CD0E0A9CEE0B84B1908333E8F5285AC05431B1B5C27C7D876BD37172E80EB7561FDCEB97B33B31DE7400461C3BBF44E200C8261C1D24FABC71E087A078470562285A620123B86B880880C21CB8A20F2B09A57C6F32F7AEDADC7BD8ED620D5292451672AC85E6ABF940D538DA98BF05F63E034B6A65A83CE46587E011EFADBD1E91F4FB507F0646387CBB9A6BAA595BB07CA1500002000494441545493349ADB7D35199282A8B4513DB81251D5E6D2F03B42148FED201A9E163B4CD1AE314C1044D2C1A773D7399D706C872076401E7586C71D37C53A3B3C707B8F070E3E05103922DA213665B168E33918E1C45051A75E0C28B61B2FCCCECCCE9CBBB37EE1325F793DB8B2F0B4B6FC49D092C1E60E83EA23EFCE52FCDABB31F494145A045101216AA86FB3B15194A39A91192C271ADB69D47B59B664BE68346A292D35560191E68DA5C2D4EDD93B17679C469D3502384167ABE3346A045147709CFBFC92E7B5773854DB1835B02EC741A91A104D2986AC8DAD2357F5DE7F4388E4AC0F9138963DCE991139F878DAB1EB7808911B1E0F5A3B57DA616E3C84A8DD7579804F39B892C06931F1EC213C6199F10D5B461EB9111691211BB3B4D889C5FCA4DD39777BE62E06865E9CCBBF5E5858D88B1CA180E3965BBDFB78178668650145C6A0640821026B08B3676DD8B75A3967966C6CA785E31322ED0E5653AAF3A2D7D971892521E22073527EEACEEC9DC6F930A57BED8DED56D001D6537BA7904430A5F03EB4933C55DB188D1D20CAE953DB3264E5266A8E27FF76100D0C3D018C646E156CE217325C8D103902A2D007623AC61A3BC1158327EC4BE3EDED0851C778A38048F68D4761B4811461C7182D7435FA86A26F8EDB7E7EDC5BBF7D6E66E68BD973CFE72F77ACA407B603A8E23207B107D2604DA1F15B63C82C24A53398452C23207A982619EAD50756CB1FB479CAD48D32802CD05E510D8361F84E672AE519A98B6E12A24B9D369310BD0953A6CDACF18B6510E55E2B40E40A88FCB194EB10448960D3CE102965568BA18DE2D46F17A2A1A1DD21A22DFFB4EF90DCCD195106424766832B3F665B63A1DD11B89D63EE7800573F56F678C7981FD053A571AF8322B9A62A2EB23736B06418DB296BDC941D8819771A3F29BF9901C7EC3228B473F7E667670A7B008806061CF3DB299FDF0A4468052520C2EF9984E821B6F5F5BCFACE630D79B4832BEF2E480E3C89D5B2ACA2E316B5E3DD8E7B31E5FA4988C68CD6D4378D085108EBCFB8C43580E892A15FB43D78CF2582C8BAA85B601395AB1B5DA9A8F61688C0729E9818EBE8E8CE9A15F8502DD68639B10D4499F45B4084AD75C588C3443B4204B2E855A954A614F23D99C1474F1E0D02DF095DB408703F6A209ACC39F20C6D6A5EBF4669309104B1F0B0B30D6CCCACD9D8313F3AF3947BDAB9E7333317E6E6C127BB7C61F68B5B379BFAB72054FB1693979FA9FDDA6F0D22419134B250A11524441998827CC3B14EEE7B8EAA489377D7D0B38EEFD23621DA4016A6CA1E2878DB691DF3294E34DE0EEAAC556B5D6FBD377BA73DB4DB391848AD5A3036D69ACAFA7E36D5DA0906144C233C6AEFF0F0D49D2444256E88BC4735446410B5B74FE698D69D27618416DBC60646397DDF33B681687A7105DEBA541BA2D774B0C06884CBCAEAEAEA68B587BF13440FA730EA615294E70D99442F5F32F2B11CEEF072C85CA7A45BD1F5B9AEADFAE0B392C57222916FD38672B34C71218387C5C92959014A1B62DE80577FEEF6FCFCE5F39FA46666A84E14281AA146D2BB64B730E038B8CD6BBF257526288A0C75546843F28C01CBF13A343FF42D0FED6A91F5C0A005F626C20A7D83CE47C4235B1D3708C5496D7E802BD0A3A06CE0BD5907C13B03AB915A4B3B3E76A071E8F0088CA160291E7C971AF3B0FF11D64996B84C9AA968E3BE2D0C4D4DB44F8A136BB3DD4891BFA1F9CE86DFDD1C34E7FDA449F46A6D2D6A30BEE66DF68B532846E8AA47575657462444AF57FBFBFB07236E464656BB5AF60E11E5C18597CA90A2179F7DFEF9AFBFC4DE4216795420815CD7B23CDCACE8D081CE98E9C08C07C284E7E3311DEB61ED0DA2486CB2663C7426A99A818BC33DD8DD2F66CE9D9F99BDFB62A531BFB2F4A9D88ED63F82198E5D6FF9A0875EFEDB52F4D6B2A890C8DF2B85860755D87E10389D94F550E74F65F5A28BEDBD60D5C79BE9E05A8B2147A4643F8F30F06D8B7BFCEEAD5BB79AEEC0433A17A24C956B1EBCCBA1D8BF6373A7FDD2A5763C3C024306C99D44BC2644A8CCDA27E1F74F4CA3A64759E437372044260F8EE6FDD2F4C4346EFB80FFD69CB69CB3460F275E39F507EF1F6CDB5CBDBFB2B2F0FAF5EB859542D7EAEB85D7247F56FA0FDEBF7FF4E8EA0A48A405CC1C6CDEBFBF0AA209C9898F5CDC09A2418A7A944C8C5BDFBBDAD474F573ACECE458D4974AA5B236C85FC7094DC7B32C1F1C361FDD3630023CCDA5322203EB61418DD974FEB245012247B6D315D9C5E74D4DB766D1A81E1B7E8D89B17EEAF472FDD6D2E0F941A468E73B9C6161E8BEB5287A078AE288012A3456C02AD3070396C79AEB3B4D97B21E288108201B2490118671E5182E16B8703D875E86AE65A3AD690E35F1D73C4B9CE90A9EAC218A8CD4691B364CA7230E8F60B54E3DAB8208191A6B0739B4F6BDEF615D772B28AAB58666D7727CCD090EF879BEB6B6B6DCBDEC38DDAF72B9A36DE6387EBBB6FC6AF2E0EA4AE1C066FF81FECDD595FEC5CD959683839BAB85FED595D191D54747417F1D7CB2B93A5858DD2C1406378E3E5A2D0CA2307AB60788324F32531351C93DA3B297CF5E8A6E8B6E3665FBADED78960FC8A3007CD320F050EF622A24405F0DB73A882397ED0DD963CED2DC30718E0568C85B5781992F662E5C5819C56D08F05789A2BBB377CEB57D322885EB4EA268AB97BF0786DE0E2333997A150ACDC41AD3070F0A5EBEBEA1DB745D3C9C963B810088AAA4EDF87449D9BC336E7C824DF2716B5A8807795CBB4B92C9732C703AF4F1F1ECB8E161D74721DA6CC77284E3C72D37E9E31B3520A2E861070822FF7B3040377677024447BBD7261CFF68D63A505F7F60D96B3BD870D0CC1D38DADC76A0D93C30B9D65C0F10E50F2EAEACF46F9C3CD8B2D9053229FFE4E8D1AECDFB474F1E5D7D3DB20A8207205A7A022FB46CD61F3DBA747070F0204114E7F0B785A8802A73B96CC8226B1D97CD3582084411BAF9A17D31E8EC083B1B1BC7F9A54BE39DAD17C1BB774142B9EDC7539E0834A2FD6449C1CEC180483426304B2FAE89B34E67CCF3850555440614DD9DBD77EEF64AE1FCE2EBDD6E7032E0B83343C2481F7E178E2A281A0085C65881201A02ADCE3BEB8F81B4C09E0E5C004443E7AAE392DA68171D5ACAA5D9A805B85EAE3E1F076818C76C19994DE0A8B8742C9F0AAD8856469651794C4C99E251FBAA199AE8C8852132F4BD3B6198EB98585E3B38F96A62D93DE0668FFA4E3D70F36AADA16DFCE09A671E70BCA31D6B07726B13AFBCE60327FB5737BB8EAE6EB62CAE9C6CD984FFC337AB47411BAC9E3CD9DF7FF4E4E6A3C1D5AEA39B00D7E681C583FDAB0B23C9660EDB41F4943E196DE4A54FFD1C33ED575F50671856B2B3A99062D49DE171CF69059882CE569FE28C22C421028D58405592BBCA0C1606159BEEEF5CA173BB9B9E67400F8F46B1A17E64085CB5954FF2BB42445E7E2D51548DCF7F53F6031B211522259F11103D00884C307182D001239A65B5E4B5C1BA61B415383A56D2CAE9626F70DC9D601E4F13B9A13978C2324694B25A761C1521F62A0C6405B62C4503B736EE884E1B3E441FF74465A30C102144D308D1AB309CEC00F3F9C01A183DCB07BCE67A67ADB9B9EDE0D1A347BB41FCAC751F5D731A9ADB40104D835DBDD875F011183B60161D3D0A8F8EF66F1EC5515859583D7AF2FE7D40E711BC707FF3406173F0C0C1FBABAFAB3CFC6D201A9A981009444E3BEC8C7B584D7EA34CDD83E7E7D65FA442EEA5380043A15680A8A3C3F78F07290D8F693B4EDE3DB971254DD45A8349ED6B4986EED2DEC5A61BD98181F4C8481C5F1C5DBA73EEF6CCF9CB97CF2DADEC7A7F31E058DCE2E5EF44D02EB1A75A40A60B68B03C958622406428881CA7EDD81FD49B65B88315168B416E28E8ADA8E23A3731894F94156A80199D2672C7571A9ECBEC10A823ECC9884D1F9816297F2C0691C7E150D34381CEBE6A86263AC78436FBDEF7C2B0B373E255F7C1B557CB6B6347BD86E6B5B583DDCDF0750D1F3B2DF58ED379F460CE99585E01B379E5FED1CDFAAECD16506C07FB370F168023D062AB0B0BAB070AF0EF266AB0932D1B075681A62E30A1C8397BBC1B44D85974AA5C960704960C711C18E700D1175FBC5CCFA5C021BBE877763A8697BD4492A8C3F700A22CD881C1713ABB869A5B514480E139E68E96DC0C433544D7AFDE2D59C395F5D00B8BE72ECF8230BAFC7C7375742FA228A80E38EE025025487B80E8E9305124212A804D2421E24E774377B3D6E02CE772462543B409CF483044872CC5879C31F6824E1301E96C244C27DAE0275A84E1890FD883B684395713204A1E675205512ECABA4EB6A2FB8708850E18D66B1D47919AB67AEFE8D1E5B6834EF7C1DC721BAAB1B5E6866537770004114074F07E61F060D7E6D1471B274F165A0E6CA2C0B97F7471B07F756465F1008A1D506585AE83F93C283CB0918EB6903A1BCAEC06D193E9E989F89012937FF6CBFFFECC991FFDE047FFDBCCADAB57EFBA666336DB38E67776B897B29D8DC178CA111069986A0C2E014A9492C4E20F9853DC2263E94894ACB37E218F7E7F5EA6EDA8C93CC7E8CAE0F93BB3B3DF9E5F6F0795BCAB280237C4A82584764368B7486692A1E188A208A20702A28671BBDEA94788E2666D51BD8BAADD2C1B22DD30197555328DB276974EE9F4A474366209C5D5DE61DA1D52D4984E2112AFE24C9CA92444E09645098D8E6ED5C9E651D7E0E052176AA5EEAE2EAF7EF2687DCE5D6B3B7A740C1EBF5A9B3CDAE991453431BDB2084AAC0B6DA22530A9078F6E02419B209A4E1600A2C19308CCCAE2C9A38FEE3FC98391DDD2B5DA7F9420DA3D77866463CA434640FABFFF3FFCE6BFA6D3FFF5FFF8D1F72F830B1E163B3A3A0C3B645A6075743A81DF09FE86EF7504BED6018E88D1E139E4D3CBF3E03521B42DC6A626D0D0BC439E7CD3A7B8A7DF4A57F538418A2E5FB8B07EFBDB8D7B70D0A8ACA81AA13D111473B43343F4DB3248116D224940643A5D5D4EC3B16E8228B275A283B7944746874F4EE3A1EED2B8C695A58943FA342E165B24A1CAAA8B013DC046100665CD986725294A403495646862A2FDD1269D58DBDB031F11C33E2B2B9BAEE3ADE1587E855F9D353484D63C072D222CD317A7DD2EACACAC5209CEAA1A2B0B23AF457C7A94BEDFDC8C5EDA1B44229C392DB5FA3F9FEE532FF79DFEE5F5BB5CECB9C2B23E71909F072EBE4B990FCFB3F0594744AD8523E2878C18DAD8D027264AD65DF4EC6F5EBD8B6D829686B7F4C9195D29B4DE9E4B9DBB7727B5B92B451870D4DE95A0DD303233D1F6FB82A2A80222A7191B59BF4286543790A82D0E171E99450C2D979773065ADBBA301135E1DFEB629F59A4F664FFF7A8F2CAD235170D6F510C5213A229CA972512613D677A07077BCF20430F0786A3D46A2653783235313D3D3D358D156AD3AFD640C3AD51FAF5E933A0209D9689B1D151F83AF20CFF7D1667CAF0F98551F5F2E8C85E20CA288B8D24F2A31F0CC7AF0F7FFF977730544847BC96AB06891EF5B4D8408D0CE91C1D167B63C3D227A63E2573E88A687264A5B7F65A1A5DD9F42E9F9F595F9F1B5BDD4DA3092FFF5D01DA05A382A9F6096178485084712271FECA9089DB378A01DAD5A5A8A58C3C0588E430431F0BEFF72B31299C8745B28B2CED1AF9F7344B51DC23F6DCA25AD052592FE289A89C15D5792634721144550C4D3C79F0556F4F4FAF388C2AD9B25AB43F1F521BF3975128A1A878F26E5DD04786FA7783E8A94CACE47059E4BFFF2FC937FCCBF7FF77AC44D7828AF897BC6AF1552A419C1E0C0FE9302BA2254499DF2173E8DA0DD59EC6AAD5A6EC75E1FCCCFCFCE573E7CF0FAE3C4BEF38A8ACE8AD01CA448FD2A33B6084140DAB1370C92E2288C4495058A5C64DDDF6B3CB0911447120A99F305368942877C4D491A6F4409F21FF5E4F2CB504430657AD0CC4B95F5E6833CB0B6B4284BA6C3A09D1A06A27530321B55E9F024A4F96979709A7C1F4BB41D4BF2344743B988208A46BCF7F243DF647BFF33B7F445AED9F7E6489235EB73064C91099C5E8AC5CDAF91A84D8329419E2B53BA4CA9AEEBE897E461D7498ECCC01FA7963F6F2F97BB3B73FD95114C18FE03E466B702FE0E02C660A83850276BFC6B3E5848C19DD5E1A3D7D5A300B99E18C3066C9BBCE2044431144A6A9766244690993C7AD2BC0A61107D42A500008EA4924FC7BAB1C775089434AF224827214DDCF5A187EAC0911E65CAD8DE56416761B84B6CE471A14DC93C10CE8B9A5C2D252E16D217AB43B4405099145CA0CC7877F34FC2F7FF4213DFC413F8AEAE2D643C43092214264A629264207BB8018624498880E5DBD9BFCA1A80579E22E8E2EBC5E3A7F1B5DFDE2EB916D01A2416545BBB0130DB3B2F30C1EF4146DB3DB8AD1D3A7549F2FDD6A218B28ED9180C8D48262A21F55957ED21D84C68A850D59DBE2B4D0264DB5BF60D50C516759F55B6021323FAC844897108120C27AFC4A7DB695A19D34B9340BDE1EA2A15D21924611EEEAFDE71FD3DFFB9DEF0F0FFFD3297AF8E37FC67E565B05111A0696EAB2A75343676008E79DF67C589A8C0E755A71DFAFF23667692FAC80209ABD7079DD5AD9625D5798403B6C1E82E983772F2E022B0E1AC5C399AD47565999E1A7854C2D8CC49F282420121431F34112225D9E681E5535C6EEBA4506A1C693460F5ADBD840FF66D3ED882E8B456F894D6A33F15B2C72D38C182254145353FB725A6E1A184A4A22A2689B5E563510AAA9C5F7D412A42BB3034415EE199EC4FA2301D189DF3BA3FEF88F7F84CAAC463729BA70DCA98947BCE0D6D888216A5624A3439D03E97239FD346E05B358A3C9D4C84AF7F9CBE7CFCFDD39DFB808148D8CD4E0470C3CBE6A8B3E7B368AECD88E638B224A7BA3EAD8A66814E36D89E22F24FFD0F0B0A2484A21944785812444CC90071945BB7D93AA3D4E9AA92E29606D53A3CF2B63B1DA6355FE19F50FA57F95E7C65818325D2124860910E97C63835756844C4C0DD5EC645583A0DAFE444D865EC35A1E9535200222F5006C8F856D207A12E9B37FFC8FE2AF7EFFF77EE7C4BFD0A37FEA01655643108124C22D0FD88B006D6B9DD1049A32E6F6A24930843D853278B0D8A83CEB7B295DEB721656F2A9DBD8C6E1F279AA645948DCD88A3188C75755EB2FA75C73447B9465340728B38AC5224E0182875E2CFC953438B1CFA23F55908208DE57E4D8CADD1496B584C8CC527B8665D91A260AF928774D27BF3E5658606DDF43FFFE96117595345473DDD83F53275A44120A6591A5097884583401A229936F9426B68CC187BB20B46398B516440BABFDAB2B2B8B8351755AD4CC6174B550581DA982E8196E398D9D7C56EEF9B1FAD3FF246DA21FFFC8F726ABCF42C0D48E869BAF50A919227D442A4F4E9E4AB83E96BB2596A819F4B60C9175EDDC3E3F333B7BBE7B75A5AB6BE5D9762E188B5B84D0C4616B19BB2643D1DE5155DFE560DB96FCD2C8E33448BA678FCF2C9CC29355D2A367E0FBA7422C3D7D3A5AB4F0085396CFA3A582F72FF360E0610411E9B3E589E58AB0610C08E3740E571C0CD2A8D1E7D5E751CA96C9F3741299354B88B6E8B770F405ECD04DDA4508111844D6448DF1645B86762F63A829881656F7B7ACAEF6D7AD62611A48A5D78B4F7077FB02BEF2FEFBAB18D514039E788D156D2D20B4165EBF5A7E45C3FEC71FE1E7F9CD89DF0C0C9CF99D07F8F8C7FF4BA84D4C19862AD454AD3665D58781FBD49021270BA4C969BD279AC57EFA585EDE1228313A936F7187EED12BA9CBB3B333E75EB85DE70657B66D1C83FB1835EA81A70E44CD0CD78628AA0D54F7CF7972DACA7FB8943EB180D3D1D7B3706A81A26A2764CC8DC26A0BAF1F6916B7BACE749DEEB74170D91659A10F0BB13E5B16F663E45025ED226685F1C64DE042BB27F2F7D596B4552DC4E2EA488C715BD8F5D1D765C891ECA37D68106DB7856370685B80D23B8D67DB417468112102920A9BAB83AB4BFDAB24824656160FC12BAB838B8383AB8BFD18F52E0CAE6EF6EF87D717FBB9E374AF8D794EF7A31FA0707CF07B1F0E0C7CF87B5460FCA347C124453FE860D6D81B619688D68BA585625C9F921D406563BDDB8FA315B284E73E8F964777EA40BED27D61E6DEF9CBEBB781A1D1ED101A1AC2E3ABB0F439B2D20AC9936D9210298A22889C53D6990F0BBD6746CF9CEA5DE8E97D7C7AA1F7D499D18513674E0F2DF49D86476746467A7A3F3C6515ADD379ABBFCBEE3F75A6F8A837DDDB937EF84052A485A2045E8F6D1C75FE065D3DBA68315D1613FEBD3A36200A2C6EB18B58328284DDD298EE87861E99F9E6BED2C6C6F4C4B6E3490D82D2BB8D67DB42D4F23E40B4B972E4E4E1968DFDAB4BFB1FADD675AD8236EB3A79B26B75B5AEEEFEA193EF9F3CB2B97AE464DDC9CD96FD2D9B83874F1E1AF7F61F6BF68E1CABFF77BF416BFF9F304EF44FF8E8373DFFAF0D10195170844753C7F9F2D4942CFD4053806B544F62DC2086AEDE4E48D9A716C619D33B5ED8C24AEBB7CFA580A13B5874BDA2BA13250D20B4DDC6C1CBCF0E0CC4076B6D07117611E26223B2418FCAF687EC544BFE54A6B72FFDE142CFE3C73D40CD999EA113E9DE339953F0E5F1E991BED30BA746968AD6A9AEAE53DC3E63B574E54F8F9EEA7B1A99459AEB4C92FD18F1502552343F3EA6BCACD3716FD7B4CAB7C81D7AD5422CA1DC2C4BE7581C6A6B3144D3558ED9B610EDB9F465BBD6C300D1EAE17E80E8FEFDD5C5FD9B75FD8F8E9C5C3D042ECFEBD5238F1ED5AD6ED63D5A7D04DF1FC9E78FACACB46CC2DB378F3C5A7954E7EFCF79DD4736D64EFEE061C5F8FEFF89ED72E0AAC7F3DD792DB20A4511EC145545E8363104FA0D77A7CBA4FD95CE0A459D5EAA798C76C578BDB234B77EF9DB972F5F6E5CDD0479399AC98C2E169E0C450634D53D4D5AE8E50FC4E42C15CA35477C989E1403E5D2875D8FBABA4E2FF69E3E7562E154A6A71744D289DEC73D237DA77A7AE10B3CEAED59383192CE581FE6F3671E155B4E9D78649FC89F490F88D407399FE13832C455EB0AD98A2916295A205C3472FA6FC9FC7D92183400C479A5EA9992CAC5CA5F8ACD3F71622D30340D05D1C4C49E18DA7B09DEB6EDAB11A2FEC30051DD91BABABACD9696938F0E0F1E595D1859291C5A5D3D5400AC50D9ADD4E537EF1FB95F5885B7AFEE8777DEDFDCBFE13637ACAD357FFF3789EEEC0F7EF3EFC81DE1DDDD2059B5EE3C17EDB9850217DBAE35272CEA621681A2E74DD723B7ACD2D8DBFDE2465FAF5E387FEFDCE5CB7736D8B90E67BAC26E1C90272AE321D581F664A92486557D1C7AB98A9D843AB34E9D02A3E8917922FDF8D4C2870BA71F9F79649D7E8C07F6F4F4F48DF4C257D0669953606D674E59A0CECE7471506BA74EB1A587E2DCDE489FE10E84C89A49A6102D8A75B8BA0CF908FF5E83456625331DA46CCBD576519C8B65B2A703F8FA81AEEF01A2C1B747688716E808D1EA49C0E7FD162A52AB3BBCFAFEFD96D5D1D1D596C3757587BB6288960A8B8F002A90448706575656BDFD6B582EB0D67CFA0749887EF0472131446746E106276A782A8F71671C838A7E48FC88A525321DD73EED7F7B84D0355A699EB97D7E767EFDF9B94EEFD544154443E2FB492C2B9A309020831A67189C0EA5164AAB14F5188B628DD1037EEA1140649A277A4E836B06CED999332D2746CF9CEE3931FAF854CFA9D1DE13674E3D1E3AD1F72CDD77A2ABEB84892F9BF69933E0AE8968119AD7A06474612747C72F5A95F1226E84B6307A74E1DF6B98568B8EA388BCFF2D79B4E8441DCD534DC160762D4DDF0DA2A1B798E5AD086D093312448B87EA361F1D292CFE7FBD9DED531CF79DE0E7964B69797165BBB48AAA1416CE63A35BF1724B89D65BBE4D098BE41F382DF3422F85D003551048B620E882B903A66E16D9685DB88461C9061921790CCA84C9004389278573DAD39DCE4E367B43F0A2C31EEF71CD346A34ADA55BE3EEBAEFF7F7FBF5C33CC12025D7B646C3809899EECF7C9F1FFC7B7BC75EDDF21F1DDB426D0616F4D07106D156D5EAEAB1B1318428BED77E6A2D3E940188E68FAECE1FEB78E3AF1C86BEFD57E52608D640CCDA79125DE5AD0D02AC6A28636298885557B13A58EA961D8E21F4E951A3E1FCCFE6B3BD31D582688625336E5B5F6359D1AC64CB18F7D660494E514B081530DD7A4EBF42B624695504B707AC8F315094604B27D656E32389F1E06030111A1FBC9F088D8C8FDC0F8DE0EA9EC1C16139ADACF25C5A39C3611B21DB9E11C7FC9915518C5914E5881461DBA4F7A6A97F4F66A358D169FB6763A91C86AC5C2CBC749DB77E5D14551ABF2F44738747685F86002210335B43ED7B5B4355AF0EEDED75FAB7D6AAB636419BBDBAB599DCAA7AD23EB635D6BEB5D51EDFC31FD8DAEAACDA833FA7C6F6AA92C9274355DEEE9EFFEB28B4BFFBE6FFAE0249C45B1574208B023CBB7AE4AC083CB62F581F2B5A07CB4CEA438B218C0BDD9D4A7637A36DBD5BDBB7E39C24D241689FB459F4F225DBEC716FF67017D0BBD519D69D921022FC2F49DBDBDBF276FC7E704ADABE3F15A2B133B8B91B64B1581ACE8E4BDB688C77768282C22610381FEFBDF7DEA41835294580839D03CB6288BA6898CD6F22FE3D4F543E9B5AE94A7958EEBE2587522C172B281422BAC49AE34DE2A5155F10F3FB660820DADA4A60891AA959830FF67A92D4A691AAB5042958B36ADAC86C29D27D9DA4756EC1B5E4CECECEF2A2FF3FDBCA6C68473324258282E83B7060FA33E23A610256E4F36C1BB5C2321D97FA72182A19213C36D79791A1E9B34B3B4EF3EF1CB8F6B76DFF169754AB4E0ACB6D12B9EA551C016555343BC90C91744863C6BE401881BC7AD2812F0AFCB6B82A6FD37F132710BD370ECA8916A0653F5FD65A252CCD93957003CBDF937A4FCECD902015CBC5B2FA58FBD749F3D44B2B06D1D8E1199ADA9FA1FBA14422C44AD312183C1B1B63B569E49614AB4DE18F844241F8434ADCA6EEC2AFA2A9A4D0061C175BBFF5EDF7C8F1ED3766E6D270B95645072231E03014DBC68A7C810E4195A759A6239087D021189A086E65BED3B2B252DBBC30DD43478FCBA88E1E6D6C80AB8E89A4797E9E340F49C426CA81A8C0FA543B72CD530395A7A94D9E142E4E16666814CBF36FDD9A80E703A9454A43F05F8D92B332C6138A78DB06CA6788AEE9E69B511035C6EC5CACCBFA61354476C052B2CD21E2F602440E5D029CE74CAC08442F680E653344073A2459492CD6C926F372F834018BDF0B81278407A9DF611730944CEEEDECE83B2BBB3F3B4321FAE6DFCFCCE2B07837447CC0660864741A2B4045F2F1A2B5D497AF0E1F5A0C05B3521C41557DBCD87CB6EDAD972E6886E6FEA4DB712A01534B3C42847CB130102ED780FBCC6573D5AE329A240B221A348C8F626F62114104DF8A8FDE221610638E0AA3713C2BB8B9CC34D9FA3F3B7C28F35999219937F54823CDDFD3155EE0B321206935EDAA16C98D3932AC78DD6D66E1F088FE46DD5F00002000494441548C5910A2B9C33334559CA1041DE800EE1883A8DDBF45D2AFF910A1D9940826E3F00FD6C8AC4D76091363557BFE0EBDA367F7C45F1051F4576F80FD81D30AC21107A2404466FB70389DB55161D05AA2B5D48D17C7470FDA37BA3F4313134F5475B9B6F6EC85A5DDFAA8AEE54144F0452FDF7A244B12C90422C296C85C369AB1C191666E88C6B0AB2C3E5A9821F00401B0F7E37147FDD1BF27094484229A69E55993AB4BA858A2C55CA4F97B8603F86C20D4712888E244B47372B1A46C5F60EACCA18B0777402D04D1EDC39DE81C800AB9F69D9DAF1EDF5A2DDFA236CE587C0FFF0EB0FC3DB37E125358E75F0E108135DDD97ECC9F4479940005174C6CAD0DEF7556E9551DBB2D54147DF3F6A347127AF87C206319D6AA9F93E81E21A7511A531FD4A46E6C150F2D86B2191ABF1D4CD6FBBE537B617177F7C2D90B61DD95A1674B8B15B2399486AFF220726917B75E038678BBCC8C9944A3C0445EDE72949425A1900261E5AE0B112DC3E83D5EB4294291225A9E6ACE2148A47DAFC99A7A26C7E05CA674B5239DB67F82ED7FB7FBD0684FA3E440C4BE0396522175767BBFD541874688B9F65BA7FC00D1DED6701C44D2FA1E38F3717E134715C587D7F6C897F033F16106516732193FBA07E8006E63C9E45A7C8B42D4B9DBB2701D44D1B7AFEF0476024FD2200C56A3568353204C426B9CA09ACE767299BB4A0BD07A269D02D89225ACC5104A66F0E31F2463BEBE9D9595C5B76A17DACE46F4941DF971D22EB2005E7E8C3960EEDA33A9C05D49B6B419EFB2AB2750D8E4A6BFE9D7EBA295B3CFA688A8363E4EBEA20B5FE9D6C054FE76377C8D58D1C8EAF329203CCE49F1766B1AFBE8E5E662453B171B6510D9DB61B95481717B638761686AEA40861844ED9DABE5346BB657D5B9577EEAD4513FFA649DC7DA8FAD932F87F6868E9E7AD58668AD7C6F08BE37B477742DD9790AFE2D85A83C3CFC4D1044FF432FF77A8F0640184881289145DA6A00BC87582C6D989A6B8DB26552F7E1B4DED0F33284D27974022802B72CA52ED5BE8585215D1A5838C4B416D0E8C1E225D44D51031896095DA2355443C5ADEBBA6629C09CAC074F6410862645495655359178A2AE651704DA5F883947B6614491C2E52FDBACAA28BF11068E58D315E6DF9357434AFA0DBEA24FD3DD0CE5645E1944B33AAF64796E20E9F2201A1F3DC4C7B5148610A2E1E1A1A371008165CD00A2B52D7F1581280E78D12FF78E0F6DC501A2A9ADCE53C3C3A75EDD1B1A4E0E55ED9DF2278FC75D10F5FEA7BFFBBBD31D7AF98612A85271A840C0BF2AC656031189E7B63366669B8BCDD8678E45A931D381F9FA60E902D6C5101D2A717B1C64D1ECEC2CA74917802110468FC91A0C55B10D6451017838DC3C343B87E139912711451C48AF68BAC15B0AD081084D22894084F3A42455CDA87C867FA2F249BA9ED15EB65B94A22C95C6EE22452C4C9FAFCBE0089340638BEC00A2EB7D27C4B4EAD25C8A2B176B1BE6B85D0FF7C0DAD1489A10C89D9436315AB2209A9A2A89216A1375C6F7C6CA59D60C21DADA1A028836E1B6EA18F972B80A51DAA210557576FA41EDBD0A3FBF37F46AFCD8DE3083482D0F779CFEF6B7AF57E9E53B3BAB556460832246565723314ED24C231DC3502DED6FC508A35D3C44DED03AE90B2A79828205915529737B2E260334BCAAAF2C00430B579775DD1743321844D46E205EFE9C333B51D57B044DD57CF09F2ACB28BB64392D49695C7420C9DBB2B82DCBDB7C9AEF5165B547927A323E9E3FBF7997348588933910DD1ADF87229ECFA1081492B5E9C5F608712C1CCE78BACC72B129F2123BBC9269C470CD9B3BE698DD174B8BB57145ECFCCC4CCAE12D274E747BF48518BA7FBF0844A4E51540A059B32A46CD5628192F1F03E5C5203A1AB720EA2431C6639D497814FE6AA71065AA3AF5F270D7A9FEFE762F4214A8D2D8B833458EE2E75F60439936E80C089AB4BF76A9D992AEC1F5F560A962C81144764E636656239A5315B40BB50B8B4DD716D4FADA5AA4C872D5C92D592536EB86A8AF47D7399F61E0302E5DD7747B2E298E2053C94D5AE57C00918FCF6800518C42346199460E431867DC4716096E8A9836A2EB5C5D2229821D8B8D6D762E165FA21F97CCE0D446DB60B372B1A9EC781140846BE5E8D6BC79B240245B9D8D653374F7F7C21081089BF101049A35CB82283E7CDC82E8D4A9B54E0B22ACE139E68FBF5A05D6D4D13885688F40B4F4F56F7EB322402132459651E633661AD7E9280C22788F324BDA37B44C38551FF2FAA1191A73CE0F67D22D6186165958686A5A0479A4C6BEA36AD91009288AA2AE29AEBA7A4ED7BB2246A5D1D7E3AB930CA1BEBE07C770F5F8327C7D3DDCF8EA38152152559CCA8D10F936276EA1201ACF691C0588E2791031C38800E4A6C8B5A04B70E9359E54345E0EE3566AEB5155EB08E819B5C31BD0D42C15E654FA3109C59951DA6CF6004CD047A44A4B76437498384AC908D19C19423456B54792627BED437BC0C6583BDA447ED45CF4CBBDB55355A0E30022BF7F0B9B98C7AA4E0D9D4A6E8DE19FAA3D7FFB5EBB5FAF98DE6DF9B33F6B7EAC56ECECCC9E374C22C3390D07552AB63784E5BEF3343A74F96AC0ED2907E5B5433234EE9C9FD9B4C1291C8EC504BDD9746D71A1F6A516B8EEBDAA15EF1188B726C474EAE55BAF47D57D51FD9C4A20D2A35D46BDA0FBA470AF1EF565C23C72532FA324AAEBEDEDADB3204A4EDCBA352AC6B3199A14E3851862C228C6806214652C8AACD4A9DDC948579BF1762E160B8F74DD2BF3274E88E7393DCBB6CEEB8B454944F4FB1CB612D341199E620C4D1C4E10DDBFBF0F4424546D67CDF6C8FF740EF1E6167BC49901119AC26C591029A263223086944CEE6D25F792AAFE686161F1FAF5856570931EEDEC281953C6C27153A0CDD1D6799A9B0DD34EFB4B4D63D9EFE9C0F11EB910B94A87A3E6368F03B1B96D70C0948585DAB7DACEB62CD746984F939244124B048F08730F98A627D97A49D6C35D912E9CBDD5D78B6AAD12F7B4F938B80B42C8770EB851D3A28AAB4AB87A02510C1E9944C53599C350F183A7ED1F0528722C1AB665911612CDCA4EEA55C08DA5AA71DE1FE80874675457B0DBEA8B75628E51B089B0AF7FCE1573F46431547A40B77486EC890E6C90033BC687ACBC9933E281E6CFA6B02C1D9F8396A763ABD75D9AC20E4E3E780046617BFBD5691C29F1E0C11C87962A8E2555DCD6A310696BA09E7DCB78E99F8B820C390611265739705870492A7A6066ED5B8B8B6D2FD5761906D300B652E388978F9F70B2CA42D6F4BAAE88AE21441A4284AE5A5704EE66CE1149E453453EED5267081100248AEEE63FCC97ED47916D5AF35914B97214ACF29CCE09C36C196BA6263FA2EAC67931DD51211BBA2E3BC5EA2C07E7FC16D2ADCDCFCDB9D3B59EE76368DF3C4749877BE6A77DD8BFAFC825050365FAD2B58E8ECB4DD6858D117566950E9384A634DD4A4BA91BAF06260E9BE7C87946974134336BA8BC22A604B416046CED276D44D3BBB1984E32060E4482CC72F96C298196E93AA7E1EC2D2A897ABAB82E143C3E5FA62E122692482210C92E88043E2E4E66970317F0CCB2187284924311E730A490C2D7D83209342EF1B42FD6E0520C90B416F14A7A3AE0ED96559737965557228A74A6BECC65B502781C86ECF3977BC6A7EEE7290122315E84A1EC610E79104D15BCA444325C2543855AE8CBA65A8CC42ED8E70208BA449CB27C55563A42D613BA0C222C38E3D8087E4CC8811DD657DB76E1ECEEF4D97AC5C8F4E9C4BC96A99D40BC7C07A2271931AAE10E289ED3E5B0A1877B638611ED0DFB32DBBD1C272961551255290C108565399C092B323CC2D311C359C76429106551C464B4BDE15EE6B1A2F14A13C7C6EDB86614AB3A17303A4E04BA3B683CCBCE978831FBECB2ED1E565F2CA38B40F4E8D17A2291DCA2764772933274776A73334118B23657BA1822B6CB0B41345408A28345D1C45C0BAD2E6B251796857C69DDAFCCB7343510978C0418FB9E5B0CD9CFE7EEA59AD5F418662864852EFA8E6ACF5A6A6B9796CE5EB850AB3E7E4BD1B0040D3992C8A0445CC92B5B1069990CAE1F01179F4CE022EB45C39CAF97EDF5059348C450B58833C73102004E3FB230F9FEFBA32E8448F5E27E1059AEBE5BA31148EC0C181F7B4C028D4B96FEE759B616D318A0D122DEA877DBABDBF352A9106305FF44EA2044BC94DD178B106DEC0C639E3DCE3CA0248368738D8E99BB9F84C7B2CF3171B85E4C14E51482944CD13819428CBBC7F1CAB20144B2C64BF32D20821841572E37B42E079F570CD9CF76DB2D88C0BF971581D40EC9F27C4BD3D586D68595DDA5B3CD8BBBBBBEC58585AB179BDA96960947586D81B9FC946B53931DA5A6969BA6867BC37A5A10B7F17B7C0E112C8926C6C11F9B78DF2208EBF1E3074324F0CE6F88A189EFAEBAE7E84422C5CE85D1BE58F6237AA05B8D9CE8C618AE9DE9C0AC8890B27F0420B2FA626DCC08444FCADBDBDB87486A616F2C9E0C251289298068B82A9920D3F6AA3AC9B2055AE79308263669B6FD8520CA1AE65080A260318A021422A0A885CC794011C4ADB46611D4DC379E936F3D1443C1020C11FF1EB73CCF6C882D17E993352DAE0043B8546665E507D7AEB5365DBED4D0D4BAB0AC10D35A908B41A4D09D9BA001796A7A93A1437C2E43567911ABA19E981C859B8321CA2A92448AA28E972E6D5F258D429CCBF972CD28D6D25E4E8D982A98750ACD0630989C0933B6FD2938CDD60891B8598E1B37C618447BC9B5E164720A21025F1B57295475EE25E3C36B5B5BC3C9E138A8BDF870F2C5212AF2F8D441140DE14789C0D2D8D8D4468EA6060B2024A8A96F9CF647D3DAC060E890AACC7EAAAC607E14E720491B60CB83C4A3CF76E54AEB42DB02E6F497771717177F00FFE383971B1BAE362D3CC3BE2C722525E241E64064AB0A671F212349E079171784224B06C56F155568B910B929620A8B5834CBA463D13DDAC1DD172BA92A1844BA29283ACB0A5A6933DEB6A4EDFE4726DFE0B70044B7EF5388ACA8F0DEA9AA53C7D71208D1DED8B1F66324C48CD9F6784EB63DF802108D1783E84085364C4E0343861DB904A13114A4A2289456A6F69D3B5194A18971974984FE3D5C8707164288CAC5D696E567BB0BC0D052ED4BB56D0B6F352F5EB35F4963436BCB520A7FC3DC03AC45E3ADC621B27F975639928FB87BAF2571D219458E641A67CD1C2256A315A1280FA23C8AE8D038D228D426498E55CC8AAE29662820D56DC34CAF769C5035F7542C2BE5CFEA89ECBE5894509E99B9D1FB49EC11A499729A624FFAE314A2CEF6649C42144FB6D3EF60B63D192F2785872F00D150D16F15A7885E5C309DAF345CB2C0B18F2B8D0D4D0B715715CEBA129F083D5194E231EAA9FD21726344FC7B8567085DBE74B16549A21FE33E64E8C2C2852ECCC95E76BDAC2B972F5D4595CB36D46749229915390ABC7B35E136F3AC78A7AC830AA2519C2143BE182D42513E44D914C96CF324BEC08667D985F95874CD6C6BA26735AEDBDBD1D181E39B2DF163194000936EB5C4DAC58E00D12842E4A83300C67FFCD470729340B45655D5B9868FB16C7B3249B2EDC9E48B4254D0C32F4DA135639F42DBD5C69CEBD53A0DA729E86E8F96E57545599FDA8FA0C21059BFC1EE6C45B39A7B905A620835B4CE5B16414C379FEDD6929921B592BE082883B974C54D762BDD2E5EA8268D7EA25DBBBEF1C2338A1C410496359944346EA9B61221725394A6F1228E2CF268C2916ACEF48B14165D73B6D4C1ADC415AA56A11A6A563F9A44C3920422C99EA84ADE8B67DC86C852675B63C9E16343C9BB0954676BF1CEE3F0D87AF958B2D382E868DC82A8A4A17A873E0EA0A8B71173D033AD172F35125D76B9F1D2C505360476DDED92ADC1FB0FDD3D80A17C88EEBA211ABD45A4D16C3A333BD3DA602124E3D6238178FBE0CDEFBE040CD55E58D633DA62D3F7AF2DB462A0C106A9F12AA9207465D1B36A7C24DE657CF35681A3CBCC8E536B1AEC218BA2D11221B232203189951749DB647EFE0A5CFAAC597C7446317B41EACE86CA7B3B029934CBC55AF28836F021444E733FBDE319B521B2D4D9D6D1A178959F42D4F96ADC7F8C4044B3ED0422926DFFFF0151618A88517471FC766C76BAB5E9624B9B05109E922C882664A5E8DCE0A983E41D6368F4D62D8428626ECF926C1CC60EC81955E8584819359AEFADE6DA0BBB4BBEDE74BAEDFBAD38466CBAB5B5B191E9B62B979AE636368A4822EC49B54D22AB6508B3A9360A96028BB3E11F93055DB482105914F1942289A7FBF19E456259A3F349939E5DCD38F7E8D123ADDB6B6A5E16737486A411234EE75D00324904E72994ACC2B909569C088BC13A419D25C6DA59076AFB9011A0D9F664D2CAB6FF0121BABF9F94B84B8CA26B0DE31393DC7C6C62C299BBB1AE84D6DD08DDBD1B52D60F64A838448C2112B516CC089D7B7D71DE96EDE43C0A02B605B49CBDB0DB72F6ADB77C86FA7099386312CFEDAEB4B1E0F9E5ABD333452192449B21470FA17DED5844F4DE24A3699C69B61220A24522DB4F44A48893CC45D466ADEAACE58E39338AD998063A77FFD18E9737BABB356C68B1E345AC2F9637A3EEE67E22C800A28929DA84B1C722D634771EBC9B48DA2DA8FC93CC1EFE0459C1C98E90FB6AFC7E21DA8722BCC66814350630B3356F4124CBA1B5F5F444767CF16E707DED2084F6898D3388305A34ABAA84A1C6A6C7A48BCCCE5092D3289866F3EED2D936D0697DFA2F1E9394B0CEF1582617BE487DB9C6E9A210A500226217090E44D8E1CE28BAE50C651C67148D3A0F1D0411FE1A12CE048A74D32441A24540287B7C0C167C905C5F0AE7F5CDCCEC843B3351AFA9F2BA963D2F8477C5891880A8DC3CC41B26E7F5BE7D56E186E43DA6827771DBC21AC76960B3C7F1F2625B6A90A4DDB32E480960646D6298F4EFFFC3FB528446D1E566120E0488D6E5F5756532B87677722D07A183A55009828868B3A8815B43C19CA7068D9CB59E17238BFAE30BC4B87EEB178B6D448E80E5406AD3665A68B749E3D2C6467149248A6E4944038F9429C79016083DE4EEFBEFBF172F15229158EE3C52A43E2645202AC744A96BBCA72465D8081EE5014A22DDF046FC15E765557633949278C1CA533A338A25C5333191AD02729694AEAF072795685491D2AA7FBCF8252981A14422E1EC84D9C7C3CF86A89051438CA2ABE8818F0144C1503C988E4FAC4DAC3D0742850451305F9BF194A1056B160319EE67372CC632A6BAD3F5161AD7BB2B0F57141C6C88CDC698408B44C2CD978846C3FD910521DA468864D9A60827FCDA14D98208C18ADB2EDA7BB9141587082982FFC5B469FE80E45ED396B39E353A1F040C1BEF39333327677A5F391FC065BA2AFB114018C761A6F8989EB5378534197BF661088B92F15528D1554D1255D11F2A7A510E862831593DE240347C0044FB53C48CA289DB931313EB13A1F8C43ADCAEADBBDE443184F22B32F321BA2DADDD750411D16694A169F46A684716FD2C92163F92B30FFB145F2D1846CDB56FF1BAC2F36A3A128970ACA9B28550D4644324E441245922C896438C223B3EC413A73F6E19D9EFBD971D2EA2BAAF3044B88A023D3FD32495440B56AA28AB2D110B16ADD968F3A2A2ABAA01D6B51753DBF0AB257B01408A23FBA899249625DCCEC8798A2144222D8421515603A2224AEAEA6AA8D8553998A1444D0D48A20419EAB06F98E8608516244651DFDD091044C1F8049AD340D39349FB3D1445A8148682B83F692DC8207A1FB5598BD5EB27D16A51D999C88B6138307EF4DA5E159CFCDA972E34D73E335D87109532E6CA25D2826B7526E7AA3349722C6AC12208B010C8CCFCB8651F938799493DF9DE7BB7F2045131885016E118B567742411AB9695B3D4522C9365FD607181F7BC57F5EAB983B84510B2321981CC71115E92B177C1733043A2A84603AB81C0AAE81743452ECBC1CAACBF7A32017F0D4C12715424875F22457DE86434DBAFF349D61B284E50A1E682028288041737D6834410BD0F77493D296DD3C2E96792EC6EBF91040E3755EABEEF74657A6ADB6A176A9B31ADA4B3EE6EDC129E3656E86FE0715B381E51F80073A49E8E34E6BB2E376DD8E0E91A126005038DD9DDD2CCC87E6FBC7488C8439C4157060B163AB27BA130AF59439378AAABD568877A9EF7F25A0E44129FC14DC3BC9C266F5B958558C4535893DD7533248A7E3FAE290E04FC6AA8F085294199F583104A8C509D36E52F410116A768AC014D557B37C213970D7738840A0BA219865108181A05538636AE531586F5A2A2D3608B3289692D43C974352F5CA83D8B712BF8984623386BC254769F3D334CDA60B1EB0CE4C20427BA71DB3CCF6531E4C8A118082262FBF0B93168A2D1C4434084474C6D6305FA4EEDBED30C1D93351EB710607E8F7C4434C9ABF3273A540722267C6413858FA1C34B8F46399C9821784A60880F60650356A67407B450C14B73B032AB3E3900149DECDF447DC64C22B7A97D288A2E62E663D5BAF025CDB59D9A2A0D2257FDC7037172F4361544572EB3DC11353345DE6909942433A319A636FF408B7C6765E1ADB6C53636228D3365D34C47977173F615D22F08403D0319A5BB159E19E59DC3114798D207D367348B1CD1891F89052012F7838897C9DCEA15D3F60914A7009B17840CE7583E0AE6D03A3BD5A849B4B704A447B3850FC851C9D67F9EC25ED9C484B3D64664A335B1E4B38353260B5D9C1294D948CDC98133271389C944283434491F1E49849E8BA266CC45B7040F714C95069123882846E0EF92091A9796700E0CDB6B484E8A805B1FD1C206276C7B168E991959EFAB5D5C5C6C6D587E4CEC6F10FCC8C8DCFCFC32508462E00A2E6257F46814551AD166B26C467353A6D48A16E0CF3858447C1620050F512801A2D83291DF19D374D26664289A848E97CCE5AE8DC36DA86953762C1F4BF8707CB651A7889E5C63C2828832846370A201C396C2FEEE47A9C90257E70041345E0D62283152533D92EC078EC6C6C81A4F7878B23451947BB169E6E3C519CA2FE50E666D17C0B5BB584FCA4A01594F29BD4AB24C3FD2000A477F5A50356DE507ADD71A9796C965E2F52878F9BBF3B8207565818C956A9D5F79B86B8D6E27A38A381744EE8E684724391C08F962C82DC1F6878823E1EAA60896CBB1C11EE0B1C35BA015434E9DBAC2848F480658E50B1F9745C8E49827D727BEEB5EAF15479888206273A422B33B6A7A32FFF21C2088CE9C468308955908711AAB09E1E0217C785F49541C23EAE4BF284205A3D5E3B7B320DA5820F95ED68C98820F6D8A969A91AF651C2593999D6105DFAA8A2674E312A8B31426BC6382693E5B412EE797BF4F5DB4791B22260DDC10318A841C98AC6FC6F289C92AAE16F68588245F5B5453D54C8DC399D682E89A3B13CB48D67C58B7F031D396E5631FA91C41A4A43CB971951C8680A200EF9A6817DE519F1C5E122588777FBA667313051178FBC9C4999A3304283ABFF16088B22F3875F25F94A17C6D46AB882C8C30D028A3FDD5B0CC12958A3DA4D3EA709564333DCBEAD6F0A10602914CE6EBE9588561FE82B41D2F3DFC5E23F1B07321D2B9AC7E1F21CB908EB917D4C58AA9339BB97D20E205524AA498EA6C54409596B21C05F63A5439966FF94433B9BA4BC95FD6267BF2A2BB779D6591715A8FEA82480CA49E14BA42FB4344521E8981EA712A8846AA43C99A9A9181EAEAC46668649C0EFB0C1D4891FB925327FF05112ADA98344ACDEBDBE09A3D20964493B554968A1FE428C5BEE6354B9B914120CB142265190ED9E462A03C9E3D9C9E9E695B7CB88221CB2B8D0BCFB6F78148CC2EB616DC42CA753F4F9FE513956B1211FFE0228E4395A4A8E5D0DB4323B968DA90B3DD2E3AA1B1C05280BCB1599E3CBFC60511A56860D881A8332F54549A8B4FACE891C4E600114467C0320A91BFC7AB6B6A6A48462491381823E7592789A1F2820815CDBDB23D0BE320891EE11896C6059AE6106C925256B41A4EB331EB8268A9D10D514C4AC3497BF837D7AE7D6FF1E1FC3CBA47572EAB59F5447910C52C0E842CA9C453633B1FA26CD55644978136236D1E6D6C3BA3CCE69D81C4E4631CBC4C943EB6E5638B59F8C174FEA435A9004479A7121EB29E1A291AECB7C7226A81D4A3E7F0CE1845344E143A533D993C8951A3EAF1E4E933C0527F3274A6E6F40825294F2415BEECC4C91F7B21840A99D55959B3D1F1DB730A5CF82B971FD39506C4AC76B56391419F86CEC664CC81EDF3001B9A2ED10227507438231A4CEB87DFFFFEDF3C5C61CB4558C4290BA25C3942F171955A33A00A089B5C55580CA2E802A9476304F3D8BA2209318E1364E027A36EA3850FAA2BE5CC9AA4656C3A9F075101499477E60122A7D200291A18B0C622AE06661E14BC4E2540C4C451CDE9EA339B9BD5804CFFC9CDCD81EA81D078280108015E9BA1FE508849A490239B0A5EF896CB071A4553071D79EF3BA4AE4F3A10BD7F7BE63609125D6E65A736A70A84C824CED467C1899F9F9B212821440DEC5C8314CA98A8211E3E5C7CF8909B9D9D25F993C626F7A77A5BCFDA62E81A58E55AF7CAD21E05C81172782A0691405AF02FED0AAC38DFE4B8282EB9370D4DE64179D93EBE33CD84F60A1558189F238964C9937FF21943C206797638ABA3FD0374B8D36ADFCC0CFF2210211BC3FDE09A55F727264FF6272713E3A74F8E27FB6B1244200D549FAE01A3896C191C3F3D10B2629105AEFDD8A5FD8DA203092A5004320127587D12B2201AC574366AB34B4B56E90C31ABED73C8863EE94C9DE542C4EBF8198FC20D8931EA695996DB8871DD42F31E44A6C86A21886C1546040C9F6B31E7BA73074344438D0D38E60CBC2FDC9D08D69A2E0BC00FF89BA4E720C367F3438C6EAE1044D62ABE944473FB05200A5286B04BCFA268A07F98E757FD81B9B98D78C1AB552A44F743E343A8D6C66BAA41AB6DD6F413788897563390AC390DF2A986CCDD070FEE4CF599502244045281EB4F9CFC4311747F7F88B010120FC088E6EFC12A7A20814B73E52A1D8AC1563429ACB89AA561F97D20E2111401E36B7678BA95D403AC9898F640AA2455E5A3914834CAB08A15A028C6E7A1736888389D38086A84DA3F207F04CE893AD351F9E40D3A922845A3EEF9EA2C25610AD195DBF71467C845D1C4E8E050203276F7EEFDE7CC9D39C7D008535621B4B3ABFBFBAB4792A8DCC0650323C98208BE9C4C80A594D89C3C43ACA43C2430687D29701811741044134FD8494A3F59C31153247FCF8244A2550542C89145BAC8B200446D5910C1ED039C26CB61D6954A1E6A5CEFEAD9A90F9332B58D29CA08618A4045A495CDD50B40C447775174B719D4FE89223F2EA9426D68D59E1326D91F1A5E17E43C8A78F7E29B8210517B88066E1D8A2626E2F18209AA4342C49A16C9820F38C6FBFB473651208D8372233124904A44109DC11077756273BCBFA0693485DDD4D9998F83D4D7FE1059828871B446D760E36E1DB10000183F494441543B412266565B81157B805D0E44AD577220DAC05946E959F22B7094ECD26532FE171841B0785E55054CC4A2647290322C4125237724F56F7385DE9B133E2A012270BFA27C1A53F88D8B3A4FF497B3E82865AF449224F27AC91B4CD96839D97DD7916B59E743C40CB1191745C1E2E582538784880822B78944503A5D7DB27F73135DB681EA10EE631EA83E339E08D5D42437139B9B96BF96850071F22F9660FAD80C1D04D193AC13A392ADA6344844370661F8D0D5EE632D0B2D0A11D304F338AD3DE27CC09768891A332B78599BB50E4B5C11AA7074886196CE15E6DAF220427E3881F8EF98C2BFB480ED67B2B34ACB525F4C3173163FB2EDA3E1AC8C3C8844D74980A788149344D9144D16ADF63A2444056BAB294A9B93A0C112E0F387E08193FDFD27AB4F9E0925FB0792EE08928B012224C69E1FA25C6D165CCF3E53288B717775E382688FF24BB98AABAD7596FB40C43D799256E667356BAA34FDB764217663EBC606D11982F5CFAD7EEDB97930DE7942959DA7B5A8CA64A9C0225C31451823751B1A559672068DBBC687D6162D4C7AD03D780EDDD48676212638F2291F2292D98FF2DB32A05ECC26CAA5687F864A86A8F054223A678FA05433420551885847C991EAF1D0C9ECF26CEB293168DDD8573238F78B459C2C418455922EF54F962B3A412276B645AB67B134886419209A03D33A1373209A6FA22E1AED22E2AD7F3E38C2309A273F642752B0751FFC330E9D2AA60279B876E09EE7519555A724A5C9370D6D3B16998D624EEF4A138588645DED190E8A926D43BB56FE39F2C97560D2988BC4045925E991B4CC7385BCB3783E4593452A760E0BD17E3FC940C21C0828B6109004D6D2994D308CC03A0A658721E129A9935F0C9E5CE4F2D461018840DC3A18A1369B2641229698246602E9F5A066B53D4DD5A240408D075AE34A930D11DDD74977A009D6B6AAF999AB979DD51A3644B76FBB21E20121D6F1489F59B4C995112B505F3A8A1C1456315A53221384B2904AA30B86BF5FC0410E8DDF5FC98902595F301B5AB24593603FB1CBC7770B1F3303C6121FE18885E586E8FEEF925F7EF9C54FEF4DE45194CDD0EFBE32FFF9C3E783E8A083EECF9BEC47DF1E4C6DF0D1920335890406B913B9256C24F051949E2C88F27461F16EB310C308DF79534E90C82607CD6A391722F2BDA62BD79A5A5532DB879CFEC7CBCBCB3C8EB7A556399D0FB24C8CEBC665096BCF8C6C7506109191A133D8C24F5D6D276AC350728B08A273C062870B9CE15D54A19F472A7FE479EC0227D9D7C598138FB63D045B4189BA2AB1BB6A4A4DB32746F9442D9F2CE1138DCECECE59203A104D6DEDFDD3871FFCF833F3ABCF46FED14D91902B87EE3D35DF1DB8F7078188924492FE03E09A818FB6D97F26718670544D926C8E40224E7EF860D937E5BA7B204438E957668268A6910489041527DEDB568275A4D3524AD5B4582E443F585C22F3AB686A017368CB208AF0B3AEAAA4BB5DB28CEB8B4B0F1F3E8C99B910911C9C3487C3445CCCA45CF2C81A6D6F3F22BB033D32513958E5CAD4274044B2AF57565C42D52AE84891F535220EFED40D7CA7B2A69189802A3E31A82E5DCA173E3C3D418F7221BAFFD5D377FB6F0C0CBCF3AEF9F98D41972C12C4BC29514FCDEB37EEB9192A11A2F143C096080D24896974A61F184A629AF6F4E9E4E48093A90D931EC6E78328572D67CF70985CC7163ED2E401DA2C4D869A69D910A93AA7ABB2CAABDB7910B5D5FB7C611CF39311C17C92B174D03033DB809022E828A4E0CF42532B1C0BBF80A33044A9395C2DE1E830CB61926DAA9809E3FC080BF4A49C59FE54110244747FF9F7F82CD146DF082243FEBDAA77045450889A241BABDEF36995A7C2C7B4850F9615C94C70D1C94B731BD910ED7D75FDFAC0E09D3B7706FFE18DFE415BA3CD1186724E3940F4CE47C1430FB99A2A3662AF304589E4F80868B59A933521C0A9FACC487F4DF2CCC99A93164434937FF0B39600515EDB2B091235D1209126F87CBE5E3D03E208AF3FB95165BD12C0D27D5CDAD437361EE1825A0BA2169FAE74F56432AAA1D2419F70639A693D63703E9CFD097774EDF1C2E2E2CAEE8AB2BB9B0F11994035BFF1288B194A0B23844E56D896B2B0628E946BD31A1B873A33BB4C9B85442BC2E8FA40E8816E1DB7200144155ED5E890B4EE5EDE2B06CEEB4CF8E81966F9B80E81AA7B041E87BF5B10FDCEFCF199813BE4EE20B0140CFE369D9649D46132F8BF7EB73679877C6F2A14FA6928F41142742F18FA5DF2A71F050F21880EEC58CC39483296861D6BFA4303A7AB0712D5FD93E3B6C74F06158D95FADBA6EE97288830F73A6605892ECAA206D75EF585C1A1D60CB2D385AC76C9546220C7C7031F8AA6EFC0A13A10A9FA395CDEE193947A3D5AAF735D628FAF2E6CD49FEB317AEAEB39A34E512B1716CFEDD6FBEABA4C2907A2999CCC03BBDC8EDE425132DDCCA7F10BAE995A46A9E669CB4A72C9192185C1A23952267EA551A4434054F20E88FD03EAD8E0BCBA2EE12E2DC9EBF7EB810EB523E6AFF07ACFEB2A153E7C26A6E41EF06F1F60D699E789BAB620DA33AF5F1F61F7EF4C04839B4F7FF3A96ACA9F8893A1BDB58FFFC97C3A0214FDEB175F98E6E71F0F1249B4F5AF1F7F667E3612FC030922472061AE0D936C894912D3769CB43E12B42E11A1835D3387213ABFBA8D058908443D8080AF4F07307843ACAFEF528D4A3DEC0388BAA266C037DFE5ABEB237D7E142259F7F13D7D46A4CBA84BF7D449BD61BEDE90CF19311F0A23B5CEE88A44EB9A5BBA762B1716EA96E58210B9987116CCDA5692F8DDEF7EB765BAB7F9BB78344F4FE31D91734C6DCBA5935360194559E31C1D35A4E96AB437A09201EE195D8DA815488E1095239D990ADDAC487BB5885756D2AA22154FC1E27A40991A7C2E884CF32FA899438FA4397063E86F9F98BFFA60CAFCC7FE77DEF9B1F9F4E69DBD2FDF79E71FCCF5376E22445B7B376E0C7C6E7E4028FA830822268E101AB0B2FB4746484CDBF52DD27E76F13920DA5F10DD5D27563599BADEF0985734EE9CCF57A7199529A3A717A48A511FD37BC346A55C970688B82EB32B3C5FBFF3E81C81A8E11A91449A4F0221B553A9F784EB7BFB7CA998CF542B11A2BE5E1D00E37ABAC25D3D2DBB958B8BF52D6DDF9B9E9E9E2B2889DCA68D4BA92902A527FB6876077A5C4A8D235B83AF5C253A30056FA7A23BD0E935408F714637489C57D48AED0C08547F87DFDBAD47CE7B75F5042777581BB80A41C4ACF27C88AE0FB8C23FE6676FBC3338F68969DEF8D2BCDE3F780784CFD087E63FF4DF843B3F42886E9A1F5FFFF88B2F87AEDF2C1922FFC15DAF45494A8CF7D75043DBFD30B9CCA5E9B392041135ABE354DFDB412290449A16F519959AE1E370434725D95E5609B227E3E333E73275DABC6F07807120D2D5734617AF3FAAD3677D5D1B4020E7333304A23040549FD67CF57ABD6F698540F483CB8D8D971A1A1A1A2FC281F676CB121CBC4BA9B95062F2C82C74302BC98D9F6C3174EDD2123E00BF55532BC0507B25D37D3E50C147BC8609AACBD025513EDFB11AADD00CEFF94C86EFE800BF8192C81905B6371686E82BF347031FD9A73561AE9E190C067F09BEFC53F38D774093FD93F9CB0FCC9FF48F04FF056803883E30577FFCD9C703376EA0242AE9328E3C9720B229C2C4C89933D935B4B432EDF7CBD0E8AD092A88BE670589800010FDC08E960188E43A03644EB4CBA88CD5AB20898CAEAE2E604A962BD322C77108513D17AD0F1BD17ACED7A3ED54F6EDF8BAB4599F69561A729DA4D6457A7D19A3BE4BEBF269A0CE10227BC0233B00AAC646A0AAE16A131C3863791AB112ED4A0D457CBDD021A49D620E0B3F39DA46186A6CA10CC287423D9196B91386948E7A032218441DDDDE3E70347560CBE8EE36F8884EE6FAAB4CEEED53669D0BD15373BD1F6DE7FBC9A74F9FAE7D6C7E8E1005BF347FF4948AA89F9ABFFCAFE6BF81D9F4F4E9B728449FBF3170F3E6C8BD52197A11418414E40EA7C1234C82D6878528780044B7E62C6D76E52AF6869225523D28897404A3CFE8E98AD4F3208F7A7B4034195CA5648AC808091803440B3D7DBDBCAACB7C6F584E2B7D921299D7F88069820C8A840DA5370CD788E3D5E5E967CFFA56169A176C88F28F7CAC2E5E6C6A6D6B6B4566DE7CFDF5BF7C130EB8F7268188554EBB22DC12D7DCC816BA831943FB5855DD0BB2473440AB7574675ED1F4EE6ED50B36927E5E97D187D489ABE6643FF629B37EBCBC8C895FBBB2F143D31C426CA6264740730D80761B24687D6BDD1CBA0174FDB339F4C68FCD271F7FF1F4C67534ACE1277E34F0E147A5BB66CF2D885C71845056791A7C8F8C207C4188F21802AB3A363F478344F89953A59EDEDEB06600042AD713D571C18B90317A35BD578F28C6769D696A11C3E84388CC862B4D0BBBA661B0F483410E5AE74142791A16A22D3FDEDDFDC5EE33D37CB6BBBBBBD2D4D898358D7BDF835105E0186BC69B036B6B5BE6EBE3C6DE1642343DBD0C226B190B4EF0FA4B02AE5BBA42B70F449D5632BD23A028696047EFF61A1592C175C3FBC27091CE9BA2AA9656662DB3B234F29505D19DCFCCAF3E40F7ECCE20889FFEDF9ABF042576DFFCC9B73E3033A0B2824FFFED5B3706DF1DFA37F3DDEB37EF2144BF359F7E708F14E994C6C2F07308A2A9830EE2E41F18B43EC0AACE9BAFF7E081248B5882D8B08C890E14EE2A89E2D27DAD8AA6D2902E6E7C31525D7DA68E3B5C554C7CA6979A9A5A29403A4045F0A1B719429495DA7A060419BB0F7FF1CC04BC96A69B9B9B9B2E5EBCDAD070A9B134A25E7F7D60FCF5B51120076E8C91374D8488C82B625E5103CB5E96D3D8663AAD64BC02A2474DEB5C85B7B7C3E0D40CBE350DF4999A2E52666D1470CF4477599A1D6C1C5937CDDF8CDF23DEFE8F6E0CFEC6FCCDC7FFFCF4B76FF40F7EFCD5D38F7FFAAF4FDF7DE3E6BD919B9F9BEBEF8E4CED818134083FFFE5175F4C7E147C4E09F3A200E1D1574AD07AEA70CA0C0491CC0B12F1FCEC059C70FE05B6060C7811E96328F775AE4F338DC8DC1CDBBC86BB3D23115E96714A1429E190D39424ECDA439024CD78A6EBCF761F3E7CF8CCCCF01C6FF2B48F83147080A3D6D6CA882248355EBE92B337008F1A84C6180096F65E7F7DD0D88BC39735B922CBBAD7B060820B1F217DAC606AABE1F31836277150039C7C09F364726E9975A114ACFC6843C168ABDDAF6643649DD9C10FD6CDAF9E7EF9E5FFF96CE82FDEB933F8EE4FFE31FEC18D1B83F746DEFDE097F18F6FDCB8792794FCE2F3A720803EFAF8DD77DF1DBC39F4935FFEF8E6CD0FFF20109584D0D41471F2AF4E1DE2771DC01019F4B9A1E016620C12B173498273C04C5A26F90E8DA4955401C7AEE81943C1D18C6C570DC61E0D6E9904B9FB545C0ECB0B82C04563027EA7520635E2E3343DCD2492C489226F4ABC5D4BE698B05823149B9E2650B5B636A1E7865C31B07C00CDD624DC2407E1CEF8A0F197AFBFEE2BACFF2E35EDCA9889B5BB15D5478F1004149E0488C265D65654D355664DD265208B371E3C98C3CF105DFF2149BCC739BB8337AEFFE8DD9B37076EF4DF1804AD36706360E0262AB80F6FBEF3CEC0CDC17B49330EDFFCA5B93E307273E0E687F74606FA6F0C0C7EF4FB9E1C5B3A4253B432EDD2D8BE86D9D401100573028D2088E0849192B7C76C8E9826F4E8AAD623804103A7CEA76AE4930CAE1A5C06410588B637D8D62C44459F5F46874EEAEACBC0F7F18FFA18305401228D04B9F121524D969631A06CCA8520522451CCA9521449B5DA1270D50296F524B183CC375FFF4BF803FFD7A0B0F2D4C24DADC716428D97DB96243AE7DC93A2F1A3A3CAA3471B29264DDEF6C0D1A9FCEC68D9D19F299F1CF19483B91429234FFFB687A2843F12808F8BB441A6136F9CC7E8FC0E78729E40B798E6313BEB719DDF3B8300C7CDC1C11192E2B877E7C33B2CFC48EE85CCF8F51B838303EB19F0D13EC27CC7471F7E782F581A4343A507ABF34009E61FF6F75AC88C19CBCE7E2E4134777BDC9D35238288744313B39A74BE62CC5AD67D316AE2685A06D3661834D20D0D6E0D53DF796495981188703FB9D2DB97A9077184416E5C5DDE95312B551AE40EEBE12EBECB5717D680A2A829BB6A5A5D01BDDC5AE9983B053B36686EAD8D13885E9F2486B5BFADADB9CDE301890537C4956BB8D8BAA4F231D6B9EB61AEBF47B6D2731200F2B6A2747ADE2EEFE0AB8E2A5FF7FECFAA9795B7BFE6218ED9110F516A6F7B3A339D1EFF033266676666A7F795B0CE0594F42BBAA73352A191ECACE780CBE51CBF337FF2067A6CFFF239FC35B5EF75CB3BC6FDA5FEE4C10065A1B47AC95569FD5C0C6129D8DCD884ABD90CAF12A63C303C47F70BA63159A1FB784C7C49466546C59DF606D051AF85CFD54B51206467C30DD16312E45632958F333DBD2AD79521416EB352A8C3D012FC365F84AFD7D3E734056729A60B4224E7D6DCF3AE92102935C6BC7BE2ECC3ED00FE13C153F1D7337F7DDC2305CA3D651DBCE7879E72326F987FB9EC871EE967E59EAF75825C99F96F7F0C77D081F3BCFDB6A7CCFB43C4E59332E508CF3F29535EFEB907CB43BC5E2A893C7E2D13FBFA9FEF7C7ABCAC223C133EFEEF8E55E962D911BFC7F4AC761E29FB869FE3784FC9176DF22B73682478FF777BEFF68F4C1D12A2A103E77C16422878F031D5985D697D6888D850ABB9315B10919D4034486415A1696C673D5CFD58975169847BD5084014D57B0206C8279F68763D7A940D1148A2982F53894A4F552B3324C86D56D6F56532C0E239B5CEE07DBA56492172F7C0BACCD53C885C252160AC8C64051A47E8D37BFEFB9FCCFC49BB4739D22E7697299EE391E347519E1CFDC627C73D023CE82F133CCA83237FCEF9CB08440A8A220171E93CAE7864CEF480AAF548BAFEE911DE93C654AD473BA1EB15AA5A51EE3DFE1FF9D7AA2ABEF1F2EAF1973B8E79748FFF1BEDDB9D1528E44A501EB6FF9679FAF4CB7FF9E0C6CD8F0E87D0FDC95246341E74C10B1F74C68CEB9F3D872062E5A94C10E1D5A0CDD3B2552EA1B19DF57D7520820022B2D31E6F7B7B11A2707D4F6427C5EA3300A2185567662583E8715DE69CAE47BBCC4A8906B97B7C5D99984F6310E96E88E47D20A2F6AD5DA8E6A6688439521EEE3FCC1CD9F028FC6B47CB80909F2B3F4303472A8B283FF748E441C9A36CFCFD9FBE0CDF85778710BD5D2EC2FD4F5FE695B2144004FADA23EB9DE57FAB79C06990554FDF2B5E905ED1B24F02AF1D318FFCEA44A0ACA2EC938AF31EC3D37B04BE515608A222570F1EBE3770FDFA0DB0B607EF1D0EA19205D1E111B266CC64BDFE9221CA1D8C767BE2D61815443448245935B034F1E1E3FB7AB018A8D2E88A5288D4DE3E648233943AE1D11CD646E02459959330C81DEDF5190051B89EF3F51A3D5DD1FA985169F69120B750C9653807A24C6910896E8848B1F5008D54BF39623B521EFEB51F824851CA5FEBFE39812880173955F673E56F3D023C18F1A400A23FFED31F463C4457813A3B120075F6E9B14F24E5E8A7FCAF8FF84FA89EB4FE0A1ADC9E8E55506A9DDE98F9758FFF8F2ABCDE32FE48E084B7CC5BF6ABDEAF0344DE3FFA06AF2B8521CA3FDBECC18F3E04A37B8484A90F83508982E87910A28364732BAD4BFDAD38CC2BBB08E3364BA1637FCD45626490622C8DD944E9BA70B80F20223BED9924EAEAD37D8158DD06E90E9999354925AC26F7F6F644954C2F28070EF31C6AA087D7B53E33D3AB851543ADD37429AC69BD0422CD7441E48ABFE4BA6762CC6E5DCA2FB3663EBA67FBE7E06C7994327FE43840743472FC38BE8D63C77F7EC4239107650F2F95FD97C0718428450C6B309D03E59FC26F79EDB5C86BC723AF7478D4488557AFF0E8154FFC7EBFA762D5EF69EF7DE91BBF3A7E54F51EEDA8382A1DA9FAD5D7409DE955C77FDD7E34258985213AE8381443A509A2E74228C866CC0482C55EDFFE82287B57301E44102D5CA24122726D0449D6E4304004575FEEED5333BD990CEEB437C2B2CEC58C74AFA2F5F5A5493DED838D288508034B69134B20971FAB9AA692B5989A9A31CDB4A11B7257AF868F6A9A86BB1665332692117BFC0110F1AE92106B0CBE0391405CAFB4500E0246F9E19132B08C3CED654789E0E28E7ECDEF91E8832F7BE4F3FF1EEFA0F0A22E7EAA0CFF5202473C477E1D05E1A377074E98518F7122D3DB9DEE866FBDD62D9F385E7644D6C497E137EA9CF7486799EA513EA9283BFAB39434F33C101D0EA1430EAD3E1C4274C6CCE5E6604E1775296CD241CB3918592D1B98F2B0DC2441D2303E4817DA6B58868C3BED31D8CB1E524C93F4896D9099D6B2D51A1B25296E6441B206BA98DB92A4737DBAEA76BA6CCB1A28DA76F9F8B9533E79777511A917339C02225A21BBEDB44213BBD95D40624D4523A5ADEE326B5922DD405C949734D37885F71AE7631569CDDBEDC5B2C7CCAA578C7418FCF90E8EBD5B55553E7DAD5CB21BF29F03A24322545231DAF38AA1209B3173D5A5755DAF32FB85176288AC2ACA1544745EACBBAA98B73A16151C4F4476DA63E5BEBD2255A723F7B221022FCD86E83185C8300D4EC2B49B9B0D44CB194BB49F8F2F2A96F14389C82AB3161C056791E3790C4F6FDB51B22DC31E6C6C58A98D9C5644DD542BC48E4885E6E58C4845B7B15DA167747F40E73358A2A0A664D2F45655E629FF99F34267FE1F5A97655BF3A984390000000049454E44AE426082');

/*!40000 ALTER TABLE `filecontent` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table filemodel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `filemodel`;

CREATE TABLE `filemodel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `filecontent_id` int(11) unsigned DEFAULT NULL,
  `relatedmodel_id` int(11) unsigned DEFAULT NULL,
  `relatedmodel_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `filemodel` WRITE;
/*!40000 ALTER TABLE `filemodel` DISABLE KEYS */;

INSERT INTO `filemodel` (`id`, `name`, `size`, `type`, `item_id`, `filecontent_id`, `relatedmodel_id`, `relatedmodel_type`)
VALUES
	(1,'200x50.gif',449,'image/gif',3,1,NULL,NULL),
	(2,'200x200.gif',712,'image/gif',4,2,NULL,NULL),
	(3,'580x180.gif',1898,'image/gif',5,3,NULL,NULL),
	(4,'googleMaps.png',39873,'image/png',6,4,NULL,NULL);

/*!40000 ALTER TABLE `filemodel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gamebadge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamebadge`;

CREATE TABLE `gamebadge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `gamebadge` WRITE;
/*!40000 ALTER TABLE `gamebadge` DISABLE KEYS */;

INSERT INTO `gamebadge` (`id`, `type`, `grade`, `item_id`, `person_item_id`)
VALUES
	(1,'LoginUser',1,22,1);

/*!40000 ALTER TABLE `gamebadge` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gamecoin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamecoin`;

CREATE TABLE `gamecoin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gamecollection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamecollection`;

CREATE TABLE `gamecollection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gamelevel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamelevel`;

CREATE TABLE `gamelevel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gamenotification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamenotification`;

CREATE TABLE `gamenotification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gamepoint
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamepoint`;

CREATE TABLE `gamepoint` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `gamepoint` WRITE;
/*!40000 ALTER TABLE `gamepoint` DISABLE KEYS */;

INSERT INTO `gamepoint` (`id`, `type`, `value`, `item_id`, `person_item_id`)
VALUES
	(1,'UserAdoption',60,21,1);

/*!40000 ALTER TABLE `gamepoint` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gamepointtransaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamepointtransaction`;

CREATE TABLE `gamepointtransaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `createddatetime` datetime DEFAULT NULL,
  `gamepoint_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gamepoint_id` (`gamepoint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `gamepointtransaction` WRITE;
/*!40000 ALTER TABLE `gamepointtransaction` DISABLE KEYS */;

INSERT INTO `gamepointtransaction` (`id`, `value`, `createddatetime`, `gamepoint_id`)
VALUES
	(1,10,'2016-10-06 22:29:11',1),
	(2,50,'2016-10-06 22:29:11',1);

/*!40000 ALTER TABLE `gamepointtransaction` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gamereward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamereward`;

CREATE TABLE `gamereward` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cost` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `expirationdatetime` datetime DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gamereward_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamereward_read`;

CREATE TABLE `gamereward_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `gamereward_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gamerewardtransaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamerewardtransaction`;

CREATE TABLE `gamerewardtransaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `redemptiondatetime` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  `transactions_gamereward_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gamescore
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gamescore`;

CREATE TABLE `gamescore` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `gamescore` WRITE;
/*!40000 ALTER TABLE `gamescore` DISABLE KEYS */;

INSERT INTO `gamescore` (`id`, `type`, `value`, `item_id`, `person_item_id`)
VALUES
	(1,'LoginUser',1,20,1);

/*!40000 ALTER TABLE `gamescore` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table globalmetadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globalmetadata`;

CREATE TABLE `globalmetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serializedmetadata` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_emaNssalc` (`classname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `globalmetadata` WRITE;
/*!40000 ALTER TABLE `globalmetadata` DISABLE KEYS */;

INSERT INTO `globalmetadata` (`id`, `classname`, `serializedmetadata`)
VALUES
	(1,'ContactsModule','a:10:{s:17:\"designerMenuItems\";a:4:{s:14:\"showFieldsLink\";b:1;s:15:\"showGeneralLink\";b:1;s:15:\"showLayoutsLink\";b:1;s:13:\"showMenusLink\";b:1;}s:26:\"globalSearchAttributeNames\";a:4:{i:0;s:8:\"fullName\";i:1;s:8:\"anyEmail\";i:2;s:11:\"officePhone\";i:3;s:11:\"mobilePhone\";}s:13:\"startingState\";i:1;s:12:\"tabMenuItems\";a:1:{i:0;a:4:{s:5:\"label\";s:80:\"eval:Zurmo::t(\'ContactsModule\', \'ContactsModulePluralLabel\', $translationParams)\";s:3:\"url\";a:1:{i:0;s:17:\"/contacts/default\";}s:5:\"right\";s:19:\"Access Contacts Tab\";s:6:\"mobile\";b:1;}}s:24:\"shortcutsCreateMenuItems\";a:1:{i:0;a:4:{s:5:\"label\";s:82:\"eval:Zurmo::t(\'ContactsModule\', \'ContactsModuleSingularLabel\', $translationParams)\";s:3:\"url\";a:1:{i:0;s:24:\"/contacts/default/create\";}s:5:\"right\";s:15:\"Create Contacts\";s:6:\"mobile\";b:1;}}s:48:\"updateLatestActivityDateTimeWhenATaskIsCompleted\";b:1;s:46:\"updateLatestActivityDateTimeWhenANoteIsCreated\";b:1;s:55:\"updateLatestActivityDateTimeWhenAnEmailIsSentOrArchived\";b:1;s:51:\"updateLatestActivityDateTimeWhenAMeetingIsInThePast\";b:1;s:15:\"startingStateId\";i:5;}'),
	(2,'Currency','a:4:{s:7:\"members\";a:3:{i:0;s:6:\"active\";i:1;s:4:\"code\";i:2;s:10:\"rateToBase\";}s:5:\"rules\";a:9:{i:0;a:2:{i:0;s:6:\"active\";i:1;s:7:\"boolean\";}i:1;a:3:{i:0;s:6:\"active\";i:1;s:7:\"default\";s:5:\"value\";b:1;}i:2;a:2:{i:0;s:4:\"code\";i:1;s:8:\"required\";}i:3;a:2:{i:0;s:4:\"code\";i:1;s:6:\"unique\";}i:4;a:3:{i:0;s:4:\"code\";i:1;s:4:\"type\";s:4:\"type\";s:6:\"string\";}i:5;a:4:{i:0;s:4:\"code\";i:1;s:6:\"length\";s:3:\"min\";i:3;s:3:\"max\";i:3;}i:6;a:4:{i:0;s:4:\"code\";i:1;s:5:\"match\";s:7:\"pattern\";s:19:\"/^[A-Z][A-Z][A-Z]$/\";s:7:\"message\";s:35:\"Code must be a valid currency code.\";}i:7;a:2:{i:0;s:10:\"rateToBase\";i:1;s:8:\"required\";}i:8;a:3:{i:0;s:10:\"rateToBase\";i:1;s:4:\"type\";s:4:\"type\";s:5:\"float\";}}s:20:\"defaultSortAttribute\";s:4:\"code\";s:32:\"lastAttemptedRateUpdateTimeStamp\";i:1475792939;}'),
	(3,'ZurmoModule','a:8:{s:18:\"configureMenuItems\";a:8:{i:0;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:52:\"eval:Zurmo::t(\'ZurmoModule\', \'Global Configuration\')\";s:16:\"descriptionLabel\";s:59:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Global Configuration\')\";s:5:\"route\";s:32:\"/zurmo/default/configurationEdit\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:1;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:54:\"eval:Zurmo::t(\'ZurmoModule\', \'Currency Configuration\')\";s:16:\"descriptionLabel\";s:61:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Currency Configuration\')\";s:5:\"route\";s:33:\"/zurmo/currency/configurationList\";s:5:\"right\";s:29:\"Access Currency Configuration\";}i:2;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:34:\"eval:Zurmo::t(\'Core\', \'Languages\')\";s:16:\"descriptionLabel\";s:55:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Active Languages\')\";s:5:\"route\";s:33:\"/zurmo/language/configurationList\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:3;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:47:\"eval:Zurmo::t(\'ZurmoModule\', \'Developer Tools\')\";s:16:\"descriptionLabel\";s:54:\"eval:Zurmo::t(\'ZurmoModule\', \'Access Developer Tools\')\";s:5:\"route\";s:19:\"/zurmo/development/\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:4;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:60:\"eval:Zurmo::t(\'ZurmoModule\', \'Authentication Configuration\')\";s:16:\"descriptionLabel\";s:67:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Authentication Configuration\')\";s:5:\"route\";s:39:\"/zurmo/authentication/configurationEdit\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:5;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:39:\"eval:Zurmo::t(\'ZurmoModule\', \'Plugins\')\";s:16:\"descriptionLabel\";s:63:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Plugins and Integrations\')\";s:5:\"route\";s:32:\"/zurmo/plugins/configurationEdit\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:6;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:60:\"eval:Zurmo::t(\'ZurmoModule\', \'User Interface Configuration\')\";s:16:\"descriptionLabel\";s:67:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage User Interface Configuration\')\";s:5:\"route\";s:45:\"/zurmo/default/userInterfaceConfigurationEdit\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:7;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:52:\"eval:Zurmo::t(\'ZurmoModule\', \'System Configuration\')\";s:16:\"descriptionLabel\";s:59:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage System Configuration\')\";s:5:\"route\";s:38:\"/zurmo/default/systemConfigurationEdit\";s:5:\"right\";s:27:\"Access Global Configuration\";}}s:15:\"headerMenuItems\";a:3:{i:0;a:5:{s:5:\"label\";s:46:\"eval:Zurmo::t(\'ZurmoModule\', \'Administration\')\";s:3:\"url\";a:1:{i:0;s:14:\"/configuration\";}s:5:\"right\";s:25:\"Access Administration Tab\";s:5:\"order\";i:1;s:6:\"mobile\";b:0;}i:1;a:4:{s:5:\"label\";s:40:\"eval:Zurmo::t(\'ZurmoModule\', \'Get More\')\";s:3:\"url\";s:37:\"eval:ZurmoModule::resolveGetMoreUrl()\";s:5:\"order\";i:9;s:6:\"mobile\";b:1;}i:2;a:4:{s:5:\"label\";s:43:\"eval:Zurmo::t(\'ZurmoModule\', \'About Zurmo\')\";s:3:\"url\";a:1:{i:0;s:20:\"/zurmo/default/about\";}s:5:\"order\";i:10;s:6:\"mobile\";b:1;}}s:21:\"configureSubMenuItems\";a:1:{i:0;a:5:{s:8:\"category\";i:2;s:10:\"titleLabel\";s:50:\"eval:Zurmo::t(\'ZurmoModule\', \'LDAP Configuration\')\";s:16:\"descriptionLabel\";s:58:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage LDAP Authentication\')\";s:5:\"route\";s:33:\"/zurmo/ldap/configurationEditLdap\";s:5:\"right\";s:27:\"Access Global Configuration\";}}s:31:\"adminTabMenuItemsModuleOrdering\";a:9:{i:0;s:4:\"home\";i:1;s:13:\"configuration\";i:2;s:8:\"designer\";i:3;s:6:\"import\";i:4;s:6:\"groups\";i:5;s:5:\"users\";i:6;s:5:\"roles\";i:7;s:9:\"workflows\";i:8;s:15:\"contactWebForms\";}s:26:\"tabMenuItemsModuleOrdering\";a:10:{i:0;s:4:\"home\";i:1;s:13:\"mashableInbox\";i:2;s:8:\"accounts\";i:3;s:5:\"leads\";i:4;s:8:\"contacts\";i:5;s:13:\"opportunities\";i:6;s:9:\"marketing\";i:7;s:8:\"projects\";i:8;s:8:\"products\";i:9;s:7:\"reports\";}s:22:\"lastZurmoStableVersion\";s:9:\"2.0.12 ()\";s:32:\"lastAttemptedInfoUpdateTimeStamp\";i:1475792951;s:11:\"globalState\";s:88:\"a:1:{s:34:\"Yii.CSecurityManager.validationkey\";s:32:\"7rDc3KC0no4AffwYGl4CUYbpUdjD9OT6\";}\";}'),
	(4,'UsersModule','a:6:{s:17:\"adminTabMenuItems\";a:1:{i:0;a:3:{s:5:\"label\";s:37:\"eval:Zurmo::t(\'UsersModule\', \'Users\')\";s:3:\"url\";a:1:{i:0;s:14:\"/users/default\";}s:5:\"right\";s:16:\"Access Users Tab\";}}s:26:\"globalSearchAttributeNames\";a:3:{i:0;s:8:\"fullName\";i:1;s:8:\"anyEmail\";i:2;s:8:\"username\";}s:18:\"configureMenuItems\";a:1:{i:0;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:37:\"eval:Zurmo::t(\'UsersModule\', \'Users\')\";s:16:\"descriptionLabel\";s:44:\"eval:Zurmo::t(\'UsersModule\', \'Manage Users\')\";s:5:\"route\";s:14:\"/users/default\";s:5:\"right\";s:16:\"Access Users Tab\";}}s:15:\"headerMenuItems\";a:1:{i:0;a:5:{s:5:\"label\";s:37:\"eval:Zurmo::t(\'UsersModule\', \'Users\')\";s:3:\"url\";a:1:{i:0;s:14:\"/users/default\";}s:5:\"right\";s:16:\"Access Users Tab\";s:5:\"order\";i:4;s:6:\"mobile\";b:0;}}s:19:\"userHeaderMenuItems\";a:2:{i:0;a:3:{s:5:\"label\";s:42:\"eval:Zurmo::t(\'UsersModule\', \'My Profile\')\";s:3:\"url\";a:1:{i:0;s:22:\"/users/default/profile\";}s:5:\"order\";i:10;}i:1;a:3:{s:5:\"label\";s:40:\"eval:Zurmo::t(\'UsersModule\', \'Sign out\')\";s:3:\"url\";a:1:{i:0;s:21:\"/zurmo/default/logout\";}s:5:\"order\";i:40;}}s:17:\"designerMenuItems\";a:4:{s:14:\"showFieldsLink\";b:0;s:15:\"showGeneralLink\";b:0;s:15:\"showLayoutsLink\";b:1;s:13:\"showMenusLink\";b:0;}}');

/*!40000 ALTER TABLE `globalmetadata` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table imagefilemodel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imagefilemodel`;

CREATE TABLE `imagefilemodel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isshared` tinyint(1) unsigned DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `inactive` tinyint(1) unsigned DEFAULT NULL,
  `filemodel_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `imagefilemodel` WRITE;
/*!40000 ALTER TABLE `imagefilemodel` DISABLE KEYS */;

INSERT INTO `imagefilemodel` (`id`, `isshared`, `width`, `height`, `inactive`, `filemodel_id`)
VALUES
	(1,0,200,50,0,1),
	(2,0,200,200,0,2),
	(3,0,580,180,0,3),
	(4,0,580,180,0,4);

/*!40000 ALTER TABLE `imagefilemodel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table import
# ------------------------------------------------------------

DROP TABLE IF EXISTS `import`;

CREATE TABLE `import` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createddatetime` datetime DEFAULT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `createdbyuser__user_id` int(11) unsigned DEFAULT NULL,
  `modifiedbyuser__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;

INSERT INTO `item` (`id`, `createddatetime`, `modifieddatetime`, `createdbyuser__user_id`, `modifiedbyuser__user_id`)
VALUES
	(1,'2016-10-06 22:28:51','2016-10-06 22:29:31',NULL,1),
	(2,'2016-10-06 22:28:51','2016-10-06 22:28:52',1,1),
	(3,'2016-10-06 22:28:51','2016-10-06 22:28:51',1,1),
	(4,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(5,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(6,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(7,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(8,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(9,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(10,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(11,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(12,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(13,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(14,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(15,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(16,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(17,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(18,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(19,'2016-10-06 22:28:52','2016-10-06 22:28:52',1,1),
	(20,'2016-10-06 22:29:10','2016-10-06 22:29:10',1,1),
	(21,'2016-10-06 22:29:11','2016-10-06 22:29:11',1,1),
	(22,'2016-10-06 22:29:11','2016-10-06 22:29:11',1,1),
	(23,'2016-10-06 22:29:38','2016-10-06 22:29:38',1,1),
	(24,'2016-10-06 22:29:39','2016-10-06 22:29:39',1,1),
	(25,'2016-10-06 22:29:39','2016-10-06 22:29:39',1,1),
	(26,'2016-10-06 22:29:39','2016-10-06 22:29:39',1,1),
	(27,'2016-10-06 22:29:39','2016-10-06 22:29:39',1,1),
	(28,'2016-10-06 22:29:39','2016-10-06 22:29:39',1,1),
	(29,'2016-10-06 22:29:39','2016-10-06 22:29:39',1,1),
	(30,'2016-10-06 22:29:39','2016-10-06 22:29:39',1,1),
	(31,'2016-10-06 22:29:39','2016-10-06 22:29:39',1,1),
	(32,'2016-10-06 22:29:39','2016-10-06 22:29:39',1,1),
	(33,'2016-10-06 22:30:16','2016-10-06 22:30:16',1,1);

/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobinprocess
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobinprocess`;

CREATE TABLE `jobinprocess` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table joblog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `joblog`;

CREATE TABLE `joblog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enddatetime` datetime DEFAULT NULL,
  `isprocessed` tinyint(1) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `startdatetime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table kanbanitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kanbanitem`;

CREATE TABLE `kanbanitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `kanbanrelateditem_item_id` int(11) unsigned DEFAULT NULL,
  `task_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table marketinglist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `marketinglist`;

CREATE TABLE `marketinglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `fromname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromaddress` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anyonecansubscribe` tinyint(1) unsigned DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table marketinglist_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `marketinglist_read`;

CREATE TABLE `marketinglist_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `marketinglist_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table marketinglistmember
# ------------------------------------------------------------

DROP TABLE IF EXISTS `marketinglistmember`;

CREATE TABLE `marketinglistmember` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createddatetime` datetime DEFAULT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `unsubscribed` tinyint(1) unsigned DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `marketinglist_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`),
  KEY `marketinglist_id` (`marketinglist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table meeting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `enddatetime` datetime DEFAULT NULL,
  `processedforlatestactivity` tinyint(1) unsigned DEFAULT NULL,
  `location` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logged` tinyint(1) unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startdatetime` datetime DEFAULT NULL,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `category_customfield_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table meeting_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meeting_read`;

CREATE TABLE `meeting_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `meeting_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table meeting_read_subscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meeting_read_subscription`;

CREATE TABLE `meeting_read_subscription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `subscriptiontype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_modelid` (`userid`,`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table messagesource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messagesource`;

CREATE TABLE `messagesource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sourceCategory` (`category`,`source`(767))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table messagetranslation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messagetranslation`;

CREATE TABLE `messagetranslation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `translation` blob,
  `language` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `messagesource_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sourceLanguageTranslation` (`messagesource_id`,`language`,`translation`(767))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table mission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission`;

CREATE TABLE `mission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `duedatetime` datetime DEFAULT NULL,
  `latestdatetime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `reward` text COLLATE utf8_unicode_ci,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `takenbyuser__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table mission_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_read`;

CREATE TABLE `mission_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `mission_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table modelcreationapisync
# ------------------------------------------------------------

DROP TABLE IF EXISTS `modelcreationapisync`;

CREATE TABLE `modelcreationapisync` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `servicename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modelclassname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createddatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table multiplevaluescustomfield
# ------------------------------------------------------------

DROP TABLE IF EXISTS `multiplevaluescustomfield`;

CREATE TABLE `multiplevaluescustomfield` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `basecustomfield_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `basecustomfield_id` (`basecustomfield_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table named_securable_actual_permissions_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `named_securable_actual_permissions_cache`;

CREATE TABLE `named_securable_actual_permissions_cache` (
  `securableitem_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `permitable_id` int(11) unsigned NOT NULL,
  `allow_permissions` tinyint(3) unsigned NOT NULL,
  `deny_permissions` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_name`,`permitable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `named_securable_actual_permissions_cache` WRITE;
/*!40000 ALTER TABLE `named_securable_actual_permissions_cache` DISABLE KEYS */;

INSERT INTO `named_securable_actual_permissions_cache` (`securableitem_name`, `permitable_id`, `allow_permissions`, `deny_permissions`)
VALUES
	('ConversationsModule',1,31,0),
	('EmailMessagesModule',1,31,0),
	('MeetingsModule',1,31,0),
	('MissionsModule',1,31,0),
	('NotesModule',1,31,0),
	('OpportunitiesModule',1,31,0),
	('SocialItemsModule',1,31,0),
	('TasksModule',1,31,0);

/*!40000 ALTER TABLE `named_securable_actual_permissions_cache` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table namedsecurableitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `namedsecurableitem`;

CREATE TABLE `namedsecurableitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `securableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_eman` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table note
# ------------------------------------------------------------

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `occurredondatetime` datetime DEFAULT NULL,
  `activity_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table note_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `note_read`;

CREATE TABLE `note_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `note_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ownerhasreadlatest` tinyint(1) unsigned DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `notificationmessage_id` int(11) unsigned DEFAULT NULL,
  `owner__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;

INSERT INTO `notification` (`id`, `type`, `ownerhasreadlatest`, `item_id`, `notificationmessage_id`, `owner__user_id`)
VALUES
	(1,'RemoveApiTestEntryScriptFile',NULL,18,1,1);

/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notificationmessage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notificationmessage`;

CREATE TABLE `notificationmessage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `htmlcontent` text COLLATE utf8_unicode_ci,
  `textcontent` text COLLATE utf8_unicode_ci,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `notificationmessage` WRITE;
/*!40000 ALTER TABLE `notificationmessage` DISABLE KEYS */;

INSERT INTO `notificationmessage` (`id`, `htmlcontent`, `textcontent`, `item_id`)
VALUES
	(1,NULL,'If this website is in production mode, please remove the app/test.php file.',19);

/*!40000 ALTER TABLE `notificationmessage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notificationsubscriber
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notificationsubscriber`;

CREATE TABLE `notificationsubscriber` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hasreadlatest` tinyint(1) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  `relatedmodel_id` int(11) unsigned DEFAULT NULL,
  `relatedmodel_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table opportunity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `opportunity`;

CREATE TABLE `opportunity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `closedate` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `probability` tinyint(11) DEFAULT NULL,
  `stagemodifieddatetime` datetime DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  `amount_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  `stage_customfield_id` int(11) unsigned DEFAULT NULL,
  `source_customfield_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table opportunity_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `opportunity_project`;

CREATE TABLE `opportunity_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_tcejorp_di_ytinutroppo` (`opportunity_id`,`project_id`),
  KEY `di_ytinutroppo` (`opportunity_id`),
  KEY `di_tcejorp` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table opportunity_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `opportunity_read`;

CREATE TABLE `opportunity_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `opportunity_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table opportunitystarred
# ------------------------------------------------------------

DROP TABLE IF EXISTS `opportunitystarred`;

CREATE TABLE `opportunitystarred` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `basestarredmodel_id` int(11) unsigned DEFAULT NULL,
  `opportunity_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basestarredmodel_id_opportunity_id` (`basestarredmodel_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table ownedsecurableitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ownedsecurableitem`;

CREATE TABLE `ownedsecurableitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned DEFAULT NULL,
  `owner__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner__user_id` (`owner__user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ownedsecurableitem` WRITE;
/*!40000 ALTER TABLE `ownedsecurableitem` DISABLE KEYS */;

INSERT INTO `ownedsecurableitem` (`id`, `securableitem_id`, `owner__user_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,3,1),
	(4,4,1),
	(5,5,1),
	(6,6,1),
	(7,7,1),
	(8,8,1);

/*!40000 ALTER TABLE `ownedsecurableitem` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permissions` tinyint(11) DEFAULT NULL,
  `type` tinyint(11) DEFAULT NULL,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  `securableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;

INSERT INTO `permission` (`id`, `permissions`, `type`, `permitable_id`, `securableitem_id`)
VALUES
	(1,27,1,3,1),
	(2,27,1,3,2),
	(3,27,1,3,3),
	(4,27,1,3,4),
	(5,27,1,3,5),
	(6,27,1,3,6);

/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permitable
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permitable`;

CREATE TABLE `permitable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `permitable` WRITE;
/*!40000 ALTER TABLE `permitable` DISABLE KEYS */;

INSERT INTO `permitable` (`id`, `item_id`)
VALUES
	(1,1),
	(2,2),
	(3,8),
	(4,17),
	(5,33);

/*!40000 ALTER TABLE `permitable` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jobtitle` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobilephone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officephone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officefax` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `primaryaddress_address_id` int(11) unsigned DEFAULT NULL,
  `primaryemail_email_id` int(11) unsigned DEFAULT NULL,
  `title_customfield_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownedsecurableitem_id` (`ownedsecurableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;

INSERT INTO `person` (`id`, `department`, `firstname`, `jobtitle`, `lastname`, `mobilephone`, `officephone`, `officefax`, `ownedsecurableitem_id`, `primaryaddress_address_id`, `primaryemail_email_id`, `title_customfield_id`)
VALUES
	(1,NULL,'Super',NULL,'User',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,NULL,'System',NULL,'User',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,'','John','','Doe','','',NULL,NULL,1,1,1);

/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table personwhohavenotreadlatest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personwhohavenotreadlatest`;

CREATE TABLE `personwhohavenotreadlatest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  `mission_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table perusermetadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perusermetadata`;

CREATE TABLE `perusermetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serializedmetadata` text COLLATE utf8_unicode_ci,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `perusermetadata` WRITE;
/*!40000 ALTER TABLE `perusermetadata` DISABLE KEYS */;

INSERT INTO `perusermetadata` (`id`, `classname`, `serializedmetadata`, `_user_id`)
VALUES
	(1,'UsersModule','a:1:{s:17:\"timeZoneConfirmed\";b:1;}',1),
	(2,'ZurmoModule','a:1:{s:14:\"recentlyViewed\";s:66:\"a:1:{i:0;a:3:{i:0;s:11:\"UsersModule\";i:1;i:3;i:2;s:8:\"John Doe\";}}\";}',1);

/*!40000 ALTER TABLE `perusermetadata` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table policy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `policy`;

CREATE TABLE `policy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `modulename` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table portlet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `portlet`;

CREATE TABLE `portlet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `column` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `layoutid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewtype` text COLLATE utf8_unicode_ci,
  `serializedviewdata` text COLLATE utf8_unicode_ci,
  `collapsed` tinyint(1) unsigned DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `portlet` WRITE;
/*!40000 ALTER TABLE `portlet` DISABLE KEYS */;

INSERT INTO `portlet` (`id`, `column`, `position`, `layoutid`, `viewtype`, `serializedviewdata`, `collapsed`, `_user_id`)
VALUES
	(1,1,1,'HomeDashboard1','MyUpcomingMeetingsCalendar',NULL,0,1),
	(2,1,2,'HomeDashboard1','AllLatestActivitiesForPortlet',NULL,0,1),
	(3,1,3,'HomeDashboard1','TasksMyList',NULL,0,1),
	(4,1,4,'HomeDashboard1','OpportunitiesBySourceChart',NULL,0,1),
	(5,2,1,'HomeDashboard1','AllSocialItemsForPortlet',NULL,0,1),
	(6,2,2,'HomeDashboard1','MyMissionsForPortlet',NULL,0,1),
	(7,2,3,'HomeDashboard1','OpportunitiesByStageChart',NULL,0,1),
	(8,1,1,'UserDetailsAndRelationsViewLeftBottomView','UserSocialItemsForPortlet',NULL,0,1);

/*!40000 ALTER TABLE `portlet` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `quantity` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `pricefrequency` int(11) DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `opportunity_id` int(11) unsigned DEFAULT NULL,
  `producttemplate_id` int(11) unsigned DEFAULT NULL,
  `stage_customfield_id` int(11) unsigned DEFAULT NULL,
  `sellprice_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table product_productcategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_productcategory`;

CREATE TABLE `product_productcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned DEFAULT NULL,
  `productcategory_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_yrogetactcudorp_di_tcudorp` (`product_id`,`productcategory_id`),
  KEY `di_tcudorp` (`product_id`),
  KEY `di_yrogetactcudorp` (`productcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table product_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_read`;

CREATE TABLE `product_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `product_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table productcatalog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productcatalog`;

CREATE TABLE `productcatalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table productcatalog_productcategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productcatalog_productcategory`;

CREATE TABLE `productcatalog_productcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productcatalog_id` int(11) unsigned DEFAULT NULL,
  `productcategory_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_yrogetactcudorp_di_golatactcudorp` (`productcatalog_id`,`productcategory_id`),
  KEY `di_golatactcudorp` (`productcatalog_id`),
  KEY `di_yrogetactcudorp` (`productcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table productcategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productcategory`;

CREATE TABLE `productcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `productcategory_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table productcategory_producttemplate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productcategory_producttemplate`;

CREATE TABLE `productcategory_producttemplate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productcategory_id` int(11) unsigned DEFAULT NULL,
  `producttemplate_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_di_etalpmettcudorp_di_yrogetactcudorp` (`productcategory_id`,`producttemplate_id`),
  KEY `di_yrogetactcudorp` (`productcategory_id`),
  KEY `di_etalpmettcudorp` (`producttemplate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table producttemplate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `producttemplate`;

CREATE TABLE `producttemplate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `pricefrequency` int(11) DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `sellpriceformula_id` int(11) unsigned DEFAULT NULL,
  `cost_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  `listprice_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  `sellprice_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table project_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_read`;

CREATE TABLE `project_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `project_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table projectauditevent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projectauditevent`;

CREATE TABLE `projectauditevent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `eventname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `_user_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `role_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_eman` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table savedcalendar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `savedcalendar`;

CREATE TABLE `savedcalendar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `location` text COLLATE utf8_unicode_ci,
  `moduleclassname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startattributename` text COLLATE utf8_unicode_ci,
  `endattributename` text COLLATE utf8_unicode_ci,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table savedcalendar_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `savedcalendar_read`;

CREATE TABLE `savedcalendar_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `savedcalendar_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table savedcalendarsubscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `savedcalendarsubscription`;

CREATE TABLE `savedcalendarsubscription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  `savedcalendar_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table savedreport
# ------------------------------------------------------------

DROP TABLE IF EXISTS `savedreport`;

CREATE TABLE `savedreport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `moduleclassname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table savedreport_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `savedreport_read`;

CREATE TABLE `savedreport_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `savedreport_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table savedreportstarred
# ------------------------------------------------------------

DROP TABLE IF EXISTS `savedreportstarred`;

CREATE TABLE `savedreportstarred` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `basestarredmodel_id` int(11) unsigned DEFAULT NULL,
  `savedreport_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basestarredmodel_id_savedreport_id` (`basestarredmodel_id`,`savedreport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table savedsearch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `savedsearch`;

CREATE TABLE `savedsearch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `viewclassname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table savedworkflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `savedworkflow`;

CREATE TABLE `savedworkflow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  `moduleclassname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `triggeron` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `savedworkflow` WRITE;
/*!40000 ALTER TABLE `savedworkflow` DISABLE KEYS */;

INSERT INTO `savedworkflow` (`id`, `description`, `isactive`, `moduleclassname`, `name`, `order`, `serializeddata`, `type`, `triggeron`, `item_id`)
VALUES
	(1,'This will create a task for the Contact owner to follow up with a contact if there has been no activity for 1 month',0,'ContactsModule','Contact follow up Task',1,'a:5:{s:17:\"triggersStructure\";s:1:\"1\";s:8:\"Triggers\";a:0:{}s:7:\"Actions\";a:1:{i:0;a:5:{s:4:\"type\";s:6:\"Create\";s:8:\"relation\";s:5:\"tasks\";s:14:\"relationFilter\";s:17:\"RelationFilterAll\";s:20:\"relatedModelRelation\";N;s:16:\"ActionAttributes\";a:4:{s:4:\"name\";a:3:{s:4:\"type\";s:6:\"Static\";s:5:\"value\";s:22:\"Follow up with contact\";s:14:\"shouldSetValue\";s:1:\"1\";}s:11:\"owner__User\";a:3:{s:4:\"type\";s:21:\"OwnerOfTriggeredModel\";s:5:\"value\";N;s:14:\"shouldSetValue\";s:1:\"1\";}s:6:\"status\";a:3:{s:4:\"type\";s:6:\"Static\";s:5:\"value\";i:1;s:14:\"shouldSetValue\";s:1:\"1\";}s:11:\"permissions\";a:3:{s:4:\"type\";s:20:\"SameAsTriggeredModel\";s:5:\"value\";N;s:14:\"shouldSetValue\";s:1:\"1\";}}}}s:13:\"EmailMessages\";a:0:{}s:11:\"TimeTrigger\";a:12:{s:16:\"durationInterval\";i:1;s:12:\"durationSign\";s:8:\"Positive\";s:12:\"durationType\";s:5:\"Month\";s:18:\"currencyIdForValue\";N;s:5:\"value\";N;s:11:\"secondValue\";N;s:26:\"thirdValueDurationInterval\";N;s:22:\"thirdValueDurationType\";N;s:9:\"valueType\";s:11:\"Is Time For\";s:14:\"relationFilter\";s:17:\"RelationFilterAny\";s:27:\"attributeIndexOrDerivedType\";s:22:\"latestActivityDateTime\";s:8:\"operator\";N;}}','ByTime','NewAndExisting',14),
	(2,'This will send an email to recipients that you choose when you close a deal!',0,'OpportunitiesModule','Closed won Opportunity alert',2,'a:4:{s:17:\"triggersStructure\";s:1:\"1\";s:8:\"Triggers\";a:1:{i:0;a:10:{s:18:\"currencyIdForValue\";N;s:5:\"value\";s:10:\"Closed Won\";s:11:\"secondValue\";N;s:26:\"thirdValueDurationInterval\";N;s:22:\"thirdValueDurationType\";N;s:24:\"stringifiedModelForValue\";N;s:9:\"valueType\";N;s:14:\"relationFilter\";s:17:\"RelationFilterAny\";s:27:\"attributeIndexOrDerivedType\";s:5:\"stage\";s:8:\"operator\";s:7:\"becomes\";}}s:7:\"Actions\";a:0:{}s:13:\"EmailMessages\";a:1:{i:0;a:8:{s:15:\"emailTemplateId\";i:7;s:25:\"sendAfterDurationInterval\";i:0;s:21:\"sendAfterDurationType\";s:6:\"Minute\";s:12:\"sendFromType\";s:7:\"Default\";s:12:\"sendFromName\";N;s:15:\"sendFromAddress\";N;s:24:\"excludeIfTriggeredByUser\";b:0;s:22:\"EmailMessageRecipients\";a:1:{i:0;a:4:{s:6:\"toName\";s:14:\"The Sales Team\";s:9:\"toAddress\";s:23:\"SalesTeam@mycompany.com\";s:4:\"type\";s:13:\"StaticAddress\";s:12:\"audienceType\";i:1;}}}}}','OnSave','NewAndExisting',16);

/*!40000 ALTER TABLE `savedworkflow` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table securableitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `securableitem`;

CREATE TABLE `securableitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `securableitem` WRITE;
/*!40000 ALTER TABLE `securableitem` DISABLE KEYS */;

INSERT INTO `securableitem` (`id`, `item_id`)
VALUES
	(1,7),
	(2,9),
	(3,10),
	(4,11),
	(5,12),
	(6,13),
	(7,15),
	(8,23);

/*!40000 ALTER TABLE `securableitem` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sellpriceformula
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sellpriceformula`;

CREATE TABLE `sellpriceformula` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `discountormarkuppercentage` double DEFAULT NULL,
  `producttemplate_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sendgridemailaccount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sendgridemailaccount`;

CREATE TABLE `sendgridemailaccount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `apiusername` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apipassword` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `replytoaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table shorturl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shorturl`;

CREATE TABLE `shorturl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `createddatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table socialitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `socialitem`;

CREATE TABLE `socialitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `latestdatetime` datetime DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `note_id` int(11) unsigned DEFAULT NULL,
  `touser__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table socialitem_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `socialitem_read`;

CREATE TABLE `socialitem_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `socialitem_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table stuckjob
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stuckjob`;

CREATE TABLE `stuckjob` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `completeddatetime` datetime DEFAULT NULL,
  `completed` tinyint(1) unsigned DEFAULT NULL,
  `duedatetime` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `requestedbyuser__user_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table task_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_read`;

CREATE TABLE `task_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `securableitem_id_munge_id` (`securableitem_id`,`munge_id`),
  KEY `task_read_securableitem_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table task_read_subscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_read_subscription`;

CREATE TABLE `task_read_subscription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `subscriptiontype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_modelid` (`userid`,`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table taskchecklistitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taskchecklistitem`;

CREATE TABLE `taskchecklistitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) DEFAULT NULL,
  `completed` tinyint(1) unsigned DEFAULT NULL,
  `task_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table workflowmessageinqueue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflowmessageinqueue`;

CREATE TABLE `workflowmessageinqueue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `modelclassname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processdatetime` datetime DEFAULT NULL,
  `serializeddata` text COLLATE utf8_unicode_ci,
  `item_id` int(11) unsigned DEFAULT NULL,
  `modelitem_item_id` int(11) unsigned DEFAULT NULL,
  `savedworkflow_id` int(11) unsigned DEFAULT NULL,
  `triggeredbyuser__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
