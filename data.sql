SHOW CREATE TABLE t_token

-- dao 记录表
CREATE TABLE `t_dao` (
  `dao_id` INT NOT NULL COMMENT 'dao ID',
  `block_num` BIGINT DEFAULT NULL COMMENT '区块号',
  `dao_name` VARCHAR(2000) DEFAULT NULL COMMENT '名称',
  `dao_symbol` VARCHAR(2000) DEFAULT NULL COMMENT 'DAO 符号',
  `dao_dsc` VARCHAR(4000) DEFAULT NULL COMMENT '描述',
  `dao_time` INT DEFAULT NULL COMMENT '时间戳',
  `dao_manager` VARCHAR(128)  DEFAULT NULL COMMENT '管理员地址',
  `dao_logo` TEXT  COMMENT 'svg logo',
  `_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dao_id`),
  UNIQUE KEY `block_num` (`block_num`)
) 

-- svg logo 改变记录表
CREATE TABLE `t_changelogo` (
  `dao_id` INT NOT NULL COMMENT 'dao id',
  `block_num` BIGINT NOT NULL COMMENT '区块号',
  `dao_time` INT DEFAULT NULL COMMENT '时间戳',
  `dao_logo` TEXT COMMENT 'svg logo',
  `_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dao_id`),
  UNIQUE KEY `block_num` (`block_num`)
)

-- os记录表
CREATE TABLE `t_os` (
  `dao_id` INT NOT NULL COMMENT 'dao id',
  `block_num` BIGINT NOT NULL COMMENT '区块号',
  `os_address` VARCHAR(128)  DEFAULT NULL COMMENT 'os 地址',
  `_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dao_id`),
  UNIQUE KEY `block_num` (`block_num`)
) 

-- logo 设置表（首次设置）
CREATE TABLE `t_setlogo` (
  `dao_id` INT NOT NULL COMMENT 'dao id',
  `block_num` BIGINT NOT NULL COMMENT '区块号',
  `dao_time` INT DEFAULT NULL COMMENT '时间戳',
  `dao_logo` TEXT  COMMENT 'svg图片',
  `_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dao_id`),
  UNIQUE KEY `block_num` (`block_num`)
) 

-- 视图

CREATE  VIEW `v_dao` AS 
SELECT
  `a`.`dao_id`      AS `dao_id`,
  `a`.`block_num`   AS `block_num`,
  `a`.`dao_name`    AS `dao_name`,
  `a`.`dao_symbol`  AS `dao_symbol`,
  `a`.`dao_dsc`     AS `dao_dsc`,
  DATE_FORMAT(FROM_UNIXTIME(`a`.`dao_time`),'%Y-%m-%d') AS `dao_time`,
  `a`.`dao_manager` AS `dao_manager`,
  `a`.`dao_logo`    AS `dao_logo`,
  `a`.`_time`       AS `_time`,
  `d`.`dao_id`      AS `logodao_id`,
  `b`.`os_address`  AS `os_address`,
  `c`.`token_id`    AS `token_id`
FROM (((`t_dao` `a`
     LEFT JOIN `t_os` `b`
       ON ((`a`.`dao_id` = `b`.`dao_id`)))
    LEFT JOIN `t_token` `c`
      ON ((`a`.`dao_id` = `c`.`dao_id`)))
   LEFT JOIN `t_setlogo` `d`
     ON ((`a`.`dao_id` = `d`.`dao_id`)))


-- 触发器


CREATE TRIGGER `changeLogotrigger` AFTER INSERT ON `t_changelogo` 
    FOR EACH ROW BEGIN
	UPDATE t_dao SET dao_logo=new.dao_logo WHERE dao_id=new.dao_id;
    END;
    
  
CREATE TRIGGER `setLogotrigger` AFTER INSERT ON `t_setlogo` 
    FOR EACH ROW BEGIN
	UPDATE t_dao SET dao_logo=new.dao_logo WHERE dao_id=new.dao_id;
    END;