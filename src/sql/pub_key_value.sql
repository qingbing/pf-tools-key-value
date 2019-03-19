-- --------------------------------------------------------
-- 键值对，基础的键值对配置表，只能由程序员在数据库进行操作，属于网站的基础数据
-- 对程序代码，提供统一出口 \Tools\\U::keyValue($category, $key);

--
-- 表的结构 `pub_key_value`
--
CREATE TABLE IF NOT EXISTS `pub_key_value` (
  `group` VARCHAR (50) NOT NULL COMMENT '键值对类别',
  `key` VARCHAR (50) NOT NULL COMMENT '键-值（键）',
  `value` VARCHAR (50) DEFAULT NULL COMMENT '键-值（值）',
  `sort_order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  UNIQUE KEY(`group`, `key`),
  KEY(`is_enable`),
  KEY(`key`),
  KEY(`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公用键值对-对应表';


INSERT INTO `pub_key_value` (`group`, `key`, `value`, `sort_order`, `is_enable`) VALUES ('access-mod', 'program', '程序员模块', '1', '1');
INSERT INTO `pub_key_value` (`group`, `key`, `value`, `sort_order`, `is_enable`) VALUES ('access-mod', 'admin', '管理员模块', '2', '1');
INSERT INTO `pub_key_value` (`group`, `key`, `value`, `sort_order`, `is_enable`) VALUES ('access-mod', 'user', '网站会员', '3', '1');

INSERT INTO `pub_key_value` (`group`, `key`, `value`, `sort_order`, `is_enable`) VALUES ('nav-mod', 'background', '后台管理', '1', '0');
INSERT INTO `pub_key_value` (`group`, `key`, `value`, `sort_order`, `is_enable`) VALUES ('nav-mod', 'front', '网站前台', '2', '1');
