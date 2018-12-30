CREATE SCHEMA `canal_manager` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE `canal_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE `canal_instance_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

INSERT INTO `canal_config` VALUES ('1', 'canal.properties', '#################################################\r\n######### 		common argument		############# \r\n#################################################\r\n#canal.manager.jdbc.url=jdbc:mysql://127.0.0.1:3306/canal_manager?useUnicode=true&characterEncoding=UTF-8\r\n#canal.manager.jdbc.username=root\r\n#canal.manager.jdbc.password=121212\r\ncanal.id = 1\r\ncanal.ip =\r\ncanal.port = 11111\r\ncanal.metrics.pull.port = 11112\r\ncanal.zkServers =\r\n# flush data to zk\r\ncanal.zookeeper.flush.period = 1000\r\ncanal.withoutNetty = false\r\n# tcp, kafka, RocketMQ\r\ncanal.serverMode = tcp\r\n# flush meta cursor/parse position to file\r\ncanal.file.data.dir = ${canal.conf.dir}\r\ncanal.file.flush.period = 1000\r\n## memory store RingBuffer size, should be Math.pow(2,n)\r\ncanal.instance.memory.buffer.size = 16384\r\n## memory store RingBuffer used memory unit size , default 1kb\r\ncanal.instance.memory.buffer.memunit = 1024 \r\n## meory store gets mode used MEMSIZE or ITEMSIZE\r\ncanal.instance.memory.batch.mode = MEMSIZE\r\ncanal.instance.memory.rawEntry = true\r\n\r\n## detecing config\r\ncanal.instance.detecting.enable = false\r\n#canal.instance.detecting.sql = insert into retl.xdual values(1,now()) on duplicate key update x=now()\r\ncanal.instance.detecting.sql = select 1\r\ncanal.instance.detecting.interval.time = 3\r\ncanal.instance.detecting.retry.threshold = 3\r\ncanal.instance.detecting.heartbeatHaEnable = false\r\n\r\n# support maximum transaction size, more than the size of the transaction will be cut into multiple transactions delivery\r\ncanal.instance.transaction.size =  1024\r\n# mysql fallback connected to new master should fallback times\r\ncanal.instance.fallbackIntervalInSeconds = 60\r\n\r\n# network config\r\ncanal.instance.network.receiveBufferSize = 16384\r\ncanal.instance.network.sendBufferSize = 16384\r\ncanal.instance.network.soTimeout = 30\r\n\r\n# binlog filter config\r\ncanal.instance.filter.druid.ddl = true\r\ncanal.instance.filter.query.dcl = false\r\ncanal.instance.filter.query.dml = false\r\ncanal.instance.filter.query.ddl = false\r\ncanal.instance.filter.table.error = false\r\ncanal.instance.filter.rows = false\r\ncanal.instance.filter.transaction.entry = false\r\n\r\n# binlog format/image check\r\ncanal.instance.binlog.format = ROW,STATEMENT,MIXED \r\ncanal.instance.binlog.image = FULL,MINIMAL,NOBLOB\r\n\r\n# binlog ddl isolation\r\ncanal.instance.get.ddl.isolation = false\r\n\r\n# parallel parser config\r\ncanal.instance.parser.parallel = true\r\n## concurrent thread number, default 60% available processors, suggest not to exceed Runtime.getRuntime().availableProcessors()\r\n#canal.instance.parser.parallelThreadSize = 16\r\n## disruptor ringbuffer size, must be power of 2\r\ncanal.instance.parser.parallelBufferSize = 256\r\n\r\n# table meta tsdb info\r\ncanal.instance.tsdb.enable = true\r\ncanal.instance.tsdb.dir = ${canal.file.data.dir:../conf}/${canal.instance.destination:}\r\ncanal.instance.tsdb.url = jdbc:h2:${canal.instance.tsdb.dir}/h2;CACHE_SIZE=1000;MODE=MYSQL;\r\ncanal.instance.tsdb.dbUsername = canal\r\ncanal.instance.tsdb.dbPassword = canal\r\n# dump snapshot interval, default 24 hour\r\ncanal.instance.tsdb.snapshot.interval = 24\r\n# purge snapshot expire , default 360 hour(15 days)\r\ncanal.instance.tsdb.snapshot.expire = 360\r\n\r\n# aliyun ak/sk , support rds/mq\r\ncanal.aliyun.accesskey =\r\ncanal.aliyun.secretkey =\r\n\r\n#################################################\r\n######### 		destinations		############# \r\n#################################################\r\ncanal.destinations = example\r\n# conf root dir\r\ncanal.conf.dir = ../conf\r\n# auto scan instance dir add/remove and start/stop instance\r\ncanal.auto.scan = true\r\ncanal.auto.scan.interval = 5\r\n\r\ncanal.instance.tsdb.spring.xml = classpath:spring/tsdb/h2-tsdb.xml\r\n#canal.instance.tsdb.spring.xml = classpath:spring/tsdb/mysql-tsdb.xml\r\n\r\ncanal.instance.global.mode = spring\r\ncanal.instance.global.lazy = false\r\n#canal.instance.global.manager.address = 127.0.0.1:1099\r\n#canal.instance.global.spring.xml = classpath:spring/memory-instance.xml\r\ncanal.instance.global.spring.xml = classpath:spring/file-instance.xml\r\n#canal.instance.global.spring.xml = classpath:spring/default-instance.xml\r\n\r\n##################################################\r\n######### 		     MQ 		     #############\r\n##################################################\r\ncanal.mq.servers = 127.0.0.1:6667\r\ncanal.mq.retries = 0\r\ncanal.mq.batchSize = 16384\r\ncanal.mq.maxRequestSize = 1048576\r\ncanal.mq.lingerMs = 1\r\ncanal.mq.bufferMemory = 33554432\r\ncanal.mq.canalBatchSize = 50\r\ncanal.mq.canalGetTimeout = 100\r\ncanal.mq.flatMessage = true\r\ncanal.mq.compressionType = none\r\ncanal.mq.acks = all\r\n', '2018-12-30 16:46:00');

INSERT INTO `canal_instance_config` VALUES ('1', 'example', '#################################################\r\n## mysql serverId , v1.0.26+ will autoGen\r\n# canal.instance.mysql.slaveId=0\r\n\r\n# enable gtid use true/false\r\ncanal.instance.gtidon=false\r\n\r\n# position info\r\ncanal.instance.master.address=127.0.0.1:3306\r\ncanal.instance.master.journal.name=\r\ncanal.instance.master.position=\r\ncanal.instance.master.timestamp=\r\ncanal.instance.master.gtid=\r\n\r\n# rds oss binlog\r\ncanal.instance.rds.accesskey=\r\ncanal.instance.rds.secretkey=\r\ncanal.instance.rds.instanceId=\r\n\r\n# table meta tsdb info\r\ncanal.instance.tsdb.enable=true\r\n#canal.instance.tsdb.url=jdbc:mysql://127.0.0.1:3306/canal_tsdb\r\n#canal.instance.tsdb.dbUsername=canal\r\n#canal.instance.tsdb.dbPassword=canal\r\n\r\n#canal.instance.standby.address =\r\n#canal.instance.standby.journal.name =\r\n#canal.instance.standby.position =\r\n#canal.instance.standby.timestamp =\r\n#canal.instance.standby.gtid=\r\n\r\n# username/password\r\ncanal.instance.dbUsername=canal\r\ncanal.instance.dbPassword=canal\r\ncanal.instance.connectionCharset = UTF-8\r\ncanal.instance.defaultDatabaseName =test\r\n# enable druid Decrypt database password\r\ncanal.instance.enableDruid=false\r\n#canal.instance.pwdPublicKey=MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALK4BUxdDltRRE5/zXpVEVPUgunvscYFtEip3pmLlhrWpacX7y7GCMo2/JM6LeHmiiNdH1FWgGCpUfircSwlWKUCAwEAAQ==\r\n\r\n# table regex\r\ncanal.instance.filter.regex=.*\\\\..*\r\n# table black regex\r\ncanal.instance.filter.black.regex=\r\n\r\n# mq config\r\ncanal.mq.topic=example\r\n# 动态topic, 需mq支持动态创建topic\r\n#canal.mq.dynamicTopic=.*,mytest\\\\..*,mytest2.user\r\ncanal.mq.partition=0\r\n# hash partition config\r\n#canal.mq.partitionsNum=3\r\n#canal.mq.partitionHash=test.table:id^name,.*\\\\..*\r\n#################################################\r\n', '2018-12-30 16:46:16');