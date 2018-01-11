/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.1.49-community : Database - db_studentleave
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_studentleave` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_studentleave`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('5002',1,'StudentLeaveProcess01.bpmn','5001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"studentLeaveProcess\" name=\"Student Levae process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"学生填写请假单\" activiti:candidateGroups=\"xs\"></userTask>\n    <userTask id=\"usertask2\" name=\"班长审批\" activiti:candidateGroups=\"bz\" activiti:formKey=\"audit_bz.jsp\"></userTask>\n    <userTask id=\"usertask3\" name=\"班主任审批\" activiti:candidateGroups=\"bzr\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <userTask id=\"usertask4\" name=\"系辅导员审批\" activiti:candidateGroups=\"xfdy\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <userTask id=\"usertask5\" name=\"学生处审批\" activiti:candidateGroups=\"xsc\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\" default=\"flow6\"></exclusiveGateway>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"通过\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${msg==\'通过\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"大于3天\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days<3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"3天到7天\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days>=3 && days<=7}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" name=\"大于7天\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask5\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"usertask4\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"usertask5\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"未通过\" sourceRef=\"usertask2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${msg==\'未通过\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_studentLeaveProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"studentLeaveProcess\" id=\"BPMNPlane_studentLeaveProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"60.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"140.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"300.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask4\" id=\"BPMNShape_usertask4\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask5\" id=\"BPMNShape_usertask5\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"180.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"117.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"95.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"140.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"245.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"300.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"405.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"137.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"420.0\" y=\"120.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"500.0\" y=\"117.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"500.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"67.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"42.0\" x=\"531.0\" y=\"51.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"520.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"137.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"530.0\" y=\"120.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"500.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"500.0\" y=\"207.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"207.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"100.0\" x=\"531.0\" y=\"187.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"682.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"120.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"735.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"810.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"682.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"155.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"352.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"352.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"600.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"155.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"360.0\" y=\"200.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('5003',1,'StudentLeaveProcess01.png','5001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\02\0\0\0��\0\02xIDATx���l�}�q6Y2k`m�uRv��Ĳ��R�^�X��8�k,H����xh�\ZC�\n\rk<aXS��,p��%6d�P( дQ��UW��lǖ�8a���8U�8�g٦%J�|?�ٗ�?�������|��\"�ǻϏ�_�)2!\0\0\0�XH�>\0\0\0\0�=��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0@�T*�B�0<<�N���d�W�s�=��f��|�\\6=,��-\0\0�099)#�̵O?��;v=vl�Z��&�]�����ƍe�ȀkzpD[\0\0:�\\.�r�����o�\\�.Ҝ����e���377gz�D[\0\0:H�����ooj��@S�g������gggM\"�h\0@�r�Z��D�o/�x������p!�\0\0t������ե\nM�}�m��5Ӄ�h#�\0��J%�L�yj��t����Ͽ�nݧK���C�m\0�|>���K�v{泚��WO��[�add���!�\0\0tD6��x�?ȵw�R�����xeA\\��Ɵ��N�ݳ(��\"�T����K�;m����i���zpp���!�\0\0tD*�:|�@u���ļ�W��%�ޢ� ����#��>��쩪8� N^�qtI|��k/ܞ��6�L__��C�m\0����wϜ�.�[M���bay����՟�������������٪x�*�B<���Z����&����!Ҙ=\0������I�|�����9��_�/�3����\r���7��������o�~[AuE,�\"�����S�wf:��\0h�N�+q\nĵx�v[���������\n����Z�6��:�����wܷ���=բ8�f\0�%�D��6]����kr�aV��g�f�!��E��9��%���/n��ƫ����|l��E۽/�wݷ�Z��f1{\0\0-i>��`{9�~p)�ìO�v��^\\�UV_�=}I��[�Ժ[>�[7����o��w/	1� .,��q��^�}{�E}�a�\0L��d�{�]�6�.-�o7�td�=[�/���Uw�]�����O���vE�Sg��;��uݷ�Z��f1{\0\0-QeY��{��[�7$4���Oӷ��ҫ��;T��)��_�u���d�+??t������vxm���C����n�����GL�-���\0h��B\Zf���}�6��m�s�/~��]�˻�rݱ�Z��f1{\0\0�kW�=����>~��=�Y-ڞ�m�t��\04�A��H�[/�z_��I�]~��Ez�a�\0ФV���ÿ�d���0�E�Ӵ�-�#�0`�\0\0���>�$PX	��0�E�whA[D�!��\0��aޛ}�A�=�_-ھM�\"7�f\0\0�+\n���uo�E�9Z�F�E+�=\0\04�ȑ#����_��Ą�V�-����\0�I�J媫����5�\\s��7;_��E�_��5�a�4�Ҿ�{���inHy�\0\0�700����뮻��WԢ���[�4{����+����A]��v�ϵ�v5�-Z����\"S������h��d2�0֠9�˧ZlΝؗ�۳�����ߧ��}.�~ʦW	\"��\0�B&�l6���\'㬌�SW��\n\n:֬Yc\'�l���R�$.�j�f��ډ����:[�w�����z��w�=�����ӣ�c�\0@����Y/��E��+�rيz�T����?��}k-�l�Y;q�t^Pm_�z�M�-}#��^�[�r���\r�)���\01799)#��Ԕ���\'N���e2�d2922\"����Z�{��������C�=׽�uwՖ�k\Z^v^h�L]�aj@�\0��b��N�]�m${8���}SG[�3��?�yW\'ںvU�EYw����3���l�-���\0�%���� �֔Z�;�b�%/_v]pn������W�5u/�L[N���!=\0[6l���6}�k5�̶؜;�/��Y�&�~Y}m9M�a�:D�\0�X,f�Y�G��j��x��J�<�ܛϞ�o�n�z����r]ӖS6=t�0f\0�S&����4}=��~�J�/_v^�s͛�Ou��x��u��ų6=t�0f\0����������u��w�-�ޕ�}�k꽗��N|�u�s\'���u�D[���\01Ļ ��҂6�-Z���ڲe������u�h�:-h#ڢ�\0��t:�w4G�%ڢ��=\0C|�WȈ��r��m�\nf\0�P2����X�Z�}��m�\nf\0�P?_Bf\\-ږhA��`�\0@ m_�m�^���\01D8��������BԘ�h�\0b�p�d������j�^���\01D8�L&����2M��Z�^*�2=t�0j\0��6���FF�3�վ�4�˙:D�\0b�h�����\'/V���C4͖��I�X4=t�0j\0��6$FWm^/�t��ix8cz�m�>\0�!�mHT*�t�3���!�A���ۑJ}�\\�iz�m�>\0�!�mx�J�����RQ����\\+�LM=ez�y�>\0�!�m�LOO�t;6��B�y[��X*����7��8��@mæR������[�����{^���r����?e�iy��]�\\n||\\v���BtQ�\0 ����455������o&�H��_?<|�L�ގ���ݲeK2�$�\"(j\0�P�h�蛛�#�\"(j\0���A�E �>\0�!�-b��M�>\0�!�-b�\n�����r��� ��}\0CD[Ę�2�&�I.��}\0CD[�uQ�\0 ����\\�P�\0 ����)΀;77g�p`�\0b�h�d�-[�p{�\0b�h��U�T���	�=��\01D�E�#��,j\0��ܞD��\"�6;�n޼yvv��ᠳ�}\0CD[�E�m۶ɀ����1F��\"�*�|��cԾH�O=����p:���3ѫ���f��N�铺_K\\Ƿ;D�Pbu[°�	�qE틞��I�\Zee|��_ر��c��jo6y�&&&6n�(�D�)Ӄ��o�ǷkD��au�pup��%�\\~CCC\'�<�X]�9��wO�);\'����{|��h*�n+��g333���B�Y������M՞����ׯ��o�7���}D��`uGeu\n9R�l��iԾȐ��k��Ϳ�����n�c������>�mx�������\"7Ҩ}�09994tGu�B�i_��C[�~������{|� چ�;����]Ծ�T*�d��S�ե�4�6��u�>]*�L��7��k\n�6X�Q_��(��E@>���rեv�=�Y�Xqޫ��֭�022bz�0��_S��a����n:����2},h������3��Ae�c�B�X�W�+����7�4�̏t��E���\"v^�_��yh����)#���Ӳ�:-�o�������0`�X�qZ�2צk�!G���T*u�����y��g��B�_g��{���$���;�����8yI�V��%�ݟ�=�?߃m�����>�C�����v�L���v۷�o���n�bu�oup�/�ѶR�����Q��9}E&���\n�h�����wϜ�.�[Mֻ�bay����՟�������������٪x�*�>���Zq������e|�=�]f��}/�_�.ɟ�[�X�q]��	�>I&���!�*a�=M��@�|�\'�����g^��c�=��<��#��ò�lذ!*_nT+p��&=�$�\\�˗7��t}�o}ퟟ8���D����Z����A�}{���8Z߮��}��\Z�n��{h9s��\"�n�߽M`uwmua������Y&�a\Z�!{ppp۶m2��ѣ.\Z�G��̌���2�ڕ]�v�ڽq����)�\n���m�8.�����*���Bj��D��D���ot�q�����T�Jqd|�9��{9���f�W��7�v9���쳁��M�9�X��\\ݦ���dd��y�-{۰aC�P�L&��б���ollLN�v��a�u}����͛����V���-Q�/-����s�Kb��_�x�W�ʵ׭���*�{_��oO��G�����Ga�Q�\\۹t�ܦ���nz�έ�9��5�ϣ����7��Ǐ��9�X�Ww����d�Y���nݺ[o��g����\\�U��+_�����e{��G���\\[�G����tA�f���\r���###�B���˓Oʺڷ��\n\\�n�׋+�����ӗĎ��O���c�uÚ�_�ֿ�������wN�uݷ�ZT�#������Gӛ�k;�ne��i?��ꨄ�Us�]VCn�=������,U��K�* �����.C�@\\/�>����;注O�{F�����.�d���1��2���P(�ε���~����r�.-�o7k���x�*�_�����ͮ�������΂x�\"ީ�3B�ǝ{����S-*ő��������\\|�nsC�Q:����LmUO�F���\r�(������C�p��oX��n�җ���^f�J�E��d�C�+�>��#�}�������~����#\r��k�/�mߙ�*p��o{����*Mϔv�/�:pd�K�~�畟:�?���l�k��6}�ȡ��x�_��}��Ƌ������S��˱��+B��sm\'ҭ��+���R��m宯�!ОÆ����6v�������k�؏����V�W��[ݺ��\0����)C����C������366����mb�9M��[�8��l_��\r˽��w��cO��GƷ��h����W�6�͵z��˫�}U���W�}z�e���auwsu��L��T�9��^{�-��bo0<<l�$CH+/����[��k��)��#��|2��\\k�M�ضm����Zq<CڢR�n�o\"૶\"�Ѷ�\\ۡ�n]1�U���v�g{՛�{-Vw7Ww8=��C�i�M7Y?Z,�+�{��ٞ��콍���>uc\"<{d�m�����o���\'��z[�jq\\~��E�82���D�Wm��4k�?ikצT��;��u��}{����[G���І�nop�7,k�9lX��\\��422R�I]*��$c���dڒa����*�tSTg��i�mϵV{��/���N�8��mQ)��o7Ƿn���V8^nlr�۪n���f\'��{ӭ�k��oc��?���K��˪m�\\�x�Vg�a����ꎊ���\\.�L&7o�l-\"�~O�y�-���y�3�l�b�\\͈��9�G�z�V�ӧ��Zq|��E�82��_�{���A�\\kq�[g�m{���v�*�z�-�w��Æ����9r�Y������#׸����~ӧhF$g�,�r�:�k��~���||F�8�MڢR߮���5ں����ۘ�͵�Wh��֛k�ׇڕn}:�ٷ��t�覐`uwmuG��I�R�^���,֞��}���ٓ��s�\\G��[����t�\n���Suk�q����82����L������L����k��C޵o�+V7�[�gn�$c�J��ڞa6m��A]N2!�ٳy��m۶u4ھ������#G�X���믟��p�Jq�zqd|�=�-���ߣ�M��^{�N�%ݶ����V��m[�`������\r���Y��=�LFU��Վ;��O$�vF�J媫��&�5�\\s��7;��Պ�/}���kK�5��n�hDu�@���\Z��޲k#���m��?D�.��^5;tR憴������]o��̵��Vtzu�\n�j}y˯����x�����2�X7u\"��c�<��^�	�HΞ}엳��?/�%��I��0w�u��w�}�\'w�_����o�6�>���@U\r����~��\\;�n�z8��pn������m����a{3����υεP�o�|�G���U�ۆ��tۊ���K̻�Ꚇk��/{J��\n���37���P���t�s�s��﹮;-�^4ny�����׾�ڡ�z��\Z���[W:�=�&:Ĺ�����@��D�\'|�>���k�n}.t��2����V��`~2�ӫ��ڵ��|�#۷Gs�{�z�c��-K�u��g�G�<$�\r��?ѱ\n���m�^��Q������lD�S��ˇw!�v�֬Yc��l�\\إRI\\~�����ߪZ`�[�n�ڧ�~��t������뜲s�n����Ƿ�V����Is�>w�>P��.l��\"��133#���w�4,Yu?�R��n��A>�����[UU�J�vU�.T�جn��a�n���������H�sG?��j]~���! r�����g�P�o�������g�\r�^����}}��<���m���=�\'�ݿϑtm��>�M4�W}FV@�G��5�s�\'hpL��z�t�k-\r�-��9�X��ϵ�U�<t�볺u�ioH�bu��\r�e�N�������G�Fr��r9秎w��ܵ{���];�\'N�\'X�L&�L������V�oj����꽾^	kp_�~���C�h�E�c�6���k��ꜻ��]ݮ\Ze��Ҽ�Bm?�p�o�����?��͵��G\\���[rm�:���#碮��tָ-\r��;Qⱺ��L2V/�˓O�=ü|������AS�oP$g���x{����dt޸��<�b�����~\0^��p���̵A�Z����\\{����6�o�i��Y�����q��L¶�`ׇ�S|��M�nU������D�ϻ��M���Vtbu��SA�D��ݯ\0�Y�>scll��76ڞaݺ�����p�OڼH�9K�s��Fۡ����I�\'zY�F�P5�2緥kW�-}�u_��X�U��߿f�Jql��4O�ۥ�}۰�}FYgWm?A�C�m�t�ʵ��!�����M����i�p�p-��K/����\\�D��]*����������fY(���`m�D\r�����_��I&����a�Z#Vf5��ƪm.W(�A�i_�ُ�@�uݤ,�\Z�dz�\Z��f�jD|�t�\n�!��C\'��m/o�ݸ��Aq}Η7���������Nkq!��P���Y?Uk_��:Tzdu\'�I�\'\'&�ic��?�V��������{���cr�O��\Zq\\��l\\w�+�긺�5�ɻ��[:�q�k���彋���ĩi����x��9j��ox�9O����o���[�����\\�e����q-7��Vm�ڳ��ߥk�GV�����[}�nݺ6�p��;�v��fM��Q�=�JE>��ħ�����O$���L��j���Mg�@�h>�s�+u�}_�6\r�	z�޻�:-M��ι������Xu��(8�5��8�h�o\'�M��ߣ+�-����+\\\r//{\n�j���\Zh�w��iu?��C�������_��{�����v}���]������S(��ؿd+.�c\r�=�}nR�n��k��u^��̺�ڲ��t��.��NK���΁���gv�F�sg���o���N��&�v_���S3��z��ϊ�G��_�;Qⴺ�����on*�����+Q�/h�\Z�Դ�O;z옝�7o�l�ԍ����ܝw��*��[�/`��>�V\Z�҂��G�7���9����l��nbu��ggg�_� }���M&����lذ��^��V��LF��J�B���]��S.�ׯ_߮�\'���XN,ӧ�V+��ӂ��G�7���QA�-���Xݬna7m�d�t&�)��2������_T�䛧�\\���755e�͋��)�J2ݶ�̲���;���L�P�xG�7���i����\\�e��^^�2Ԏ��\'��\\.g�-���ֵ�L��k�2�����v��C��\Z9����쑕Z>Y�C�t�}��a��ÙkE�8���mQ)��o�Ƿ4���\\�}���\\�v�ݲe��ƀB� O��{�ݰaC�T�ޥX,:?�O�\Z�_��^����{��v ׊xD[Q{g���?�Hз���?������`�$�j��5Z������{|���7�k�`u�����Z��_��_K�R>�PF^��3�ʀ+���]�2��˓O\r\r97�ɸ�߇`�����F΀�kS2�j~>ܷ�o��?���e�7}�~jűDڢR�x�o��|/��Vw�nU������O������h___����׫n\Z��s����\'�V�*���sw�)�����򚧟�ϻ�Gn�q����=$j��UZ������{|���7�k\rbu���ytll�\'�%w����FX/�����[�8����\'�<�E93�߮.����P(D���䳴����BԢR�x�o�9�-��8Vw�W��\"��###m�T&�Ud�t%���lv۶m�R[W4fO���������jQ)��o�Ƿ��t{��1r�q�n;�ʟ]{�L���<Pԅ}�@�d2�Mn[/��۫��R)�C�����\Z!��G�\\k�;~��H�����#���� �m������g��D�}\'�hT��2��_S�0`u�iu�\n���n�IF�/}�K]~�(\"�F���l*�ɋ�}+�M�e�����0c|�=�����t{�;���uS�Vz��ǭw�~���c\Z��E���+�%�N���?\r���%��x��Dې`uGzuۡv||�ԛ��ڟ�u���r�-F#B�}�P�T���LO��i�mnnG*��ry��A����\ZA�\r	VwDW�3��A4x$�l���7�tS>�7x<�G틌R�48��T*\n1CS5Y�\"SSO����x�o�mÃ����P+j/�z?��w~�w�X�Q��dzzZ�Ǳ���\0�ۊ��R���Կ��&1���.#چ\n�;�;T����SOYq�S���m������A���FFr��-�����=/�~Z���B�����ٴ�lz�Z���{|��h6��0�����\\.700�Pk���~�я~T����~��jn����j_$�9������oj~_���_?<|������m_���ow$�����v\n��B�̎�}��̌<HqeQ��|H�?j\0�p~�$t$������Z�&�	��4�;@%r��¢�D7P��Fcx�J�(�Z�Z�@�J\Z]��433��fS�TC��E��n�D%�.��X�vpp0l���Z�@�J\Z]��PkaQk��\0(QI���C/�Y����5�M\0�����ء7MMM�/�ZXԚ�&\0JT��b��kd�M��/�ZXԚ�&\0JT��b��;�PﯟeQk��\0(QI���C/�PkaQk��\0(QI���C��T����5�M\0������!����\rz*�ZXԚ�&\0JT��b�?2�f����i��b\0�Z�@�J\Z]����333����&�	��4��p�T*�Baxx8�N\'��D���.{@F�|>_.�}z�PkK����M\0�����؅��䤌t2�>���/��q�ر�j�7�<w�7n�}\"����.,jMt\0%*it1v�R.�s������7O.Vi�v���2��Ι��3=P�Ƣ�D7P��Fc2�~{�S����=��gׯ_?;;kz�E��n�D%�.�.<r�\\-�^���v<�mlz�E��n�D%�.�.$&\'\'���.Uh:�+_}h�֯���bQk��\0(QI����J��L&�<5[]�H�i���_��ӥR��Ѕ�Z�@�J\Z]�]���\\.W]�`��3���x,�z�m��###��.�XԚ�&\0JT��b�� ��N<����;�~)ĉe�zU�� .�}�K����G���Y�[{*b���%�͝�6m~�x�4�^�?=88hz�E��n�D%��n���|^��ڱ��J�>P]:o5y��B�_g��{���$���;�����8yI�V��%�ݟ��p{����3}}}��.�zgᴈn�D%��0D۠��[�&����{�Tui�j�.,���՛�VV~�?������{��KB�[g�⽪(��ޗj�v�7[Ǻ�Mt\0%*itE\"�}�Vgr���M�9�j������ę�bq���r�O|�k���ɷV����\"k�w��]���q��E�@�J\Z]}}}�J�;�ՆWmWC���s������m5�.�����*���Bj��D��D���ot�q�����T���wݢ�n�D%��d2ٹ/vj���u���\\znS�`�X��g�f�!��E��9��%���/n��ƫ����|l��E۽/�wݷ�Z�ǽC�Mt\0%*it\r���t�TYV7�}��+�Eh\"4�Y-���&��\"ޫ��j{��ر���u�|�nX�������^b~A\\XX���齮��T��@wݢ�n�D%��t:=55Յ�&Ié��s��˶�\"A����v�NG�۳U���x�\\u���u�������YoW�;qfA�p�s�^�}{�E}�;�n�D7P��FW.����]x�������{3W<M�~�K����Piz��kiׁ#�_:��=��������g�_�u��G��Ɠ����{�61���B�h��\0(QI����N?�s���孎w#ԽK�\'a-ھ�l_��\r�t!��]w���S-҃�9t�&�	��4�J�R*�����!�*^���s�բ�Z���(�E�@�J\Zi��K2���0��R�=��j�]~��Et�;�n�D7P��F�����-[:�g�+����\r�9�j��4-h��@wݢ�n�D%��J��L&���LH�E�whA��.�E�@I��6�+�\"��񶘚�J�Ӧ��wբ�۴���_ݢ�n��J�u]�L�:w������h�ޖ\0K�PP}�[-��т6�]t�&�	���_��ߥ��FP###�L�\\.�>�:r�5�������	׭D[�m�-��&\0J-�jkߪ�d599�L&GGGy�m{U*����ʚ��\\s��7��|�m�b�w�ڛj�>������-�lnHËn�D7Pj%�����V���m�M?4���eme��d2�Bw���8��]w�u��w����6����j����^���g?�_��L��kzTÈn�D7PRU҆�:��Q��S�;DF���Im��t�qD떗O����o_�yP�][��w�>Z?k�%��Mt\0%�Jj�K��{B����W�6@h�Y��^�\Z���T*�˯ھ�J�߃�Vu����u��AÇv�ֵ��G�M�j�-��&\0J\r+�3�z7N|�Vm5�rٚҩT����?��}k-�l�)2�6�{��O�r=�}�uk�N�ڕ�1\r-�E�@ɿ�zch�̪�Y��B�ĉ}}}�L&�L����>�����h{s���׺�[��k�t.;/��LY�u�-��&\0J�J�z��u�a���Gۺ���U,��|ݏ��D�m�Ϻ8��O��}��\r�6�@L���E�@I���$`��R�K��w���5�DL�-�{�:/�6��ܭ�~Z?k�CFt�&�	�R+�6�x��.Q��^�6@t�f���66��o�ջ�_����{���iz�n�D7P����e��ml:;��ƺ�����󚆗�����4=taD�h��\0(QI�VԢ�/��tv���y}[�s%�~�v���#�E�@�J\n������9���I�^�c�;z��n�z,�>�i�dM]�-��&\0JTR���w��Qy�[4�M\0���@+j��uZ�F婋n�D7P��� �mۈn�D7P����+he�-h���E�h��\0(QI�VԢ�k����Sݢ�n�D%ZQ��%Z�F婋n�D7P����E�WiA��.�E�@�J\n�������++��5*O]t�&�	��hE2�<~�G++�i�\Z��.�E�@�J\n�\"��<7�mE�L�o����J�L]Q�5�M\0���@+���FF�3�վ�4�˙�0� k��\0(QI�V��ΦR��Xٷ\"�4[6�\'�b��ЅY�@�J\n�ht���M��Wំ�3�-�(Ț�&\0JTR�E�J%�����q�����v�R�,�w���� k��\0(QI�֕J�����RQ����\\+�LM=ez����n�D%�bzzZ�۱���\0�ۊ��R���Կ��P� k��\0(QI�v�T*##�t��|����b?�\\�i�����C�lZ^6=DaGA�D7P���555������o&�H��_?<|�L���%\Zd=t\0%*)\0�Y�@�J\n\0!AA�D7P��@HP�5�M\0���\0dMt\0%*)\0�Y�@�J\n\0!AA�D7P��@HP�5�M\0���\0dMt\0%*)\0�Y�@�J\n\0!AA�D7P��@HP�5�M\0���\0dMt\0%*)\0�Y�@�J\n\0!AA�D7P��@HP�5�M\0���\0dMt\0%*)\0�Y�@�J\n\0!AA�D7P��@HP�5�M\0���\0dMt\0%*)\0�Y�@�J\n\0!AA�D7P��@HP�5�M\0���\0dMt\0%*)\0�Y�@�J\n\0!AA�D7P��@HP�5�M\0���\0dMt\0%*)\0�Y�@�J\n\0!AA�D7P���T*��\0@��E7PJ&������\0@��E7P\Z���1}\0�����LE4m(��驩)�G\0�nvv6�L�>�h �P��r�|��Q\0@�����d2��\"\Z��\0�d�����Q\0@��1}�@��T*�R���\0�^��d&\'\'ME4m��/�\0�����d2�G1j\"��3>>�e��G\0��:���J��L&���L\0�\"�pPD[\0\rLMM��i�G\0��O�	�h����Q�;\0�l|||��ͦ�\"b��\0����d2�r�l�@\0 �*�J.�#�6�h@���d2��]_\0�!�ry||\\[އ��-�\0d͕�V��L&#/�5�\0������e�YY`�l��+M#��R�LNN�h�N�\0���r:22R,y�W���\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0�	�-\0\0\0b�h\0\0�� �\0\0 &��\0\0\0���@#�J�x��\0\0\0\0IEND�B`�',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','22501',10);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.history','create(5.20.0.1)',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.version','5.20.0.1',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('10002','studentLeaveProcess:1:5004','10001','10001','startevent1',NULL,NULL,'Start','startEvent',NULL,'2016-12-08 10:17:27','2016-12-08 10:17:27',25,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('10004','studentLeaveProcess:1:5004','10001','10001','usertask1','10005',NULL,'学生填写请假单','userTask',NULL,'2016-12-08 10:17:27','2016-12-08 10:17:27',982,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('10007','studentLeaveProcess:1:5004','10001','10001','usertask2','10008',NULL,'班长审批','userTask',NULL,'2016-12-08 10:17:27','2016-12-28 16:38:21',1750854975,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('12505','studentLeaveProcess:1:5004','10001','10001','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-12-28 16:38:21','2016-12-28 16:38:21',1,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('12506','studentLeaveProcess:1:5004','10001','10001','usertask4','12507',NULL,'系辅导员审批','userTask',NULL,'2016-12-28 16:38:21','2017-01-05 10:08:22',667801583,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('12513','studentLeaveProcess:1:5004','7501','7501','endevent1',NULL,NULL,'End','endEvent',NULL,'2016-12-28 16:39:04','2016-12-28 16:39:04',1,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('15003','studentLeaveProcess:1:5004','10001','10001','endevent1',NULL,NULL,'End','endEvent',NULL,'2017-01-05 10:08:22','2017-01-05 10:08:22',0,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17502','studentLeaveProcess:1:5004','17501','17501','startevent1',NULL,NULL,'Start','startEvent',NULL,'2017-01-12 22:31:53','2017-01-12 22:31:53',34,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17504','studentLeaveProcess:1:5004','17501','17501','usertask1','17505',NULL,'学生填写请假单','userTask',NULL,'2017-01-12 22:31:53','2017-01-12 22:31:54',1157,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17507','studentLeaveProcess:1:5004','17501','17501','usertask2','17508',NULL,'班长审批','userTask',NULL,'2017-01-12 22:31:54','2017-01-12 22:33:40',106801,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17514','studentLeaveProcess:1:5004','17501','17501','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-01-12 22:33:40','2017-01-12 22:33:40',1,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17515','studentLeaveProcess:1:5004','17501','17501','usertask4','17516',NULL,'系辅导员审批','userTask',NULL,'2017-01-12 22:33:40','2017-01-12 22:35:07',87470,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17520','studentLeaveProcess:1:5004','17501','17501','endevent1',NULL,NULL,'End','endEvent',NULL,'2017-01-12 22:35:07','2017-01-12 22:35:07',0,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20002','studentLeaveProcess:1:5004','20001','20001','startevent1',NULL,NULL,'Start','startEvent',NULL,'2017-01-17 21:46:45','2017-01-17 21:46:45',26,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20004','studentLeaveProcess:1:5004','20001','20001','usertask1','20005',NULL,'学生填写请假单','userTask',NULL,'2017-01-17 21:46:45','2017-01-17 21:46:45',993,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20007','studentLeaveProcess:1:5004','20001','20001','usertask2','20008',NULL,'班长审批','userTask',NULL,'2017-01-17 21:46:45','2017-01-17 21:47:07',22649,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20014','studentLeaveProcess:1:5004','20001','20001','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-01-17 21:47:07','2017-01-17 21:47:07',1,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20015','studentLeaveProcess:1:5004','20001','20001','usertask5','20016',NULL,'学生处审批','userTask',NULL,'2017-01-17 21:47:07',NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('7502','studentLeaveProcess:1:5004','7501','7501','startevent1',NULL,NULL,'Start','startEvent',NULL,'2016-12-08 10:16:28','2016-12-08 10:16:28',16,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('7504','studentLeaveProcess:1:5004','7501','7501','usertask1','7505',NULL,'学生填写请假单','userTask',NULL,'2016-12-08 10:16:28','2016-12-08 10:16:28',851,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('7507','studentLeaveProcess:1:5004','7501','7501','usertask2','7508',NULL,'班长审批','userTask',NULL,'2016-12-08 10:16:28','2016-12-28 16:39:04',1750956681,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('12501','comment','2016-12-28 16:38:21','王八[班长]','10008','10001','AddComment','同意','ͬ��');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('12509','comment','2016-12-28 16:39:04','王八[班长]','7508','7501','AddComment','不同意','��ͬ��');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('15001','comment','2017-01-05 10:08:22','赖月京[系辅导员]','12507','10001','AddComment','可以','����');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('17510','comment','2017-01-12 22:33:40','王八[班长]','17508','17501','AddComment','批注','��ע');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('17518','comment','2017-01-12 22:35:07','赖月京[系辅导员]','17516','17501','AddComment','批注吧','��ע��');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('20010','comment','2017-01-17 21:47:07','王八[班长]','20008','20001','AddComment','同意了','ͬ����');

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('10006','xs','candidate',NULL,'10005',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('10009','bz','candidate',NULL,'10008',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('12504',NULL,'participant','王八[班长]',NULL,'10001');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('12508','xfdy','candidate',NULL,'12507',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('12512',NULL,'participant','王八[班长]',NULL,'7501');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('15002',NULL,'participant','赖月京[系辅导员]',NULL,'10001');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17506','xs','candidate',NULL,'17505',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17509','bz','candidate',NULL,'17508',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17513',NULL,'participant','王八[班长]',NULL,'17501');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17517','xfdy','candidate',NULL,'17516',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17519',NULL,'participant','赖月京[系辅导员]',NULL,'17501');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('20006','xs','candidate',NULL,'20005',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('20009','bz','candidate',NULL,'20008',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('20013',NULL,'participant','王八[班长]',NULL,'20001');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('20017','xsc','candidate',NULL,'20016',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('7506','xs','candidate',NULL,'7505',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('7509','bz','candidate',NULL,'7508',NULL);

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('10001','10001',NULL,'studentLeaveProcess:1:5004','2016-12-08 10:17:27','2017-01-05 10:08:22',2418655587,NULL,'startevent1','endevent1',NULL,NULL,'',NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('17501','17501',NULL,'studentLeaveProcess:1:5004','2017-01-12 22:31:53','2017-01-12 22:35:07',194474,NULL,'startevent1','endevent1',NULL,NULL,'',NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('20001','20001',NULL,'studentLeaveProcess:1:5004','2017-01-17 21:46:45',NULL,NULL,NULL,'startevent1',NULL,NULL,NULL,'',NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('7501','7501',NULL,'studentLeaveProcess:1:5004','2016-12-08 10:16:28','2016-12-28 16:39:04',1750956688,NULL,'startevent1','endevent1',NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('10005','studentLeaveProcess:1:5004','usertask1','10001','10001','学生填写请假单',NULL,NULL,NULL,NULL,'2016-12-08 10:17:27',NULL,'2016-12-08 10:17:27',958,'completed',50,NULL,NULL,NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('10008','studentLeaveProcess:1:5004','usertask2','10001','10001','班长审批',NULL,NULL,NULL,NULL,'2016-12-08 10:17:27',NULL,'2016-12-28 16:38:21',1750854927,'completed',50,NULL,'audit_bz.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('12507','studentLeaveProcess:1:5004','usertask4','10001','10001','系辅导员审批',NULL,NULL,NULL,NULL,'2016-12-28 16:38:21',NULL,'2017-01-05 10:08:22',667801561,'completed',50,NULL,'audit_ld.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('17505','studentLeaveProcess:1:5004','usertask1','17501','17501','学生填写请假单',NULL,NULL,NULL,NULL,'2017-01-12 22:31:54',NULL,'2017-01-12 22:31:54',140,'completed',50,NULL,NULL,NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('17508','studentLeaveProcess:1:5004','usertask2','17501','17501','班长审批',NULL,NULL,NULL,NULL,'2017-01-12 22:31:54',NULL,'2017-01-12 22:33:40',106779,'completed',50,NULL,'audit_bz.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('17516','studentLeaveProcess:1:5004','usertask4','17501','17501','系辅导员审批',NULL,NULL,NULL,NULL,'2017-01-12 22:33:40',NULL,'2017-01-12 22:35:07',87463,'completed',50,NULL,'audit_ld.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('20005','studentLeaveProcess:1:5004','usertask1','20001','20001','学生填写请假单',NULL,NULL,NULL,NULL,'2017-01-17 21:46:45',NULL,'2017-01-17 21:46:45',971,'completed',50,NULL,NULL,NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('20008','studentLeaveProcess:1:5004','usertask2','20001','20001','班长审批',NULL,NULL,NULL,NULL,'2017-01-17 21:46:45',NULL,'2017-01-17 21:47:07',22620,'completed',50,NULL,'audit_bz.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('20016','studentLeaveProcess:1:5004','usertask5','20001','20001','学生处审批',NULL,NULL,NULL,NULL,'2017-01-17 21:47:07',NULL,NULL,NULL,NULL,50,NULL,'audit_ld.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('7505','studentLeaveProcess:1:5004','usertask1','7501','7501','学生填写请假单',NULL,NULL,NULL,NULL,'2016-12-08 10:16:28',NULL,'2016-12-08 10:16:28',811,'completed',50,NULL,NULL,NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('7508','studentLeaveProcess:1:5004','usertask2','7501','7501','班长审批',NULL,NULL,NULL,NULL,'2016-12-08 10:16:28',NULL,'2016-12-28 16:39:04',1750956670,'completed',50,NULL,'audit_bz.jsp',NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('10003','10001','10001',NULL,'leaveId','integer',1,NULL,NULL,2,'2',NULL,'2016-12-08 10:17:27','2017-01-05 10:08:22');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12502','10001','10001',NULL,'msg','string',1,NULL,NULL,NULL,'通过',NULL,'2016-12-28 16:38:21','2017-01-05 10:08:22');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12503','10001','10001',NULL,'days','integer',1,NULL,NULL,3,'3',NULL,'2016-12-28 16:38:21','2017-01-05 10:08:22');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12510','7501','7501',NULL,'msg','string',0,NULL,NULL,NULL,'未通过',NULL,'2016-12-28 16:39:04','2016-12-28 16:39:04');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12511','7501','7501',NULL,'days','integer',0,NULL,NULL,3,'3',NULL,'2016-12-28 16:39:04','2016-12-28 16:39:04');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('17503','17501','17501',NULL,'leaveId','integer',1,NULL,NULL,1,'1',NULL,'2017-01-12 22:31:53','2017-01-12 22:35:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('17511','17501','17501',NULL,'msg','string',1,NULL,NULL,NULL,'通过',NULL,'2017-01-12 22:33:40','2017-01-12 22:35:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('17512','17501','17501',NULL,'days','integer',1,NULL,NULL,3,'3',NULL,'2017-01-12 22:33:40','2017-01-12 22:35:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('20003','20001','20001',NULL,'leaveId','integer',0,NULL,NULL,3,'3',NULL,'2017-01-17 21:46:45','2017-01-17 21:46:45');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('20011','20001','20001',NULL,'msg','string',0,NULL,NULL,NULL,'通过',NULL,'2017-01-17 21:47:07','2017-01-17 21:47:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('20012','20001','20001',NULL,'days','integer',0,NULL,NULL,30,'30',NULL,'2017-01-17 21:47:07','2017-01-17 21:47:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('7503','7501','7501',NULL,'leaveId','integer',1,NULL,NULL,2,'2',NULL,'2016-12-08 10:16:28','2016-12-28 16:39:04');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('bz',NULL,'班长',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('bzr',NULL,'班主任',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('gly',NULL,'管理员',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('xfdy',NULL,'系辅导员',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('xs',NULL,'学生',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('xsc',NULL,'学生处',NULL);

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('cc2','bz');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('wangba','bz');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('ss','bzr');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('szx','bzr');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('sjb','gly');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('lyj','xfdy');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('cc2','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('lisi','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('ss','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('wangba','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('zhangsan','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('dzt','xsc');

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('cc2',NULL,'王','二小','sds@qq.com','12',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('dzt',NULL,'杜','子腾','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('lisi',NULL,'李','四','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('lyj',NULL,'赖','月京','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('sjb',NULL,'沈','静斌','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('ss',NULL,'sd','sd','sds@qq.com','d',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('szx',NULL,'史','珍湘','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('wangba',NULL,'王','八','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('xx',NULL,'1','1','sds@qq.com','1',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('zhangsan',NULL,'张','三','123@qq.com','123',NULL);

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('5001','学生请假流程测试02.zip',NULL,'','2016-11-22 09:45:51');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('studentLeaveProcess:1:5004',1,'http://www.activiti.org/test','Student Levae process','studentLeaveProcess',1,'5001','StudentLeaveProcess01.bpmn','StudentLeaveProcess01.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`LOCK_TIME_`) values ('20001',3,'20001',NULL,NULL,'studentLeaveProcess:1:5004',NULL,'usertask5',1,0,1,0,1,2,'',NULL,NULL);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('20013',1,NULL,'participant','王八[班长]',NULL,'20001',NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('20017',1,'xsc','candidate',NULL,'20016',NULL,NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values ('20016',1,'20001','20001','studentLeaveProcess:1:5004','学生处审批',NULL,NULL,'usertask5',NULL,NULL,NULL,50,'2017-01-17 21:47:07',NULL,NULL,1,'','audit_ld.jsp');

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('20003',1,'integer','leaveId','20001','20001',NULL,NULL,NULL,3,'3',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('20011',1,'string','msg','20001','20001',NULL,NULL,NULL,NULL,'通过',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('20012',1,'integer','days','20001','20001',NULL,NULL,NULL,30,'30',NULL);

/*Table structure for table `t_leave` */

DROP TABLE IF EXISTS `t_leave`;

CREATE TABLE `t_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(64) DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  `leaveDays` int(11) DEFAULT NULL,
  `leaveReason` text,
  `state` varchar(20) DEFAULT NULL,
  `processInstanceId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_leave` */

insert  into `t_leave`(`id`,`userId`,`leaveDate`,`leaveDays`,`leaveReason`,`state`,`processInstanceId`) values (1,'lisi','2016-11-28 15:18:28',3,'肚子疼','审核通过','17501');
insert  into `t_leave`(`id`,`userId`,`leaveDate`,`leaveDays`,`leaveReason`,`state`,`processInstanceId`) values (2,'lisi','2016-12-08 09:59:04',3,'回家看病','审核通过','10001');
insert  into `t_leave`(`id`,`userId`,`leaveDate`,`leaveDays`,`leaveReason`,`state`,`processInstanceId`) values (3,'lisi','2017-01-17 21:46:43',30,'回去玩','审核中','20001');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
