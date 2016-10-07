-- MySQL dump 10.13  Distrib 5.6.17, for osx10.7 (x86_64)
--
-- Host: localhost    Database: zurmo
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'zurmo'
--
/*!50003 DROP FUNCTION IF EXISTS `any_user_in_a_sub_role_has_read_permission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `any_user_in_a_sub_role_has_read_permission`(
                                securableitem_id int(11),
                                role_id          int(11),
                                class_name       varchar(255),
                                module_name      varchar(255)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare has_read tinyint default 0;

                call any_user_in_a_sub_role_has_read_permission(securableitem_id, role_id, class_name, module_name, has_read);
                return has_read;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_email_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `create_email_message`(text_content text, html_content text, from_name varchar(128),
                                                    from_address varchar(255), user_id int, owner_id int,
                                                    subject varchar(255), headers text, folder_id int,
                                                    serialized_data text, to_address varchar(255), to_name varchar(128),
                                                    recipient_type int, contact_item_id int,
                                                    related_model_type varchar(255), related_model_id int,
                                                     now_timestamp datetime) RETURNS int(11)
    MODIFIES SQL DATA
begin
                insert into `emailmessagecontent` ( `textcontent`, `htmlcontent` )
                            values ( text_content, html_content );
                set @contentId = last_insert_id();
                insert into `emailmessagesender` ( `fromname`, `fromaddress` )
                            values ( from_name, from_address );
                set @senderId = last_insert_id();
                set @emailMessageItemId = create_item(1, now_timestamp);
                insert into `securableitem` ( `item_id` )
                            values ( @emailMessageItemId );
                insert into `ownedsecurableitem` ( `securableitem_id`, `owner__user_id` )
                            values ( last_insert_id(), owner_id );
                insert into `emailmessage` ( `subject`, `headers`, `ownedsecurableitem_id`,
                                                `content_emailmessagecontent_id`, `sender_emailmessagesender_id`,
                                                 `folder_emailfolder_id` )
                             values ( subject, headers, last_insert_id(), @contentId, @senderId, folder_id);
                set @emailMessageId = LAST_INSERT_ID();
                insert into `auditevent` ( `datetime`, `modulename`, `eventname`, `_user_id`,
                                            `modelclassname`, `modelid`, `serializeddata` )
                            values ( now_timestamp, "ZurmoModule", "Item Created", user_id,
                                    "EmailMessage", @emailMessageId, serialized_data );
                insert into `emailmessagerecipient` ( `toaddress`, `toname`, `type`, `emailmessage_id` )
                            values ( to_address, to_name, recipient_type, @emailMessageId );
                set @recipientId = last_insert_id();
                insert into `emailmessagerecipient_item` ( `emailmessagerecipient_id`, `item_id` )
                            values ( @recipientId, contact_item_id );
                call duplicate_filemodels(related_model_type, related_model_id, "emailmessage", @emailMessageId, user_id, now_timestamp);
                return @emailMessageId;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `create_item`(user_id int, now_timestamp datetime) RETURNS int(11)
begin
              insert into `item` ( `id`, `createddatetime`, `modifieddatetime`,
                    `createdbyuser__user_id`, `modifiedbyuser__user_id` )
                    VALUES ( NULL,  now_timestamp , now_timestamp, user_id, user_id  );
               return last_insert_id();
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_group_actual_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_group_actual_right`(
                                _group_id   int(11),
                                module_name varchar(255),
                                right_name  varchar(255)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint;

                select get_group_explicit_actual_right (_group_id, module_name, right_name) |
                       get_group_inherited_actual_right(_group_id, module_name, right_name)
                into result;
                if (result & 2) = 2 then
                    return 2;
                end if;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_group_explicit_actual_policy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_group_explicit_actual_policy`(
                                _group_id   int(11),
                                module_name varchar(255),
                                policy_name varchar(255)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint;
                declare _permitable_id int;

                select permitable_id
                into   _permitable_id
                from   _group
                where  id = _group_id;
                select get_permitable_explicit_actual_policy(_permitable_id, module_name, policy_name)
                into result;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_group_explicit_actual_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_group_explicit_actual_right`(
                                _group_id   int(11),
                                module_name varchar(255),
                                right_name  varchar(255)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint;
                declare _permitable_id int;

                select permitable_id
                into   _permitable_id
                from   _group
                where  id = _group_id;
                select get_permitable_explicit_actual_right(_permitable_id, module_name, right_name)
                into result;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_group_inherited_actual_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_group_inherited_actual_right`(
                                _group_id   int(11),
                                module_name varchar(255),
                                right_name  varchar(255)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare combined_right tinyint;

                call get_group_inherited_actual_right_ignoring_everyone(_group_id, module_name, right_name, combined_right);
                select combined_right |
                       get_named_group_explicit_actual_right('Everyone', module_name, right_name)
                into combined_right;
                if (combined_right & 2) = 2 then
                    return 2;
                end if;
                return combined_right;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_named_group_explicit_actual_policy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_named_group_explicit_actual_policy`(
                                group_name  varchar(255),
                                module_name varchar(255),
                                policy_name varchar(255)
                             ) RETURNS varchar(255) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
begin                # but since PDO returns it as a string I am too, until I know if that is a bad thing.
                declare result tinyint;
                declare _permitable_id int;

                select permitable_id
                into   _permitable_id
                from   _group
                where  name = group_name;
                select get_permitable_explicit_actual_policy(_permitable_id, module_name, policy_name)
                into result;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_named_group_explicit_actual_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_named_group_explicit_actual_right`(
                                group_name  varchar(255),
                                module_name varchar(255),
                                right_name  varchar(255)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint;
                declare _permitable_id int;

                select permitable_id
                into   _permitable_id
                from   _group
                where  name = group_name;
                select get_permitable_explicit_actual_right(_permitable_id, module_name, right_name)
                into result;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_permitable_explicit_actual_policy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_permitable_explicit_actual_policy`(
                                permitable_id int(11),
                                module_name   varchar(255),
                                policy_name   varchar(255)
                             ) RETURNS varchar(255) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
begin                # but since PDO returns it as a string I am too, until I know if that is a bad thing.
                declare result tinyint;

                select value
                into   result
                from   policy
                where  policy.modulename    = module_name and
                       name                 = policy_name and
                       policy.permitable_id = permitable_id
                limit  1;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_permitable_explicit_actual_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_permitable_explicit_actual_right`(
                                permitable_id int(11),
                                module_name   varchar(255),
                                right_name    varchar(255)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint;

                select max(type)
                into   result
                from   _right
                where  _right.modulename    = module_name and
                       name                 = right_name and
                       _right.permitable_id = permitable_id;
                if result is null then
                    return 0;
                end if;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_permitable_group_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_permitable_group_id`(
                                _permitable_id int(11)
                            ) RETURNS int(11)
begin
                declare result int(11);

                select id
                into   result
                from   _group
                where  _group.permitable_id = _permitable_id;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_permitable_user_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_permitable_user_id`(
                                _permitable_id int(11)
                            ) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result int(11);

                select id
                into   result
                from   _user
                where  _user.permitable_id = _permitable_id;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_securableitem_actual_permissions_for_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_securableitem_actual_permissions_for_permitable`(
                                _securableitem_id int(11),
                                _permitable_id    int(11),
                                class_name        varchar(255),
                                module_name       varchar(255),
                                caching_on        tinyint
                             ) RETURNS smallint(6)
    READS SQL DATA
    DETERMINISTIC
begin
                declare allow_permissions, deny_permissions smallint default 0;
                declare is_super_administrator, is_owner tinyint;

                delete from __role_children_cache;

                select named_group_contains_permitable('Super Administrators', _permitable_id)
                into is_super_administrator;
                if is_super_administrator then
                    set allow_permissions = 31;
                    set deny_permissions  = 0;
                else                                                            # Not Coding Standard
                    begin
                        select _securableitem_id in
                            (select securableitem_id
                             from   _user, ownedsecurableitem
                             where  _user.id = ownedsecurableitem.owner__user_id and
                                    permitable_id = _permitable_id)
                        into is_owner;
                    end;
                    if is_owner then
                        set allow_permissions = 31;
                        set deny_permissions  = 0;
                    else                                                        # Not Coding Standard
                        if caching_on then
                            call get_securableitem_cached_actual_permissions_for_permitable(_securableitem_id, _permitable_id, allow_permissions, deny_permissions);
                            if allow_permissions is null then
                                call recursive_get_securableitem_actual_permissions_for_permitable(_securableitem_id, _permitable_id, class_name, module_name, allow_permissions, deny_permissions);
                                call cache_securableitem_actual_permissions_for_permitable(_securableitem_id, _permitable_id, allow_permissions, deny_permissions);
                            end if;
                        else                                                    # Not Coding Standard
                            call recursive_get_securableitem_actual_permissions_for_permitable(_securableitem_id, _permitable_id, class_name, module_name, allow_permissions, deny_permissions);
                        end if;
                    end if;
                end if;
                return (allow_permissions << 8) | deny_permissions;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_user_actual_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_user_actual_right`(
                                _user_id    int(11),
                                module_name varchar(255),
                                right_name  varchar(255)
                            ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint;
                declare is_super_administrator tinyint;

                select named_group_contains_user('Super Administrators', _user_id)
                into   is_super_administrator;
                if is_super_administrator then
                    set result = 1;
                else                                                            # Not Coding Standard
                    call recursive_get_user_actual_right(_user_id, module_name, right_name, result);
                end if;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_user_explicit_actual_policy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_user_explicit_actual_policy`(
                                _user_id    int(11),
                                module_name varchar(255),
                                policy_name varchar(255)
                             ) RETURNS varchar(255) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
begin                # but since PDO returns it as a string I am too, until I know if that is a bad thing.
                declare result tinyint;
                declare _permitable_id int;

                select permitable_id
                into   _permitable_id
                from   _user
                where  id = _user_id;
                select get_permitable_explicit_actual_policy(_permitable_id, module_name, policy_name)
                into result;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_user_explicit_actual_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_user_explicit_actual_right`(
                                _user_id    int(11),
                                module_name varchar(255),
                                right_name  varchar(255)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint;
                declare _permitable_id int;

                select permitable_id
                into   _permitable_id
                from   _user
                where  id = _user_id;
                select get_permitable_explicit_actual_right(_permitable_id, module_name, right_name)
                into result;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_user_inherited_actual_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `get_user_inherited_actual_right`(
                                _user_id    int(11),
                                module_name varchar(255),
                                right_name  varchar(255)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare combined_right tinyint default 0;
                declare __group_id int(11);
                declare no_more_records tinyint default 0;
                declare _group_ids cursor for
                    select _group_id
                    from   _group__user
                    where  _group__user._user_id = _user_id;
                declare continue handler for not found
                    set no_more_records = 1;

                open _group_ids;
                fetch _group_ids into __group_id;
                while no_more_records = 0 do
                    select combined_right |
                           get_group_explicit_actual_right (__group_id, module_name, right_name) |
                           get_group_inherited_actual_right(__group_id, module_name, right_name)
                    into combined_right;
                    fetch _group_ids into __group_id;
                end while;
                close _group_ids;

                select combined_right |
                       get_named_group_explicit_actual_right('Everyone', module_name, right_name)
                into combined_right;

                if (combined_right & 2) = 2 then
                    return 2;
                end if;
                return combined_right;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `group_contains_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `group_contains_permitable`(
                                _group_id      int(11),
                                _permitable_id int(11)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint default 0;
                declare _group_name varchar(255);
                declare is_everyone tinyint;
                declare _user_id int(11);
                declare group_id_2 int(11);

                select name
                into   _group_name
                from   _group
                where  _group.id = _group_id;
                if _group_name = 'Everyone' then
                    set result = 1;
                else                                                            # Not Coding Standard
                    set _user_id = get_permitable_user_id(_permitable_id);
                    if _user_id is not null then
                        call recursive_group_contains_user(_group_id, _user_id, result);
                    else                                                        # Not Coding Standard
                        set group_id_2 = get_permitable_group_id(_permitable_id);
                        if group_id_2 is not null then
                            call recursive_group_contains_group(_group_id, group_id_2, result);
                        end if;
                    end if;
                end if;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `group_contains_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `group_contains_user`(
                                _group_id int(11),
                                _user_id  int(11)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint default 0;

                call recursive_group_contains_user(_group_id, _user_id, result);
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `named_group_contains_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `named_group_contains_permitable`(
                                group_name     varchar(255),
                                _permitable_id int(11)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint default 0;
                declare group_id_1 int(11);
                declare _user_id   int(11);
                declare group_id_2 int(11);

                if group_name = 'Everyone' then
                    set result = 1;
                else                                                            # Not Coding Standard
                    select id
                    into   group_id_1
                    from   _group
                    where  _group.name = group_name;
                    set _user_id = get_permitable_user_id(_permitable_id);
                    if _user_id is not null then
                        call recursive_group_contains_user(group_id_1, _user_id, result);
                    else                                                        # Not Coding Standard
                        set group_id_2 = get_permitable_group_id(_permitable_id);
                        if group_id_2 is not null then
                            call recursive_group_contains_group(group_id_1, group_id_2, result);
                        end if;
                    end if;
                end if;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `named_group_contains_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `named_group_contains_user`(
                                _group_name varchar(255),
                                _user_id    int(11)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint default 0;
                declare _group_id int(11);

                if _group_name = 'Everyone' then
                    set result = 1;
                else                                                            # Not Coding Standard
                    select id
                    into   _group_id
                    from   _group
                    where  _group.name = _group_name;
                    call recursive_group_contains_user(_group_id, _user_id, result);
                end if;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `permitable_contains_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` FUNCTION `permitable_contains_permitable`(
                                permitable_id_1 int(11),
                                permitable_id_2 int(11)
                             ) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
begin
                declare result tinyint;
                declare user_id_1, user_id_2, group_id_1, group_id_2 int(11);

                # If they are both users just compare if they are the same user.
                select get_permitable_user_id(permitable_id_1)
                into   user_id_1;
                select get_permitable_user_id(permitable_id_2)
                into   user_id_2;
                if user_id_1 is not null and user_id_2 is not null then
                    set result = permitable_id_1 = permitable_id_2;
                else                                                            # Not Coding Standard
                    # If the first is a user and the second is a group return false.
                    select get_permitable_group_id(permitable_id_2)
                    into   group_id_2;
                    if user_id_1 is not null and group_id_2 is not null then
                        set result = 0;
                    else                                                        # Not Coding Standard
                        # Otherwise the first is a group, just return if it contains
                        # the second.
                        select get_permitable_group_id(permitable_id_1)
                        into   group_id_1;
                        if group_id_1 is not null then
                            select group_contains_permitable(group_id_1, permitable_id_2)
                            into result;
                        end if;
                    end if;
                end if;
                return result;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cache_securableitem_actual_permissions_for_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `cache_securableitem_actual_permissions_for_permitable`(
                                in _securableitem_id  int(11),
                                in _permitable_id     int(11),
                                in _allow_permissions tinyint,
                                in _deny_permissions  tinyint
                              )
begin
                # Tables cannot be created inside stored routines
                # so this cannot automatically create the cache
                # table if it doesn't exist. So it is done when
                # the stored routines are created.
                insert into actual_permissions_cache
                values (_securableitem_id, _permitable_id, _allow_permissions, _deny_permissions);
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clear_cache_actual_rights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `clear_cache_actual_rights`()
    READS SQL DATA
begin
                delete from actual_rights_cache;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clear_cache_all_actual_permissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `clear_cache_all_actual_permissions`()
    READS SQL DATA
begin
                delete from actual_permissions_cache;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clear_cache_named_securable_all_actual_permissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `clear_cache_named_securable_all_actual_permissions`()
    READS SQL DATA
begin
                delete from named_securable_actual_permissions_cache;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clear_cache_securableitem_actual_permissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `clear_cache_securableitem_actual_permissions`(
                                in _securableitem_id int(11)
                              )
begin
                delete from actual_permissions_cache
                where securableitem_id = _securableitem_id;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_campaign_items` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `create_campaign_items`(campaign_id int, marketing_list_id int, processed int)
begin
                insert into `campaignitem` (`id`, `processed`, `campaign_id`, `contact_id`)
                    select null as id, processed as `processed`, campaign_id as `campaign_id`, `marketinglistmember`.`contact_id`
                        from `marketinglistmember`
                            left join `campaignitem` on `campaignitem`.`contact_id` = `marketinglistmember`.`contact_id`
                                and `campaignitem`.`campaign_id` = campaign_id
                            left join `contact` on `contact`.`id` = `marketinglistmember`.`contact_id`
                        where (`marketinglistmember`.`marketinglist_id` = marketing_list_id
                                and `campaignitem`.`id` is null and `contact`.`id` is not null);
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `decrement_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `decrement_count`(
                                in munge_table_name  varchar(255),
                                in _securableitem_id int(11),
                                in item_id           int(11),
                                in _type             char
                             )
begin

                update munge_table_name
                set count = count - 1
                where securableitem_id = _securableitem_id and
                      munge_id         = concat(_type, item_id);
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `decrement_parent_roles_counts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `decrement_parent_roles_counts`(
                                in munge_table_name varchar(255),
                                in securableitem_id int(11),
                                in role_id          int(11)
                              )
begin
                declare parent_role_id int(11);

                select role_id
                into   parent_role_id
                from   role
                where  id = role_id;
                if parent_role_id is not null then
                    call decrement_count              (munge_table_name, securableitem_id, parent_role_id);
                    call decrement_parent_roles_counts(munge_table_name, securableitem_id, parent_role_id);
                end if;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `duplicate_filemodels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `duplicate_filemodels`(related_model_type varchar(255), related_model_id int,
                                                new_model_type varchar(255), new_model_id int, user_id int,
                                                 now_timestamp datetime)
begin
                insert into `filemodel` (`id`, `name`, `size`, `type`, `item_id`,
                                                    `filecontent_id`, `relatedmodel_id`, `relatedmodel_type`)
                    select null as `id`, `name`, `size`, `type`, (select create_item(user_id, now_timestamp)) as `item_id`, `filecontent_id`,
                        new_model_id as `relatedmodel_id`, new_model_type as `relatedmodel_type`
                    from `filemodel`
                    where `relatedmodel_type` = related_model_type and `relatedmodel_id` = related_model_id;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_campaign_items` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `generate_campaign_items`(active_status int, processing_status int, now_timestamp datetime)
begin
                  declare loop0_eof boolean default false;
                  declare campaign_id int(11);
                  declare marketinglist_id int(11);

                  declare cursor0 cursor for select `campaign`.`id`, `campaign`.`marketinglist_id` from `campaign`
                        where ((`campaign`.`status` = active_status) and (`campaign`.`sendondatetime` < now_timestamp));
                  declare continue handler for not found set loop0_eof = TRUE;
                  open cursor0;
                        loop0: loop
                              fetch cursor0 into campaign_id, marketinglist_id;
                              if loop0_eof then
                                    leave loop0;
                              end if;
                              call create_campaign_items(campaign_id, marketinglist_id, 0);
                              update `campaign` set `status` = processing_status where id = campaign_id;
                        end loop loop0;
                  close cursor0;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_group_inherited_actual_right_ignoring_everyone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `get_group_inherited_actual_right_ignoring_everyone`(
                                in  _group_id   int(11),
                                in  module_name varchar(255),
                                in  right_name  varchar(255),
                                out result      tinyint
                              )
begin
                declare parent_group_id int(11);

                set result = 0;
                select _group._group_id
                into   parent_group_id
                from   _group
                where  id = _group_id;
                if parent_group_id is not null then
                    call get_group_inherited_actual_right_ignoring_everyone(parent_group_id, module_name, right_name, result);
                    select result |
                           get_group_explicit_actual_right(parent_group_id, module_name, right_name)
                    into result;
                    if (result & 2) = 2 then
                        set result = 2;
                    end if;
                end if;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_securableitem_cached_actual_permissions_for_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `get_securableitem_cached_actual_permissions_for_permitable`(
                                in  _securableitem_id  int(11),
                                in  _permitable_id     int(11),
                                out _allow_permissions tinyint,
                                out _deny_permissions  tinyint
                             )
begin
                select allow_permissions, deny_permissions
                into   _allow_permissions, _deny_permissions
                from   actual_permissions_cache
                where  securableitem_id = _securableitem_id and
                       permitable_id    = _permitable_id;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_securableitem_explicit_actual_permissions_for_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `get_securableitem_explicit_actual_permissions_for_permitable`(
                                in  _securableitem_id int(11),
                                in  _permitable_id    int(11),
                                out allow_permissions tinyint,
                                out deny_permissions  tinyint
                              )
begin
                select bit_or(permissions)
                into   allow_permissions
                from   permission
                where  type = 1                          and
                       permitable_id    = _permitable_id and
                       securableitem_id = _securableitem_id;

                select bit_or(permissions)
                into   deny_permissions
                from   permission
                where  type = 2                       and
                       permitable_id = _permitable_id and
                securableitem_id = _securableitem_id;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_securableitem_explicit_inherited_permissions_for_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `get_securableitem_explicit_inherited_permissions_for_permitable`(
                                in  _securableitem_id int(11),
                                in  _permitable_id    int(11),
                                out allow_permissions tinyint,
                                out deny_permissions  tinyint
                              )
begin
                declare permissions_permitable_id int(11);
                declare _type, _permissions, permission_applies tinyint;
                declare no_more_records tinyint default 0;
                declare permitable_id_type_and_permissions cursor for
                    select permitable_id, type, bit_or(permissions)
                    from   permission
                    where  securableitem_id = _securableitem_id
                    group  by permitable_id, type;
                declare continue handler for not found
                    set no_more_records = 1;

                set allow_permissions = 0;
                set deny_permissions  = 0;
                open permitable_id_type_and_permissions;
                fetch permitable_id_type_and_permissions into
                            permissions_permitable_id, _type, _permissions;
                # The query will return at most one row with the allow bits and
                # one with the deny bits, so this loop will loop 0, 1, or 2 times.
                while no_more_records = 0 do
                    select permitable_contains_permitable(permissions_permitable_id, _permitable_id)
                    into   permission_applies;
                    if permission_applies then
                        if _type = 1 then
                            set allow_permissions = allow_permissions | _permissions;
                        else                                                    # Not Coding Standard
                            set deny_permissions  = deny_permissions  | _permissions;
                        end if;
                    end if;
                    fetch permitable_id_type_and_permissions into
                                permissions_permitable_id, _type, _permissions;
                end while;
                close permitable_id_type_and_permissions;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_securableitem_module_and_model_permissions_for_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `get_securableitem_module_and_model_permissions_for_permitable`(
                                in  _securableitem_id int(11),
                                in  _permitable_id    int(11),
                                in  class_name        varchar(255),
                                in  module_name       varchar(255),
                                out allow_permissions tinyint,
                                out deny_permissions  tinyint
                               )
begin
                declare permissions_permitable_id int(11);
                declare _type, _permissions, permission_applies tinyint;
                declare no_more_records                         tinyint default 0;
                declare permitable_id_type_and_permissions_for_namedsecurableitem cursor for
                    select permitable_id, type, bit_or(permissions)
                    from   permission, namedsecurableitem
                    where  permission.securableitem_id = namedsecurableitem.securableitem_id and
                           (name = class_name or name = module_name)
                           group by permitable_id, type;
                declare continue handler for not found
                    set no_more_records = 1;

                set allow_permissions = 0;
                set deny_permissions  = 0;
                open permitable_id_type_and_permissions_for_namedsecurableitem;
                fetch permitable_id_type_and_permissions_for_namedsecurableitem into
                            permissions_permitable_id, _type, _permissions;
                # The query will return at most one row with the allow bits and
                # one with the deny bits, so this loop will loop 0, 1, or 2 times.
                while no_more_records = 0 do
                    select permitable_contains_permitable(permissions_permitable_id, _permitable_id)
                    into   permission_applies;
                    if permission_applies then
                        if _type = 1 then
                            set allow_permissions = allow_permissions | _permissions;
                        else                                                    # Not Coding Standard
                            set deny_permissions  = deny_permissions  | _permissions;
                        end if;
                    end if;
                    fetch permitable_id_type_and_permissions_for_namedsecurableitem into
                                permissions_permitable_id, _type, _permissions;
                end while;
                close permitable_id_type_and_permissions_for_namedsecurableitem;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_securableitem_propagated_allow_permissions_for_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `get_securableitem_propagated_allow_permissions_for_permitable`(
                                in  _securableitem_id int(11),
                                in  _permitable_id    int(11),
                                in  class_name        varchar(255),
                                in  module_name       varchar(255),
                                out allow_permissions tinyint
                              )
begin
                declare user_id int(11);
                declare user_role_id int(11);
                declare parent_role_id int(11);

                select role_id into user_role_id from _user where permitable_id = _permitable_id;
                set allow_permissions = 0;
                select get_permitable_user_id(_permitable_id)
                into   user_id;
                if user_id is not null then
                    call recursive_get_all_descendent_roles(_permitable_id, user_role_id);
                    call recursive_get_securableitem_propagated_allow_permissions_permit(_securableitem_id, _permitable_id, class_name, module_name, allow_permissions);
                end if;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `increment_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `increment_count`(
                                in munge_table_name varchar(255),
                                in securableitem_id int(11),
                                in item_id          int(11),
                                in _type            char
                              )
begin
                # TODO: insert only if the row doesn't exist
                # in a way that doesn't ignore all errors.

                set @sql = concat("insert into ", munge_table_name,
                                  "(securableitem_id, munge_id, count) ",
                                  "values (", securableitem_id, ", '", concat(_type, item_id), "', 1) ",
                                  "on duplicate key ",
                                  "update count = count + 1");
                prepare statement from @sql;
                execute statement;
                deallocate prepare statement;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `increment_parent_roles_counts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `increment_parent_roles_counts`(
                                in munge_table_name varchar(255),
                                in securableitem_id int(11),
                                in _role_id         int(11)
                              )
begin
                declare parent_role_id int(11);

                select role_id
                into   parent_role_id
                from   role
                where  id = _role_id;
                if parent_role_id is not null then
                    call increment_count              (munge_table_name, securableitem_id, parent_role_id, "R");
                    call increment_parent_roles_counts(munge_table_name, securableitem_id, parent_role_id);
                end if;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild`(
                                in model_table_name varchar(255),
                                in munge_table_name varchar(255)
                              )
begin
                call recreate_tables(munge_table_name);
                call rebuild_users  (model_table_name, munge_table_name);
                call rebuild_groups (model_table_name, munge_table_name);
                call rebuild_roles  (model_table_name, munge_table_name);
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild_a_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild_a_permitable`(
                                in munge_table_name varchar(255),
                                in securableitem_id int(11),
                                in actual_id        int(11),
                                in _permitable_id   int(11),
                                in _type            char
                              )
begin
                declare allow_permissions, deny_permissions, effective_explicit_permissions smallint default 0;

                call get_securableitem_explicit_actual_permissions_for_permitable(securableitem_id, _permitable_id, allow_permissions, deny_permissions);
                set effective_explicit_permissions = allow_permissions & ~deny_permissions;
                if (effective_explicit_permissions & 1) = 1 then # Permission::READ
                    call increment_count(munge_table_name, securableitem_id, actual_id, _type);
                    if _type = "G" then
                        call rebuild_roles_for_users_in_group(munge_table_name, securableitem_id, actual_id);
                        call rebuild_sub_groups              (munge_table_name, securableitem_id, actual_id);
                    end if;
                end if;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild_groups`(
                                in model_table_name varchar(255),
                                in munge_table_name varchar(255)
                              )
begin
                set @select_statement  = concat("select permission.securableitem_id, _group.id, permission.permitable_id
                                         from ", model_table_name , ", ownedsecurableitem, permission, _group
                                         where
                                         ", model_table_name, ".ownedsecurableitem_id = ownedsecurableitem.id AND
                                         ownedsecurableitem.securableitem_id = permission.securableitem_id AND
                                         permission.permitable_id = _group.permitable_id");
                set @rebuild_groups_temp_table = CONCAT("create temporary table rebuild_temp_table as ", @select_statement);
                prepare statement FROM @rebuild_groups_temp_table;
                execute statement;
                deallocate prepare statement;
                begin
                    declare _securableitem_id, __group_id, _permitable_id int(11);
                    declare no_more_records tinyint default 0;
                    declare securableitem_group_and_permitable_ids cursor for
                        select * from rebuild_temp_table;
                    declare continue handler for not found
                        set no_more_records = 1;
                    open securableitem_group_and_permitable_ids;
                    fetch securableitem_group_and_permitable_ids into _securableitem_id, __group_id, _permitable_id;
                    while no_more_records = 0 do
                        call rebuild_a_permitable(munge_table_name, _securableitem_id, __group_id, _permitable_id, "G");
                        fetch securableitem_group_and_permitable_ids into _securableitem_id, __group_id, _permitable_id;
                    end while;
                    close securableitem_group_and_permitable_ids;
                    drop temporary table if exists rebuild_temp_table;
                end;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild_roles`(
                                in model_table_name varchar(255),
                                in munge_table_name varchar(255)
                              )
begin
                call rebuild_roles_owned_securableitems                         (model_table_name, munge_table_name);
                call rebuild_roles_securableitem_with_explicit_user_permissions (model_table_name, munge_table_name);
                call rebuild_roles_securableitem_with_explicit_group_permissions(model_table_name, munge_table_name);
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild_roles_for_users_in_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild_roles_for_users_in_group`(
                                in munge_table_name  varchar(255),
                                in _securableitem_id int(11),
                                in __group_id        int(11)
                              )
begin
                declare _role_id int(11);
                declare no_more_records tinyint default 0;
                declare role_ids cursor for
                    select role_id
                    from   _group__user, _user
                    where  _group__user._group_id = __group_id and
                           _user.id = _group__user._user_id;
                declare continue handler for not found
                    set no_more_records = 1;

                open role_ids;
                fetch role_ids into _role_id;
                while no_more_records = 0 do
                    call increment_parent_roles_counts(munge_table_name, _securableitem_id, _role_id);
                    fetch role_ids into _role_id;
                end while;
                close role_ids;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild_roles_owned_securableitems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild_roles_owned_securableitems`(
                                in model_table_name varchar(255),
                                in munge_table_name varchar(255)
                              )
begin
                set @select_statement  = concat("select role_id, ownedsecurableitem.securableitem_id
                                         from ", model_table_name, ", _user, ownedsecurableitem
                                         where ", model_table_name, ".ownedsecurableitem_id = ownedsecurableitem.id AND
                                         _user.id = ownedsecurableitem.owner__user_id and _user.role_id is not null");
                set @rebuild_roles_temp_table = CONCAT("create temporary table rebuild_temp_table as ", @select_statement);
                prepare statement FROM @rebuild_roles_temp_table;
                execute statement;
                deallocate prepare statement;
                   begin
                declare _role_id, _securableitem_id int(11);
                declare no_more_records tinyint default 0;
                declare role_and_securableitem_ids cursor for
                    select * from rebuild_temp_table;
                declare continue handler for not found
                    set no_more_records = 1;
                open role_and_securableitem_ids;
                fetch role_and_securableitem_ids into _role_id, _securableitem_id;
                while no_more_records = 0 do
                    call increment_parent_roles_counts(munge_table_name, _securableitem_id, _role_id);
                    fetch role_and_securableitem_ids into _role_id, _securableitem_id;
                end while;
                close role_and_securableitem_ids;
                drop temporary table if exists rebuild_temp_table;
                end;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild_roles_securableitem_with_explicit_group_permissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild_roles_securableitem_with_explicit_group_permissions`(
                                in model_table_name varchar(255),
                                in munge_table_name varchar(255)
                              )
begin
                set @select_statement  =  concat("select role.role_id, permission.securableitem_id
                                           from ", model_table_name, ", ownedsecurableitem, _user, _group, _group__user, permission, role
                                           where ", model_table_name, ".ownedsecurableitem_id = ownedsecurableitem.id and
                                           ownedsecurableitem.securableitem_id = permission.securableitem_id and
                                           _user.id = _group__user._user_id                and
                                           permission.permitable_id = _group.permitable_id and
                                           _group__user._group_id = _group.id              and
                                           _user.role_id = role.role_id                    and
                                           ((permission.permissions & 1) = 1)              and
                                           permission.type = 1");
                set @rebuild_roles_temp_table = CONCAT("create temporary table rebuild_temp_table as ", @select_statement);
                prepare statement FROM @rebuild_roles_temp_table;
                execute statement;
                deallocate prepare statement;
                begin
                    declare _role_id, _securableitem_id int(11);
                    declare no_more_records tinyint default 0;
                    declare role_and_securableitem_ids cursor for
                        select * from rebuild_temp_table;
                    declare continue handler for not found
                        set no_more_records = 1;
                    open role_and_securableitem_ids;
                    fetch role_and_securableitem_ids into _role_id, _securableitem_id;
                    while no_more_records = 0 do
                        call increment_count              (munge_table_name, _securableitem_id, _role_id, "R");
                        call increment_parent_roles_counts(munge_table_name, _securableitem_id, _role_id);
                        fetch role_and_securableitem_ids into _role_id, _securableitem_id;
                    end while;
                    close role_and_securableitem_ids;
                    drop temporary table if exists rebuild_temp_table;
                end;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild_roles_securableitem_with_explicit_user_permissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild_roles_securableitem_with_explicit_user_permissions`(
                                in model_table_name varchar(255),
                                in munge_table_name varchar(255)
                              )
begin
                set @select_statement  = concat("select role_id, permission.securableitem_id
                                         from ", model_table_name, ", ownedsecurableitem, permission, _user
                                         where ", model_table_name, ".ownedsecurableitem_id = ownedsecurableitem.id AND
                                         ownedsecurableitem.securableitem_id = permission.securableitem_id AND
                                         permission.permitable_id = _user.permitable_id and
                                         ((permission.permissions & 1) = 1) and permission.type = 1");
                set @rebuild_roles_temp_table = CONCAT("create temporary table rebuild_temp_table as ", @select_statement);
                prepare statement FROM @rebuild_roles_temp_table;
                execute statement;
                deallocate prepare statement;
                begin
                    declare _role_id, _securableitem_id int(11);
                    declare no_more_records tinyint default 0;
                    declare role_and_securableitem_ids cursor for
                        select * from rebuild_temp_table;
                    declare continue handler for not found
                        set no_more_records = 1;
                    open role_and_securableitem_ids;
                    fetch role_and_securableitem_ids into _role_id, _securableitem_id;
                    while no_more_records = 0 do
                        call increment_parent_roles_counts(munge_table_name, _securableitem_id, _role_id);
                        fetch role_and_securableitem_ids into _role_id, _securableitem_id;
                    end while;
                    close role_and_securableitem_ids;
                    drop temporary table if exists rebuild_temp_table;
                end;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild_sub_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild_sub_groups`(
                                in munge_table_name  varchar(255),
                                in _securableitem_id int(11),
                                in __group_id        int(11)
                              )
begin
                declare sub_group_id int(11);
                declare no_more_records tinyint default 0;
                declare sub_group_ids cursor for
                    select id
                    from   _group
                    where  _group_id = __group_id;
                declare continue handler for not found
                    set no_more_records = 1;

                open sub_group_ids;
                fetch sub_group_ids into sub_group_id;
                while no_more_records = 0 do
                    call increment_count                 (munge_table_name, _securableitem_id, sub_group_id, "G");
                    call rebuild_roles_for_users_in_group(munge_table_name, _securableitem_id, sub_group_id);
                    call rebuild_sub_groups              (munge_table_name, _securableitem_id, sub_group_id);
                    fetch sub_group_ids into sub_group_id;
                end while;
                close sub_group_ids;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rebuild_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `rebuild_users`(
                                in model_table_name varchar(255),
                                in munge_table_name varchar(255)
                              )
begin
                set @select_statement  = concat("select permission.securableitem_id, _user.id, permission.permitable_id
                                         from ", model_table_name, ", ownedsecurableitem, permission, _user
                                         where ", model_table_name , ".ownedsecurableitem_id = ownedsecurableitem.id and
                                         ownedsecurableitem.securableitem_id = permission.securableitem_id and
                                         permission.permitable_id = _user.permitable_id");
                set @rebuild_users_temp_table = CONCAT("create temporary table rebuild_temp_table as ", @select_statement);
                prepare statement FROM @rebuild_users_temp_table;
                execute statement;
                deallocate prepare statement;
                begin
                    declare _securableitem_id, __user_id, _permitable_id int(11);
                    declare no_more_records tinyint default 0;
                    declare securableitem_user_and_permitable_ids cursor for
                        select * from rebuild_temp_table;
                    declare continue handler for not found
                        set no_more_records = 1;
                    open securableitem_user_and_permitable_ids;
                    fetch securableitem_user_and_permitable_ids into _securableitem_id, __user_id, _permitable_id;
                    while no_more_records = 0 do
                        call rebuild_a_permitable(munge_table_name, _securableitem_id, __user_id, _permitable_id, "U");
                        fetch securableitem_user_and_permitable_ids into _securableitem_id, __user_id, _permitable_id;
                    end while;
                    close securableitem_user_and_permitable_ids;
                    drop temporary table if exists rebuild_temp_table;
                end;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recreate_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `recreate_tables`(
                                in munge_table_name varchar(255)
                              )
begin
                set @sql = concat("drop table if exists ", munge_table_name);
                prepare statement from @sql;
                execute statement;
                deallocate prepare statement;

                set @sql = concat("create table ", munge_table_name, " (",
                                        "securableitem_id      int(11)     unsigned not null, ",
                                        "munge_id              varchar(12)              null, ",
                                        "count                 int(8)      unsigned not null, ",
                                        "primary key (securableitem_id, munge_id))");
                prepare statement from @sql;
                execute statement;
                deallocate prepare statement;

                set @sql = concat("create index index_", munge_table_name, "_securableitem_id", " ",
                                        "on ", munge_table_name, " (securableitem_id)");
                prepare statement from @sql;
                execute statement;
                deallocate prepare statement;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recursive_get_all_descendent_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `recursive_get_all_descendent_roles`(in _permitable_id int(11), in parent_role_id int(11))
begin
                declare child_role_id int(11);
                declare no_more_records tinyint default 0;
                declare child_role_ids cursor for
                    select id
                    from   role
                    where  role_id = parent_role_id;
                declare continue handler for not found
                    set no_more_records = 1;

                open child_role_ids;
                fetch child_role_ids into child_role_id;
                while no_more_records = 0 do
                    INSERT IGNORE INTO __role_children_cache VALUES (_permitable_id, child_role_id);
                    call recursive_get_all_descendent_roles(_permitable_id, child_role_id);
                    fetch child_role_ids into child_role_id;
                end while;
                close child_role_ids;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recursive_get_securableitem_actual_permissions_for_permitable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `recursive_get_securableitem_actual_permissions_for_permitable`(
                                in  _securableitem_id int(11),
                                in  _permitable_id    int(11),
                                in  class_name        varchar(255),
                                in  module_name       varchar(255),
                                out allow_permissions tinyint,
                                out deny_permissions  tinyint
                              )
begin
                declare propagated_allow_permissions                            tinyint default 0;
                declare nameditem_allow_permissions, nameditem_deny_permissions tinyint default 0;
                declare is_owner tinyint;
                begin
                    select _securableitem_id in
                        (select securableitem_id
                         from   _user, ownedsecurableitem
                         where  _user.id = ownedsecurableitem.owner__user_id and
                                permitable_id = _permitable_id)
                    into is_owner;
                end;
                if is_owner then
                    set allow_permissions = 31;
                    set deny_permissions  = 0;
                else                                                            # Not Coding Standard
                    set allow_permissions = 0;
                    set deny_permissions  = 0;
                    call get_securableitem_explicit_inherited_permissions_for_permitable(_securableitem_id, _permitable_id, allow_permissions, deny_permissions);
                    call get_securableitem_propagated_allow_permissions_for_permitable  (_securableitem_id, _permitable_id, class_name, module_name, propagated_allow_permissions);
                    call get_securableitem_module_and_model_permissions_for_permitable  (_securableitem_id, _permitable_id, class_name, module_name, nameditem_allow_permissions, nameditem_deny_permissions);
                    set allow_permissions = allow_permissions | propagated_allow_permissions | nameditem_allow_permissions;
                    set deny_permissions  = deny_permissions                                 | nameditem_deny_permissions;
                end if;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recursive_get_securableitem_propagated_allow_permissions_permit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `recursive_get_securableitem_propagated_allow_permissions_permit`(
                                in  _securableitem_id int(11),
                                in  _permitable_id    int(11),
                                in  class_name        varchar(255),
                                in  module_name       varchar(255),
                                out allow_permissions tinyint
                              )
begin
                declare user_allow_permissions, user_deny_permissions, user_propagated_allow_permissions tinyint;

                set allow_permissions = 0;

                begin
                    declare sub_role_id int(11);
                    declare no_more_records tinyint default 0;
                    declare sub_role_ids cursor for
                        select role_id
                        from   __role_children_cache
                        where  permitable_id = _permitable_id;
                    declare continue handler for not found
                        begin
                            set no_more_records = 1;
                        end;

                    open sub_role_ids;
                    fetch sub_role_ids into sub_role_id;
                    while no_more_records = 0 do
                        begin
                            declare propagated_allow_permissions tinyint;
                            declare user_in_role_id, permitable_in_role_id int(11);
                            declare permitable_in_role_ids cursor for
                                select permitable_id
                                from   _user
                                where  role_id = sub_role_id;

                            open permitable_in_role_ids;
                            fetch permitable_in_role_ids into permitable_in_role_id;
                            while no_more_records = 0 do
                                call recursive_get_securableitem_actual_permissions_for_permitable  (_securableitem_id, permitable_in_role_id, class_name, module_name, user_allow_permissions, user_deny_permissions);
                                call recursive_get_securableitem_propagated_allow_permissions_permit(_securableitem_id, permitable_in_role_id, class_name, module_name, propagated_allow_permissions);
                                set allow_permissions =
                                        allow_permissions                                 |
                                        (user_allow_permissions & ~user_deny_permissions) |
                                        propagated_allow_permissions;
                                fetch permitable_in_role_ids into permitable_in_role_id;
                            end while;
                        end;
                        set no_more_records = 0;
                        fetch sub_role_ids into sub_role_id;
                    end while;
                    close sub_role_ids;
                end;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recursive_get_user_actual_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `recursive_get_user_actual_right`(
                                in  _user_id    int(11),
                                in  module_name varchar(255),
                                in  right_name  varchar(255),
                                out result      tinyint
                              )
begin
                declare _role_id int;

                set result = 0;
                begin

                    select role_id
                    into   _role_id
                    from   _user
                    where  _user.id = _user_id;
                    if _role_id is not null then
                        call recursive_get_user_role_propagated_actual_allow_right(_role_id, module_name, right_name, result);
                        set result = result & 1;
                    end if;
                end;
                select get_user_explicit_actual_right (_user_id, module_name, right_name) |
                       get_user_inherited_actual_right(_user_id, module_name, right_name) |
                       result
                into result;

                if (result & 2) = 2 then
                    set result = 2;
                end if;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recursive_get_user_role_propagated_actual_allow_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `recursive_get_user_role_propagated_actual_allow_right`(
                                in  _role_id    int(11),
                                in  module_name varchar(255),
                                in  right_name  varchar(255),
                                out result      tinyint
                              )
begin
                declare sub_role_id int(11);
                declare no_more_records tinyint default 0;
                declare sub_role_ids cursor for
                    select id
                    from   role
                    where  role.role_id = _role_id;
                declare continue handler for not found
                    set no_more_records = 1;

                set result = 0;
                open sub_role_ids;
                fetch sub_role_ids into sub_role_id;
                while result = 0 and no_more_records = 0 do
                  begin
                      declare _user_id int(11);
                      declare _user_ids cursor for
                          select id
                          from   _user
                          where  _user.role_id = sub_role_id;

                      open _user_ids;
                      fetch _user_ids into _user_id;
                      while result = 0 and no_more_records = 0 do
                          call recursive_get_user_actual_right(_user_id, module_name, right_name, result);
                          fetch _user_ids into _user_id;
                      end while;
                      close _user_ids;
                      if result = 0 then
                          call recursive_get_user_role_propagated_actual_allow_right(sub_role_id, module_name, right_name, result);
                      end if;
                      set no_more_records = 0;
                      fetch sub_role_ids into sub_role_id;
                  end;
                end while;
                close sub_role_ids;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recursive_group_contains_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `recursive_group_contains_group`(
                                in  group_id_1 int(11),
                                in  group_id_2 int(11),
                                out result     tinyint
                              )
begin
                declare group_2_parent_group_id, child_group_id int(11);
                declare no_more_records tinyint default 0;
                declare child_group_ids cursor for
                    select id
                    from   _group
                    where  _group._group_id = group_id_1;
                declare continue handler for not found
                    set no_more_records = 1;

                set result = 0;
                if group_id_1 = group_id_2 then
                    set result = 1;
                else                                                            # Not Coding Standard
                    select _group_id
                    into   group_2_parent_group_id
                    from   _group
                    where  id = group_id_2;
                    if group_id_1 = group_2_parent_group_id then
                        set result = 1;
                    else                                                        # Not Coding Standard
                        open child_group_ids;
                        fetch child_group_ids into child_group_id;
                        while result = 0 and no_more_records = 0 do
                            call recursive_group_contains_user(child_group_id, group_id_2, result);
                            fetch child_group_ids into child_group_id;
                        end while;
                        close child_group_ids;
                    end if;
                end if;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recursive_group_contains_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `recursive_group_contains_user`(
                                in  _group_id int(11),
                                in  _user_id  int(11),
                                out result    tinyint
                              )
begin
                declare child_group_id, count tinyint;
                declare no_more_records tinyint default 0;
                declare child_group_ids cursor for
                    select id
                    from   _group
                    where  _group._group_id = _group_id;
                declare continue handler for not found
                    set no_more_records = 1;

                set result = 0;
                select count(*)
                into count
                from _group__user
                where _group__user._group_id = _group_id and
                      _group__user._user_id  = _user_id;

                if count > 0 then
                    set result = 1;
                else                                                            # Not Coding Standard
                    open child_group_ids;
                    fetch child_group_ids into child_group_id;
                    while result = 0 and no_more_records = 0 do
                        call recursive_group_contains_user(child_group_id, _user_id, result);
                        fetch child_group_ids into child_group_id;
                    end while;
                    close child_group_ids;
                end if;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_email_message_for_sending` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`zurmo`@`localhost` PROCEDURE `update_email_message_for_sending`(message_id int, send_attempts int, sent_datetime datetime,
                                                                folder_id int, error_serialized_data text, now_timestamp datetime)
begin
                set @emailMessageSendErrorId    = null;
                delete from `emailmessagesenderror`
                        where id = (select error_emailmessagesenderror_id
                                    from `emailmessage`
                                    where id = message_id);
                if (error_serialized_data is not null) then
                    insert into `emailmessagesenderror` ( id, `createddatetime`,`serializeddata` ) values
                            (null,  now_timestamp , error_serialized_data);
                    set @emailMessageSendErrorId = last_insert_id();
                end if;

                update `emailmessage` set
                        `sendattempts` = send_attempts,
                        `sentdatetime` = sent_datetime,
                        `folder_emailfolder_id` = folder_id,
                        `error_emailmessagesenderror_id` = @emailMessageSendErrorId
                        where id = message_id;
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-07 14:06:22
