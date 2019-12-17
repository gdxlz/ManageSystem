/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : second-hand

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2019-12-17 10:33:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '佛大管理员', '123', '000');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  PRIMARY KEY (`collect_id`),
  KEY `user_id` (`user_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tab_user` (`uid`),
  CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('3', '18', '1');
INSERT INTO `collect` VALUES ('4', '20', '2');
INSERT INTO `collect` VALUES ('12', '18', '21');
INSERT INTO `collect` VALUES ('15', '17', '121');
INSERT INTO `collect` VALUES ('16', '17', '1');
INSERT INTO `collect` VALUES ('18', '17', '32');
INSERT INTO `collect` VALUES ('19', '17', '92');
INSERT INTO `collect` VALUES ('20', '17', '105');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `catelog` varchar(20) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`good_id`),
  KEY `userId` (`user_id`),
  CONSTRAINT `good_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tab_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', 'u盘', '17', '55.00', '32GB内存，刚使用1年', '电子产品', '1');
INSERT INTO `good` VALUES ('2', '洗发水', '20', '40.00', '正品阿道夫800ml', '生活用品', '0');
INSERT INTO `good` VALUES ('3', '吹风机', '24', '80.00', '静音大功率', '家电', '0');
INSERT INTO `good` VALUES ('4', '食用油', '26', '30.00', '金龙鱼', '食品', '0');
INSERT INTO `good` VALUES ('5', '口红', '22', '100.00', '阿玛尼', '生活用品', '0');
INSERT INTO `good` VALUES ('6', '洗面奶', '20', '60.00', '雅诗兰黛', '生活用品', '0');
INSERT INTO `good` VALUES ('7', '手机', '17', '1900.00', '荣耀20', '电子产品', '1');
INSERT INTO `good` VALUES ('8', '鼠标', '18', '70.00', '机械键盘配套', '电子产品', '2');
INSERT INTO `good` VALUES ('9', '书包', '27', '50.00', '蓝色小书包', '生活用品', '0');
INSERT INTO `good` VALUES ('10', '钢笔', '17', '10.00', '英雄牌钢笔', '生活用品', '2');
INSERT INTO `good` VALUES ('13', '沙滩照片', '17', '22.00', '这是一张沙滩照片', '生活用品', '2');
INSERT INTO `good` VALUES ('20', '电脑', '18', '3000.00', '低价出售，先到先得', '电子产品', '0');
INSERT INTO `good` VALUES ('21', '电脑', '17', '2000.00', '筆記本電腦', '电子产品', '1');
INSERT INTO `good` VALUES ('22', '编译原理', '18', '20.00', '编译原理资料，附加一份学习笔记', '旧书', '0');
INSERT INTO `good` VALUES ('23', '羽绒服', '18', '50.00', '一年前买的，现在长胖穿不下，低价出售', '服装', '0');
INSERT INTO `good` VALUES ('24', '爱国者电子出品充电宝', '17', '51.00', 'OL10400 双USB输出 10000毫安时 通用便携迷你 移动电源', '电子产品', '1');
INSERT INTO `good` VALUES ('25', '莫杰雏菊女士香水50ml', '20', '389.00', '很好用，买了新的，旧的低价售出', '生活用品', '0');
INSERT INTO `good` VALUES ('26', '小熊Bear电煮锅单人火锅', '24', '189.00', '分体式煮面锅蒸煮多用锅1.2L', '家电', '0');
INSERT INTO `good` VALUES ('27', '卡通小风扇', '26', '34.80', '宿舍迷你小风扇', '家电', '0');
INSERT INTO `good` VALUES ('28', '雅邦（ALOBON）深层滋润口红3.8g', '22', '9.90', '深度滋养恒久保湿玄色闪亮', '生活用品', '0');
INSERT INTO `good` VALUES ('29', '自然堂(CHANDO)水润保湿柔肤水135ml', '20', '60.00', '女士爽肤水保湿水补水保湿提拉紧致柔嫩细滑长效锁水细致', '生活用品', '0');
INSERT INTO `good` VALUES ('30', '【超级爆品】荣耀10青春版', '17', '999.00', '幻彩渐变 2400万AI自拍 全网通版4GB+64GB 渐变蓝 移动联通', '电子产品', '2');
INSERT INTO `good` VALUES ('31', '【二手95新】佳能5d3 5d4 6d2单机身套机单反相机', '18', '3180.00', '高清旅游专业级摄影全画幅 成色优质 官方标配', '电子产品', '1');
INSERT INTO `good` VALUES ('32', '算法设计与分析', '27', '40.40', '源于南京大学“算法设计与分析”课程教学实践，主要面向计算机专业本科生，以及其他需要学习计算机科学基本知识与了解计算机程序设计背后原理的读者', '旧书', '0');
INSERT INTO `good` VALUES ('33', '文曦中性笔大学生考试专用', '17', '18.60', '网红中性笔可爱创意签字笔水笔芯0.38mm', '旧书', '2');
INSERT INTO `good` VALUES ('34', '眼影盘16色', '17', '29.00', '初学者套装', '生活用品', '1');
INSERT INTO `good` VALUES ('36', '裤子', '17', '120.00', '这是一条能让你变好看的裤子', '服装', '2');
INSERT INTO `good` VALUES ('42', '巧克力', '17', '200.00', '好吃，真的好吃', '食品', '1');
INSERT INTO `good` VALUES ('43', '牛奶', '17', '60.00', '还有20瓶', '食品', '2');
INSERT INTO `good` VALUES ('44', '饼干', '17', '20.00', '泰国进口椰子饼干', '食品', '0');
INSERT INTO `good` VALUES ('45', '洗衣机', '17', '500.00', '用了两年，低价售出', '家电', '2');
INSERT INTO `good` VALUES ('46', '衬衫', '17', '60.00', '程序员标配', '服装', '2');
INSERT INTO `good` VALUES ('48', '运动鞋', '17', '150.00', '43码耐克球鞋，9成新', '服装', '9');
INSERT INTO `good` VALUES ('50', '牛仔裤', '17', '99.00', 'XL码 男装牛仔裤', '服装', '9');
INSERT INTO `good` VALUES ('51', '帽子', '17', '30.00', '冬季保暖', '服装', '1');
INSERT INTO `good` VALUES ('52', '围巾', '17', '50.00', '过冬专用', '服装', '9');
INSERT INTO `good` VALUES ('54', '眼影盘16色沙漠玫瑰眼影闪粉亮片单色刷棒盒大地色大理石懒人眼影哑光橘朵衰败初学者套装', '17', '29.00', '初学者套装', '生活用品', '0');
INSERT INTO `good` VALUES ('55', '华为 HUAWEI Mate 30 Pro 麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄', '17', '5799.00', '【10.21-11.11享全程价保】麒麟990，40W快充，双4000W徕卡四摄，超曲面环幕屏；mate30现货抢购》', '电子产品', '2');
INSERT INTO `good` VALUES ('56', 'HLA海澜之家净色简约短袖T恤2019夏季圆领绣标款短T男HNTBJ2R141A 米白E1 185/', '17', '58.00', '10月23日-10月25日，限量开抢满1000送600！预售火爆开启，定金膨胀高至10倍，尾款领券再享优惠', '服装', '1');
INSERT INTO `good` VALUES ('57', '【新东方旗舰】备战2019大学英语四级词汇 口袋书4级乱序便携版 四级词汇词根+联想记忆法绿宝', '17', '24.00', '【新东方旗舰】备战2019大学英语四级词汇 口袋书4级乱序便携版 四级词汇词根+联想记忆法绿宝', '旧书', '0');
INSERT INTO `good` VALUES ('58', '萌朵丽啦肖战王一博同款衣服潮牌连帽卫衣女百搭韩版春秋薄款男女外套班服工作服定制 白色 L(建议95-', '17', '138.00', '新潮秋季焕新，满168减10，满288减30，默认京东物流配送，，如需加绒款请联系客服，或者下单留言备注加绒款，标价是一件衣服价格，买2件请分别加入购物车', '服装', '1');
INSERT INTO `good` VALUES ('59', '宏碁Acer【官方旗舰店】宏基 暗影骑士3 15.6英寸酷睿i7学生吃鸡游戏办公手提便携笔记本电脑 ', '17', '6999.00', '【京东秒杀24小时：抢劵减600,爆款版:6379】【发烧级GTX1060-6G】【i7六核心】【IPS高清屏】', '电子产品', '2');
INSERT INTO `good` VALUES ('60', '华为笔记本MateBook E 2019款12英寸PC平板二合一轻薄本商务超极本办公手提笔记本电脑 ', '17', '4688.00', '【新品钜惠】Linux版MateBook13~i5+8G+512G低至￥5399 【购机即送】U盘+保护膜+3期免息~晒单送蓝牙鼠标 【现货速发】', '电子产品', '2');
INSERT INTO `good` VALUES ('61', '韩国进口 AHC 升级版第六代眼霜 30ml/支 改善细纹 提拉紧致 嫩莹眼周', '17', '99.00', '【福利】全球好物京选，低至5折任你挑 【攻略】年终狂欢，京喜价到，买好物无需犹豫', '生活用品', '0');
INSERT INTO `good` VALUES ('62', '美梵林连衣裙女夏中长款雪纺显瘦波西米亚巴厘岛2018新款V领海边度假裙子A沙滩裙 红色 3XL', '17', '149.00', '6.18期间特惠促销原169元现149元', '服装', '1');
INSERT INTO `good` VALUES ('63', '【二手95新】佳能/Canon 60D 70D 80D 18-55 18-135数码单反相机套机 6', '17', '4999.00', '尊敬的用户您好，国庆期间1号到7号暂时不做发货安排，如有特殊情况请联系客服。祝大家国庆快乐，阖家幸福！', '电子产品', '1');
INSERT INTO `good` VALUES ('64', '膜法世家 吸黑焕白补水嫩肤面膜贴21片装 (水润丝滑 美白保湿面膜女男士 周冬雨同款）', '17', '109.00', '#膜法世家，双十一提前放价#周冬雨力推荐黑面膜套装，三大膜法，循环养护，两件5折，到手54.5，速度进店，悦享美丽膜法！', '生活用品', '0');
INSERT INTO `good` VALUES ('65', '陪你到世界之巅王一博同款衣服2019新款卫衣男女潮韩版薄款GD003 黑色 L', '17', '118.00', '全店商品领卷满190减10/299减20，赶紧放肆抢购吧~标价是一件衣服价格，购买男女两件需要分开加入购物车然后在一起结算', '服装', '0');
INSERT INTO `good` VALUES ('66', '雅诗兰黛 Estee Lauder 新版ANR特润修护精华眼霜 15ml', '17', '365.00', '眼霜这东西，用了没啥感觉。不用的话，就有深刻的感觉了！新款抗蓝光眼霜了解一下', '生活用品', '0');
INSERT INTO `good` VALUES ('67', '兰蔻', '17', '220.00', '【自营品质，正品保证】', '生活用品', '0');
INSERT INTO `good` VALUES ('68', '九阳(Joyoung)电磁炉 电陶炉 家用火锅套装 电池炉 大功率 旋转控温 红外光波加热 H22-', '17', '229.00', '【无需预约，现在购买价保11.11】到手价206.1，单件享9折！限量500台！超值低价！优惠享不停！火力全开，低辐射不挑锅，超大直径线盘', '家电', '1');
INSERT INTO `good` VALUES ('69', '长虹小电煮锅家用宿舍锅迷你煮面锅小型多功能电热锅学生电火锅1-2人电锅寝室神器锅子小锅功率 绿色', '18', '69.90', '长虹小电煮锅家用宿舍锅迷你煮面锅小型多功能电热锅学生电火锅1-2人电锅寝室神器锅子小锅功率 绿色', '家电', '0');
INSERT INTO `good` VALUES ('70', '罗马仕招财猫手机充电宝10000毫安大容量移动电源双USB输出超薄可爱迷你小巧华为苹果通用便携 招财', '18', '59.00', '10月18日-10月31日罗马仕京东11.11狂欢预售，预定享定金膨胀，前100名预定免定金，预售好货低过京东11.11', '电子产品', '0');
INSERT INTO `good` VALUES ('71', 'Apple iPhone 7 (A1660) 128G 金色 移动联通电信4G手机', '18', '2999.00', '【11.11预热启动，多款新品套装预售享优惠】iPhone新品全新升级超广角摄像头，捕捉更多美。点此查看活动！\r\n勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无', '电子产品', '0');
INSERT INTO `good` VALUES ('72', '植美村ZMC 牛油果幼龄眼霜20g 电动眼霜按摩仪 淡化黑眼圈 舒缓眼袋 抗皱去细纹', '18', '98.00', '【11.11底价无秘密】平价套装2件75折，爆品低至第二件0元，更多好礼送不停', '生活用品', '2');
INSERT INTO `good` VALUES ('73', '御泥坊 水嫩蜂蜜面膜贴20片（补水面膜女 深层保湿锁水 舒缓修护淡化细纹抬头纹 护肤化妆品套装）', '18', '129.90', '【【限时买2立减100元，加赠安瓶精华液】天然蜂蜜精粹滋养肌肤，补足水分，敷出水润美肌~马上抢', '生活用品', '0');
INSERT INTO `good` VALUES ('74', '一叶子美白补水面膜 晶透焕颜醒肤礼盒21片（美白淡斑 祛除暗黄去黑色素 保湿舒缓修护 男女士护肤品套', '18', '169.00', '【11.11钜献盛惠，抢鲜至上】【加送面膜3片】一叶子爆款面膜，深层滋养肌肤，提亮肤色，还你水润少女肌！', '生活用品', '1');
INSERT INTO `good` VALUES ('75', '富贵鸟加绒长袖衬衫男2019秋冬新款青年商务休闲修身免烫抗皱纯色七分袖衬衣上衣男装 灰色（长袖） L', '18', '119.00', '长袖、加绒、七分袖可选，品质保证，七天无理由退换货，赠送运费险，让您购物无忧', '服装', '0');
INSERT INTO `good` VALUES ('76', '联想小新14性能版 2019款14英寸新8代酷睿窄边框全面屏青春超轻薄笔记本电脑手提超薄本商务办公本', '18', '3849.00', '【新人气爆款，国民轻薄本】高颜值实力派，第八代酷睿增强版，可支持双硬盘扩展，三面窄边框全面屏，1.55KG轻薄金属机身', '电子产品', '0');
INSERT INTO `good` VALUES ('77', '四川红心猕猴桃 精品大果 蒲江水果 京东生鲜 奇异果 24粒 单果90-110g 优质大果', '18', '67.70', '【坏果包赔】产地现摘现发，新鲜有保证，坏果包赔 【品质好果】优选精品果，营养丰富，老少皆宜 【京东生鲜】严实包装，优选快时效物流，优鲜到家', '食品', '0');
INSERT INTO `good` VALUES ('78', '海南精选红心木瓜 2个装 单果重约800-1000g 新鲜水果', '18', '23.90', '海南精选红心木瓜 2个装 单果重约800-1000g 新鲜水果', '食品', '0');
INSERT INTO `good` VALUES ('79', 'JMsolution肌司研海洋珍珠保湿面膜三部曲30g*10片（JM面膜 韩国原装进口 三步锁水 肌', '18', '55.00', '此商品将于2019-10-26,10点结束闪购特卖，', '生活用品', '0');
INSERT INTO `good` VALUES ('80', 'Apple 2019款 MacBook Pro 13.3【带触控栏】八代i5 8G 256G RP6', '18', '10699.00', '【10月精选】19年款MacBookAir低至8499，19年款MacBookPro低至9399！', '电子产品', '0');
INSERT INTO `good` VALUES ('81', '佳能（Canon）EOS 200D II 200D2 迷你单反相机 数码相机（EF-S18-55mm', '39', '4199.00', '【双十一来临，狂欢预热！】一镜走天下，指哪打哪儿。Expeed5处理器，8张/秒连拍，4K视频，翻转触摸屏', '电子产品', '0');
INSERT INTO `good` VALUES ('82', '数据库系统概论（第5版）', '39', '30.90', '50册以上团购优惠 联系电话010-89113804', '旧书', '0');
INSERT INTO `good` VALUES ('83', '零翼 毛衣女2019秋冬新款韩版宽松学生针织衫女套头卫衣百搭时尚长袖两件套装打底衫大码冬季女装上衣女', '39', '98.00', '零翼 毛衣女2019秋冬新款韩版宽松学生针织衫女套头卫衣百搭时尚长袖两件套装打底衫大码冬季女装上衣女', '服装', '1');
INSERT INTO `good` VALUES ('84', '风扇卡通小电风扇迷你学生宿舍床上台式办公室静音家用插电可爱小风扇 长鼻猪 自带线1.5米', '39', '38.80', '【赠运费险】迷你卡通、两档调节、', '家电', '0');
INSERT INTO `good` VALUES ('85', '小火锅锅具一人火锅单人电火锅1-2人3-4电火锅单人速食小型电锅单人锅火锅锅具 加厚22cm黄色 带', '20', '93.00', '一切商品尺寸型号以及运费问题，请咨询客服，本店赠送运费险，请您放心购买！！', '家电', '0');
INSERT INTO `good` VALUES ('86', '士力架 花生夹心巧克力（全家桶）礼物送女友 休闲零食员工福利 生日糖果460g （新旧包装随机发放）', '20', '28.90', '双十一狂欢大节倒计时，德芙丝滑浓巧，伴您甜蜜嗨购，10月26-31号德芙部分满199减25！甜巧伴你狂欢，纵享钜惠惊喜', '食品', '0');
INSERT INTO `good` VALUES ('87', '高姿COGI星颜匀净气垫CC霜15g+15g替换装 气垫bb霜 粉底液 底妆裸妆 保湿遮瑕 提亮肤色', '20', '129.00', '【新品首发】高姿太空仓精华，深层修护肌肤润透亮，高活性虾青素+二裂酵母，一键解锁留住真鲜活，28天见证光鲜。', '生活用品', '0');
INSERT INTO `good` VALUES ('88', '雅仕潮品裙子外搭小外套百搭开衫仙女防晒衣短款薄款系带配吊带裙披肩夏季 图片色 均码', '20', '78.00', '雅仕潮品裙子外搭小外套百搭开衫仙女防晒衣短款薄款系带配吊带裙披肩夏季 图片色 均码', '服装', '0');
INSERT INTO `good` VALUES ('89', '姥桥 毛呢大衣女中长款2019秋冬新款韩版系带收腰时尚气质宽松显瘦呢子外套 雾霾蓝 M', '39', '178.00', '姥桥 毛呢大衣女中长款2019秋冬新款韩版系带收腰时尚气质宽松显瘦呢子外套 雾霾蓝 M', '服装', '0');
INSERT INTO `good` VALUES ('90', '迷你家用煮面蒸笼锅插电锅多功能火锅办公室电煮锅小型2单人1不粘抖音同款打火锅的锅 米粉色不粘锅', '39', '104.00', '私人定制--专属定制--领劵下单', '家电', '0');
INSERT INTO `good` VALUES ('91', 'SOLOVE素乐 充电宝10000毫安自带线移动电源超薄小巧苹果充电宝快充手机小米华为vivo通用 ', '39', '119.00', '自带线更便携，安卓/苹果双版本', '电子产品', '0');
INSERT INTO `good` VALUES ('92', 'vivo X27 8GB+128GB大内存 印象夏日 4800万AI三摄全面屏拍照手机 移动联通电信', '39', '2698.00', '【10.19-11.30全程价保，白条12期免息+赠半年延保】4800万广角夜景三摄，升降摄像头，4000mAh大电池！', '电子产品', '0');
INSERT INTO `good` VALUES ('93', 'OPPO A11 5000mAh大电池 AI四摄 视频防抖 4GB+128GB 湖光绿 全网通4G ', '39', '1499.00', '10.18-11.11双十一全程价保！【3期免息+赠耳机】5000mAh大电池，AI四摄，视频防抖。', '电子产品', '1');
INSERT INTO `good` VALUES ('94', '村上春树：挪威的森林（30周年纪念版）（2018版） [ノルウエイの森]', '39', '38.00', '村上春树的残酷青春物语，现象级的超级畅销书，纪念《挪威的森林》问世30周年', '旧书', '0');
INSERT INTO `good` VALUES ('95', 'Spring 5核心原理与30个类手写实战', '39', '112.00', '十年沉淀之作，手写Spring精华思想，21万+学员听过在线课，超强实战技术升级指南，囊括源码、设计思想、架构思维、实战案例、开发经验，Java架构师成长必备', '旧书', '0');
INSERT INTO `good` VALUES ('96', 'fkassc 潮牌陪你到世界之巅王一博同款衣服卫衣男女情侣外套潮ins宽松韩版春秋薄款 拼色 L', '39', '168.00', '秋冬上新，全场2件9折，下单送短袖。支持七天无理由，赠送运费险', '服装', '0');
INSERT INTO `good` VALUES ('97', '摆渡人　【荐书联盟推荐】 [Ferryman]', '39', '34.00', '金融博物馆书院倾情推荐！或许，命运就是一条孤独的河流，我们都会遇见灵魂的摆渡人。畅销欧美33个国家，荣获多项图书大奖。如果命运是一条孤独的河流，谁会是你灵魂的摆渡人？如果我真的存在，也是因为你需要我。', '旧书', '0');
INSERT INTO `good` VALUES ('98', '新大纲+最新真题：大学英语六级听力通关必做800题（改革版）', '39', '30.40', '讲座讲话听力新题型100题，新题型全真模拟试卷4套，听力改革新题型音频资料,名师英语六级快速提高班授课视频，四六级英语专家指导手册（含四六级写作高分必背模板、高分冲刺模拟题、通关必备高频词汇等）', '旧书', '0');
INSERT INTO `good` VALUES ('99', '默莉 连衣裙套装女2019秋季新款女装吊带长裙时尚短外套两件套网纱连衣裙M811 杏色 M', '39', '158.00', '默莉 连衣裙套装女2019秋季新款女装吊带长裙时尚短外套两件套网纱连衣裙M811 杏色 M', '服装', '0');
INSERT INTO `good` VALUES ('100', '朗悦女装 长袖衬衫女2019秋季新款韩版宽松衬衣V领雪纺衫 LWCC187130 白色 M', '39', '99.00', '秋冬大促1件5折', '服装', '0');
INSERT INTO `good` VALUES ('101', '御泥坊 晶亮红石榴面膜贴 21片装（补水面膜女 舒缓修护提亮 玻尿酸 男女化妆护肤品套装）', '39', '139.90', '【限时买2立减100元！】精选红石榴精粹，有效抵御外界氧化伤害，改善黯哑肌！马上抢', '生活用品', '0');
INSERT INTO `good` VALUES ('102', '戴尔灵越13 7000 13.3英寸英特尔酷睿i5超级轻薄窄边笔记本电脑(i5-10210U 8G ', '39', '5999.00', '【预售开启,预定享惊爆价】轻一代,羽感合金本,全新十代处理器,轻至0.955KG镁合金机身,高性能固态硬盘,窄边框,背光键盘,指纹识别,智能温控', '电子产品', '0');
INSERT INTO `good` VALUES ('103', '古莱登 夹克男皮衣外套2019秋冬季新品男士休闲韩版上衣工装外套男装青年男生棒球服学生潮 黑色 L', '39', '158.00', '新品上市，品质保证，支持七天无理由退换货，退换无忧！', '服装', '2');
INSERT INTO `good` VALUES ('104', '新东方 大学英语六级考试历年真题精解（备战2017年6月六级考试 附MP3）', '34', '34.20', '新东方试卷帮你搞定新听力，决胜四六级——备战2017年6月六级考试，收录多题多卷，精解历年真题，紧跟改革趋势，完美攻克六级！', '旧书', '0');
INSERT INTO `good` VALUES ('105', '三只松鼠芒果干 蜜饯果干芒果片休闲零食办公室小吃果脯水果干116g/袋', '34', '9.90', '【三只松鼠·松鼠抢鲜购】自营极速送达！前3000份两件减3元，三件减5元', '食品', '0');
INSERT INTO `good` VALUES ('106', '奥利奥（Oreo）早餐休闲蛋糕糕点零食大礼包 夹心饼干原味349g', '34', '10.80', '奥利奥（Oreo）早餐休闲蛋糕糕点零食大礼包 夹心饼干原味349g', '食品', '1');
INSERT INTO `good` VALUES ('107', '创晟 泰国进口金枕头榴莲水果京东生鲜约2.5-3.5kg', '17', '166.00', '高山红富士苹果现摘现发粒粒甄选', '食品', '2');
INSERT INTO `good` VALUES ('108', '岩焗乳酪吐司手撕夹心小面包网红小吃休闲零食礼盒500g', '17', '20.00', '【包邮】【前2000件限时秒杀到手价29.9】', '食品', '2');
INSERT INTO `good` VALUES ('109', 'SK-II大眼眼霜15g护肤套装化妆品礼盒（赠神仙水）SK2眼部精华 补水保湿 去黑眼圈眼袋去细纹', '17', '590.00', '【11.11星品提前购】美，无需等待！限时加赠79元一件礼！立即抢购', '生活用品', '1');
INSERT INTO `good` VALUES ('110', '进口牛油果 6个装 单果重约130-180g 自营生鲜水果', '17', '29.90', '【生命之果】【自营冷链全程保鲜】新一代网红爆款，富含不饱和脂肪酸的轻食之选，来自南美的生命之果', '食品', '1');
INSERT INTO `good` VALUES ('111', '眼影盘16色沙漠玫瑰眼影闪粉亮片单色刷棒盒大地色大理石懒人眼影哑光橘朵衰败初学者套装', '17', '29.00', '眼影盘16色沙漠玫瑰眼影闪粉亮片单色刷棒盒大地色大理石懒人眼影哑光橘朵衰败初学者套装', '生活用品', '2');
INSERT INTO `good` VALUES ('112', '深度学习 [deep learning]', '17', '164.00', 'AI圣经，deeplearning中文版，2018年图灵奖获奖者作品，业内人称“花书”，人工智能机器学习深度学习领域奠基性经典畅销书', '旧书', '1');
INSERT INTO `good` VALUES ('113', '安娜苏(Anna sui)星彩唇膏401 3g魅力红(唇蜜 唇釉 口红)', '17', '199.00', '此商品将于2019-10-26,10点结束闪购特卖', '生活用品', '2');
INSERT INTO `good` VALUES ('114', '得力(deli)4本A5/60张乐素系列笔记本记事本线圈本螺旋软抄本子LA560-01JY ', '17', '15.00', '乐素系列，素净优雅；70g米黄纸内芯，书写流畅，不易渗透；双圈装订工艺，轻松平摊', '生活用品', '1');
INSERT INTO `good` VALUES ('115', '迪奥（Dior） Dior迪奥口红魅惑粉漾润唇膏3.5g 变色唇膏口红 保湿滋润烈艳蓝金 001浅粉', '17', '198.00', '迪奥（Dior） Dior迪奥口红魅惑粉漾润唇膏3.5g 变色唇膏口红 保湿滋润烈艳蓝金 001浅粉', '生活用品', '2');
INSERT INTO `good` VALUES ('116', '玉兰油OLAY护肤套装博研诗Prox纯白方程式亮洁皙颜护肤品礼盒3件套(淡斑小白瓶精华液+面霜+爽肤', '17', '339.00', '【11.11抢先购】买即送小白瓶面膜*3，买2加赠正装精粹油，赠品以结算页面为准，赠品赠完即止', '生活用品', '1');
INSERT INTO `good` VALUES ('117', 'WIS极润保湿面膜组合套装（玻尿酸面膜24片+洗面奶+爽肤水+乳液+面霜）补水保湿精华 男女护肤品套', '39', '238.00', '【关注店铺领取优惠券】满179-10元 【11.11预售开启】冬季焕肤，爆款面膜预付买二送二', '生活用品', '0');
INSERT INTO `good` VALUES ('118', 'SIN.CYC 简约轻奢女装挂脖碎花连衣裙2019夏季新款小心机蝴蝶结无袖露肩仙女裙海边显瘦度假裙子', '39', '399.00', 'SIN.CYC 简约轻奢女装挂脖碎花连衣裙2019夏季新款小心机蝴蝶结无袖露肩仙女裙海边显瘦度假裙子', '服装', '0');
INSERT INTO `good` VALUES ('119', '英雄（HERO）1520 黑色绒砂多彩细尖铱金钢笔 签字笔 男女款办公礼品墨水礼盒套装', '39', '129.00', '【11.11预热狂欢】好物节狂欢预热！10月22至10月31日，英雄精品文具送豪礼，119-30，199-60，一年囤货好时机，遇见不错过！', '生活用品', '0');
INSERT INTO `good` VALUES ('120', '小清新学生用笔牛皮纸记本子大号单行本双行本单行簿大本加厚车线本软抄本初中生高中学生16K记事本复古简', '39', '39.20', '小清新学生用笔牛皮纸记本子大号单行本双行本单行簿大本加厚车线本软抄本初中生高中学生16K记事本复古简', '生活用品', '0');
INSERT INTO `good` VALUES ('121', '百草味 甘栗仁栗子干果休闲零食 趣味童年零食每日坚果炒货特产 熟板栗仁80g/袋', '39', '5.80', '【百草味零食狂欢节】自营极速达，零食抢不停', '食品', '0');
INSERT INTO `good` VALUES ('122', '怦然心动（套装上下册 附：海报、书签、卡片）', '39', '45.60', '（易烊千玺，周冬雨主演电影《少年的你，如此美丽》作者玖月晞惊艳之作）', '旧书', '1');
INSERT INTO `good` VALUES ('123', '圣罗兰（YSL）反转巴黎女士香水 30ml EDP', '39', '769.00', '【自营品质，正品保证】YSL燃情红色宣言，追逐颠覆想象的美妆冒险，满300减30', '生活用品', '2');
INSERT INTO `good` VALUES ('124', '小米Redmi红米K20pro手机 火焰红 6G+128G 全网通', '39', '2248.00', '【现货速发】下单即送：5元晒单红包+高品质耳机+一拖三充电线+手机钢化膜+运费险+一年质保+全国联保+优先发货权益！k20热卖中', '电子产品', '0');
INSERT INTO `good` VALUES ('126', '山地自行车', '17', '500.00', '学校那么大，我想去看看', '生活用品', '9');
INSERT INTO `good` VALUES ('128', 'test', '17', '20.00', '123', '电子产品', '1');
INSERT INTO `good` VALUES ('129', '岩焗乳酪吐司手撕夹心小面包网红小吃休闲零食礼盒500g', '17', '500.00', '123', '电子产品', '9');
INSERT INTO `good` VALUES ('130', '乌龙茶', '17', '120.00', '乌龙茶，好喝，健康', '食品', '9');
INSERT INTO `good` VALUES ('131', '泡面', '17', '30.00', '宵夜，馋舍友', '食品', '0');
INSERT INTO `good` VALUES ('132', '焦虑者自救手册', '17', '30.00', '还有点用！！', '旧书', '0');

-- ----------------------------
-- Table structure for pictures
-- ----------------------------
DROP TABLE IF EXISTS `pictures`;
CREATE TABLE `pictures` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `picture_url` varchar(255) NOT NULL,
  PRIMARY KEY (`picture_id`),
  KEY `goodId` (`good_id`),
  CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pictures
-- ----------------------------
INSERT INTO `pictures` VALUES ('1', '1', 'U盘.jpg');
INSERT INTO `pictures` VALUES ('2', '2', '洗发水.jpg');
INSERT INTO `pictures` VALUES ('3', '3', '吹风机.jpg');
INSERT INTO `pictures` VALUES ('4', '4', '食用油.jpg');
INSERT INTO `pictures` VALUES ('5', '5', '口红.jpg');
INSERT INTO `pictures` VALUES ('6', '6', '洗面奶.jpg');
INSERT INTO `pictures` VALUES ('7', '7', '手机.jpg');
INSERT INTO `pictures` VALUES ('8', '8', '鼠标.jpg');
INSERT INTO `pictures` VALUES ('9', '9', '书包.jpg');
INSERT INTO `pictures` VALUES ('11', '10', 'c23e3553cb5b46ddb03f9a87f91cdc8e_钢笔.jpg');
INSERT INTO `pictures` VALUES ('14', '13', 'c20ee685a774481890290e9897ab0aba_黄昏海边.jpg');
INSERT INTO `pictures` VALUES ('20', '20', 'ef33a96fe31c4bf8b6d91d652e54291c_电脑.jpg');
INSERT INTO `pictures` VALUES ('21', '21', 'd1ad923d66c24352a86770d2d714238c_电脑.jpg');
INSERT INTO `pictures` VALUES ('23', '22', '编译原理.jpg');
INSERT INTO `pictures` VALUES ('24', '23', '羽绒服.jpg');
INSERT INTO `pictures` VALUES ('25', '24', '充电宝.png');
INSERT INTO `pictures` VALUES ('26', '25', '香水.png');
INSERT INTO `pictures` VALUES ('27', '26', '电煮锅.png');
INSERT INTO `pictures` VALUES ('28', '27', '小风扇.png');
INSERT INTO `pictures` VALUES ('29', '28', '口红.png');
INSERT INTO `pictures` VALUES ('30', '29', '爽肤水.png');
INSERT INTO `pictures` VALUES ('31', '30', '华为手机.png');
INSERT INTO `pictures` VALUES ('32', '31', '单反相机.png');
INSERT INTO `pictures` VALUES ('33', '32', '算法设计与分析.png');
INSERT INTO `pictures` VALUES ('34', '33', '签字笔.png');
INSERT INTO `pictures` VALUES ('37', '34', '眼影.png');
INSERT INTO `pictures` VALUES ('38', '42', '75abdee2bec9487892bfed438d830b71_巧克力.jpg');
INSERT INTO `pictures` VALUES ('39', '43', '51a3ce35ce7f41778eea78645da24707_牛奶.jpg');
INSERT INTO `pictures` VALUES ('40', '44', '33b05b1453414821ae792c791d10d1b1_饼干.jpg');
INSERT INTO `pictures` VALUES ('41', '45', 'f795224763ce4eb88e26bfc36b74cfcf_洗衣机.jpg');
INSERT INTO `pictures` VALUES ('42', '46', 'af43be2e7c2e4bb2a2aa6c99b44da1d2_格子衫.jpg');
INSERT INTO `pictures` VALUES ('44', '48', '74a0df32964e4327b395d0d6af2e7c63_运动鞋.jpg');
INSERT INTO `pictures` VALUES ('46', '36', '3aced13d7f94401b966fa65a7e8807c7_裤子.jpg');
INSERT INTO `pictures` VALUES ('47', '50', '8290fab0d1224a71b90946560d7950c8_牛仔裤.jpg');
INSERT INTO `pictures` VALUES ('48', '51', '50e6704415774723b6bc1b6bf8e0392f_保暖帽子.jpg');
INSERT INTO `pictures` VALUES ('49', '52', 'a78ad1ebc8204a53972da49d6ea4fcfe_围巾.jpg');
INSERT INTO `pictures` VALUES ('50', '54', '眼影.png');
INSERT INTO `pictures` VALUES ('51', '55', 'huawei5799.png');
INSERT INTO `pictures` VALUES ('52', '56', 'hla58.png');
INSERT INTO `pictures` VALUES ('53', '57', 'four24.png');
INSERT INTO `pictures` VALUES ('54', '58', 'yibo138-2.png');
INSERT INTO `pictures` VALUES ('55', '59', 'acer6999.png');
INSERT INTO `pictures` VALUES ('56', '60', 'huawei4688.png');
INSERT INTO `pictures` VALUES ('57', '61', 'ahc99.png');
INSERT INTO `pictures` VALUES ('58', '62', 'sha149.png');
INSERT INTO `pictures` VALUES ('59', '63', 'Canon4999.png');
INSERT INTO `pictures` VALUES ('60', '64', 'mo109-2.png');
INSERT INTO `pictures` VALUES ('61', '65', 'cd290ba541ce41ab962018c962535ff8_韩版衣服.jpg');
INSERT INTO `pictures` VALUES ('62', '66', 'ec365-2.png');
INSERT INTO `pictures` VALUES ('63', '67', '871ddfdf3ffc4cc3bc8f74389017673b_眼霜.jpg');
INSERT INTO `pictures` VALUES ('64', '68', 'jo229.png');
INSERT INTO `pictures` VALUES ('65', '69', 'two69.9.png');
INSERT INTO `pictures` VALUES ('66', '70', 'romoss59.png');
INSERT INTO `pictures` VALUES ('67', '71', 'apple2999.png');
INSERT INTO `pictures` VALUES ('68', '72', 'niu98.png');
INSERT INTO `pictures` VALUES ('69', '73', 'yu129.9.png');
INSERT INTO `pictures` VALUES ('70', '74', 'yi169-3.png');
INSERT INTO `pictures` VALUES ('71', '75', 'fu119-5.png');
INSERT INTO `pictures` VALUES ('72', '76', 'lenovo3849-4.png');
INSERT INTO `pictures` VALUES ('73', '77', 'ni67.7.png');
INSERT INTO `pictures` VALUES ('74', '78', 'mu23.9.png');
INSERT INTO `pictures` VALUES ('75', '79', 'jz55-3.png');
INSERT INTO `pictures` VALUES ('76', '80', 'apple10699.png');
INSERT INTO `pictures` VALUES ('77', '81', 'Canon4199-2.png');
INSERT INTO `pictures` VALUES ('78', '82', 'db30.9.png');
INSERT INTO `pictures` VALUES ('79', '83', 'mao98.png');
INSERT INTO `pictures` VALUES ('80', '84', 'zhu38.8.png');
INSERT INTO `pictures` VALUES ('81', '85', 'mi93.png');
INSERT INTO `pictures` VALUES ('82', '86', 'li28.9.png');
INSERT INTO `pictures` VALUES ('83', '87', 'roya129-2.png');
INSERT INTO `pictures` VALUES ('84', '88', 'shai78.png');
INSERT INTO `pictures` VALUES ('85', '89', 'mao178.png');
INSERT INTO `pictures` VALUES ('86', '90', 'mi104.4.png');
INSERT INTO `pictures` VALUES ('87', '91', 'solove119-2.png');
INSERT INTO `pictures` VALUES ('88', '92', 'vivo2698.png');
INSERT INTO `pictures` VALUES ('89', '93', 'oppo1499-5.png');
INSERT INTO `pictures` VALUES ('90', '94', 'lin38.png');
INSERT INTO `pictures` VALUES ('91', '95', 'spring112.1.png');
INSERT INTO `pictures` VALUES ('92', '96', 'playboy139-3.png');
INSERT INTO `pictures` VALUES ('93', '97', 'wei34.2.png');
INSERT INTO `pictures` VALUES ('94', '98', 'six30.4.png');
INSERT INTO `pictures` VALUES ('95', '99', 'tian158-2.png');
INSERT INTO `pictures` VALUES ('96', '100', 'chen99-2.png');
INSERT INTO `pictures` VALUES ('97', '101', 'yu139.9.png');
INSERT INTO `pictures` VALUES ('98', '102', 'dell5999.png');
INSERT INTO `pictures` VALUES ('99', '103', 'season158.png');
INSERT INTO `pictures` VALUES ('100', '104', 'six34.2.png');
INSERT INTO `pictures` VALUES ('101', '105', 'mang9.9.png');
INSERT INTO `pictures` VALUES ('102', '106', 'ao10.8-4.png');
INSERT INTO `pictures` VALUES ('103', '107', 'liu166-2.png');
INSERT INTO `pictures` VALUES ('104', '108', '474ae45dc3eb45368e0928b8ae2d637e_吐司小面包.jpg');
INSERT INTO `pictures` VALUES ('105', '109', 'sk590.png');
INSERT INTO `pictures` VALUES ('106', '110', 'niu29.9.png');
INSERT INTO `pictures` VALUES ('107', '111', 'yan29-2.png');
INSERT INTO `pictures` VALUES ('108', '112', 'deep164.6.png');
INSERT INTO `pictures` VALUES ('109', '113', 'anna199.png');
INSERT INTO `pictures` VALUES ('110', '114', 'de15.png');
INSERT INTO `pictures` VALUES ('111', '115', 'dior198.png');
INSERT INTO `pictures` VALUES ('112', '116', 'olay339.png');
INSERT INTO `pictures` VALUES ('113', '117', 'wis238.png');
INSERT INTO `pictures` VALUES ('114', '118', 'bo399.png');
INSERT INTO `pictures` VALUES ('115', '119', 'hero129.png');
INSERT INTO `pictures` VALUES ('116', '120', 'xi39.2.png');
INSERT INTO `pictures` VALUES ('117', '121', 'ban5.9-5.png');
INSERT INTO `pictures` VALUES ('118', '122', 'xin45.6.png');
INSERT INTO `pictures` VALUES ('119', '123', 'ysl769.png');
INSERT INTO `pictures` VALUES ('120', '124', '011215946c684b78b06e36dff5ae2fb7_redmi2248.png');
INSERT INTO `pictures` VALUES ('122', '126', '0f9a96af6c1f4dd0b07b4f5a4401936c_山地自行车.jpg');
INSERT INTO `pictures` VALUES ('124', '128', '5197f3014bdc4166940cfbbfb6158010_U盘.jpg');
INSERT INTO `pictures` VALUES ('125', '129', '5e08d648d8ab41848a407a6b695a0286_banner.jpg');
INSERT INTO `pictures` VALUES ('126', '130', '170b33fc678e4e498121e9f105cd43ea_乌龙茶.jpg');
INSERT INTO `pictures` VALUES ('127', '131', '5d29a41c102841699c3371459d07fbd7_泡面.jpg');
INSERT INTO `pictures` VALUES ('128', '132', 'aba9c6786f444ab6b478b896971f0a4a_焦虑书.jpg');

-- ----------------------------
-- Table structure for tab_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(300) DEFAULT NULL,
  `password` varchar(96) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` char(3) DEFAULT NULL,
  `telephone` varchar(33) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `status` char(3) DEFAULT NULL,
  `code` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user
-- ----------------------------
INSERT INTO `tab_user` VALUES ('17', 'asdfgh', '111222', 'xiao明', '2017-08-08', '男', '12345677888', '123456@qq.com', 'Y', '96df347796574512832bfa09a62846e0');
INSERT INTO `tab_user` VALUES ('18', 'zhangsan', 'dsasds', '黄泽锋', null, '男', '111111', 'huangzefeng99@163.com', 'Y', null);
INSERT INTO `tab_user` VALUES ('20', 'zhang', 'dsasds', '黄泽锋', '2019-10-03', '男', '111111', 'huangzefeng99@163.com', 'Y', null);
INSERT INTO `tab_user` VALUES ('22', 'zhangsan111', '1', '张珊', null, '女', '111111111', '', 'N', null);
INSERT INTO `tab_user` VALUES ('23', 'zhang11111111', 'dsasds', '黄泽锋', '2019-10-03', '男', '111111', 'huangzefeng99@163.com', '', null);
INSERT INTO `tab_user` VALUES ('24', 'zhangsan22', 'dsasds', '黄泽锋', '2019-10-10', '男', '111111', '283229125@qq.com', 'N', null);
INSERT INTO `tab_user` VALUES ('25', 'a', '123456', '黄泽锋', '2019-10-03', '男', '15220468560', '283229125@qq.com', 'N', null);
INSERT INTO `tab_user` VALUES ('26', 'dasdss', '123456', '黄泽锋', '2019-10-17', '男', '111111', '283229125@qq.com', 'N', null);
INSERT INTO `tab_user` VALUES ('27', 'zhangsan122', '123456', '黄泽锋', '2019-10-17', '男', '15220468560', 'huangzefeng99@163.com', 'N', null);
INSERT INTO `tab_user` VALUES ('28', 'dasd23231123', '123456', '黄泽锋', '2019-10-16', '男', '15220468560', 'huangzefeng99@163.com', 'N', 'db6d5bb15b6d4721b30adb4fa740a982');
INSERT INTO `tab_user` VALUES ('29', 'dasdsadas', 'dsasds', '黄泽锋', '2019-10-08', '男', '15220468560', 'huangzefeng99@163.com', 'N', '5b1959c45d0f4a0d9c98705db4063193');
INSERT INTO `tab_user` VALUES ('30', 'hzf321232', '123456', '黄泽锋', '2019-10-17', '男', '15220468560', 'huangzefeng99@163.com', 'N', 'ef49f0c46faf4cac8b9c0afbce0aaf9c');
INSERT INTO `tab_user` VALUES ('31', 'hzf2321312', 'dsasds', '黄泽锋', '2019-10-10', '男', '15220468560', 'huangzefeng99@163.com', 'N', 'b1b2f9f5688d470795662db8f2550c98');
INSERT INTO `tab_user` VALUES ('32', 'hzf213213', 'dsasds', '黄泽锋', '2019-10-10', '男', '15220468560', 'huangzefeng99@163.com', 'N', 'e1de397fbd9e44b6930d53ec04d139b7');
INSERT INTO `tab_user` VALUES ('33', 'zhangsan2132', '123456', '黄泽锋', '2019-10-19', '男', '111111', 'huangzefeng99@163.com', 'N', '6df0532327094e509da7d061d00d95e3');
INSERT INTO `tab_user` VALUES ('34', 'zhangsan233', 'dsasds', '黄泽锋', '2019-10-03', '男', '15220468560', 'huangzefeng99@163.com', 'Y', '79bf326e9a2644f9b9bd5f17c8394644');
INSERT INTO `tab_user` VALUES ('35', 'zhangsan232', 'dsasds', '黄泽锋', '2019-10-05', '男', '15220468560', 'huangzefeng99@163.com', 'Y', 'ba3717b0cff3451eba13b706d40acd09');
INSERT INTO `tab_user` VALUES ('36', '531233', '1234343888', '黄泽锋', '2019-10-01', '男', '15220468321', 'huangzefeng99@163.com', 'N', 'cb894250cf824df5a543fb0e5852d44d');
INSERT INTO `tab_user` VALUES ('38', 'amxgdxlz', '123456', '优秀', '2019-10-31', '男', '12345698725', '2384923942@qq.com', 'Y', 'cda8a199c1894c708e2d4972b64d322d');
INSERT INTO `tab_user` VALUES ('39', 'yujian', '123456', '林雪茹', '1998-02-22', '女', '13250105780', '1224678336@qq.com', 'Y', 'cda8a199c1894c708e2d4972b64d322d');
INSERT INTO `tab_user` VALUES ('43', 'aaa456', 'aaa', '赵四', '2019-11-09', '女', '14725836932', '14725836955@qq.com', 'Y', 'cda8a199c1894c708e2d4972b64d322d');
INSERT INTO `tab_user` VALUES ('44', '123456', '123456', '林某某', '2019-12-03', '女', '13250105780', '123@123.com', 'N', '56bd3533ce964d4eb5cb8cc9abcc0dd8');

-- ----------------------------
-- Table structure for time_record
-- ----------------------------
DROP TABLE IF EXISTS `time_record`;
CREATE TABLE `time_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `uptime` datetime NOT NULL,
  `downtime` datetime DEFAULT NULL,
  `sailtime` datetime DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `forgood` (`good_id`),
  KEY `buyer_id` (`buyer_id`),
  CONSTRAINT `forgood` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`),
  CONSTRAINT `time_record_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `tab_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of time_record
-- ----------------------------
INSERT INTO `time_record` VALUES ('1', '46', '2019-11-18 11:56:16', null, '2019-12-10 01:50:31', null);
INSERT INTO `time_record` VALUES ('2', '1', '2019-07-05 20:06:50', '2019-12-09 10:58:47', null, null);
INSERT INTO `time_record` VALUES ('3', '2', '2019-07-18 20:07:23', null, null, null);
INSERT INTO `time_record` VALUES ('4', '3', '2019-07-26 20:07:46', null, null, null);
INSERT INTO `time_record` VALUES ('5', '4', '2019-08-01 20:08:02', null, null, null);
INSERT INTO `time_record` VALUES ('6', '5', '2019-08-15 20:08:27', null, null, null);
INSERT INTO `time_record` VALUES ('7', '6', '2019-08-21 20:08:57', null, null, null);
INSERT INTO `time_record` VALUES ('8', '7', '2019-08-30 20:09:12', '2019-12-09 10:56:05', null, null);
INSERT INTO `time_record` VALUES ('9', '8', '2019-09-03 22:10:30', null, null, null);
INSERT INTO `time_record` VALUES ('10', '9', '2019-09-12 20:10:06', null, null, null);
INSERT INTO `time_record` VALUES ('11', '10', '2019-09-13 20:11:36', null, null, null);
INSERT INTO `time_record` VALUES ('12', '13', '2019-09-17 20:11:57', null, '0000-00-00 00:00:00', null);
INSERT INTO `time_record` VALUES ('14', '20', '2019-09-20 20:13:06', null, null, null);
INSERT INTO `time_record` VALUES ('15', '21', '2019-09-25 20:13:22', '2019-12-10 01:42:13', null, null);
INSERT INTO `time_record` VALUES ('16', '22', '2019-09-28 20:13:42', null, null, null);
INSERT INTO `time_record` VALUES ('17', '23', '2019-10-01 20:14:01', null, null, null);
INSERT INTO `time_record` VALUES ('18', '24', '2019-10-03 20:14:19', '2019-12-12 07:07:17', null, null);
INSERT INTO `time_record` VALUES ('19', '25', '2019-10-18 20:14:58', null, null, null);
INSERT INTO `time_record` VALUES ('20', '26', '2019-10-19 20:15:17', null, null, null);
INSERT INTO `time_record` VALUES ('21', '27', '2019-10-22 20:15:44', null, null, null);
INSERT INTO `time_record` VALUES ('22', '28', '2019-10-23 20:16:06', null, null, null);
INSERT INTO `time_record` VALUES ('23', '29', '2019-10-23 20:16:23', null, null, null);
INSERT INTO `time_record` VALUES ('24', '30', '2019-10-24 20:17:33', null, '2019-12-15 15:48:03', null);
INSERT INTO `time_record` VALUES ('25', '31', '2019-10-30 20:18:14', null, null, null);
INSERT INTO `time_record` VALUES ('26', '32', '2019-11-01 20:18:54', null, null, null);
INSERT INTO `time_record` VALUES ('27', '33', '2019-11-03 20:19:06', null, null, null);
INSERT INTO `time_record` VALUES ('28', '34', '2019-11-05 20:19:25', '2019-12-10 01:45:52', null, null);
INSERT INTO `time_record` VALUES ('29', '36', '2019-11-07 20:19:39', null, null, null);
INSERT INTO `time_record` VALUES ('30', '42', '2019-11-11 20:19:52', '2019-12-09 11:01:47', null, null);
INSERT INTO `time_record` VALUES ('31', '43', '2019-11-13 20:20:07', null, '2019-12-09 11:03:11', null);
INSERT INTO `time_record` VALUES ('32', '44', '2019-11-16 20:20:46', null, null, null);
INSERT INTO `time_record` VALUES ('34', '48', '2019-11-24 13:44:41', null, null, null);
INSERT INTO `time_record` VALUES ('35', '50', '2019-12-02 05:15:23', null, null, null);
INSERT INTO `time_record` VALUES ('36', '51', '2019-12-02 05:22:06', '2019-12-09 10:19:39', null, null);
INSERT INTO `time_record` VALUES ('37', '52', '2019-12-02 07:32:40', null, null, null);
INSERT INTO `time_record` VALUES ('38', '54', '2019-11-18 11:56:16', '2019-12-08 02:45:37', null, null);
INSERT INTO `time_record` VALUES ('39', '55', '2019-07-05 20:06:50', null, null, null);
INSERT INTO `time_record` VALUES ('40', '56', '2019-12-03 15:12:19', null, null, null);
INSERT INTO `time_record` VALUES ('41', '57', '2019-06-05 15:14:36', null, null, null);
INSERT INTO `time_record` VALUES ('42', '58', '2019-10-15 15:16:12', null, null, null);
INSERT INTO `time_record` VALUES ('43', '59', '2019-09-24 15:16:47', null, null, null);
INSERT INTO `time_record` VALUES ('44', '60', '2019-09-06 15:20:09', null, null, null);
INSERT INTO `time_record` VALUES ('45', '61', '2019-01-15 15:20:25', null, null, null);
INSERT INTO `time_record` VALUES ('46', '62', '2019-04-17 15:20:56', null, null, null);
INSERT INTO `time_record` VALUES ('47', '63', '2019-07-31 15:21:54', null, null, null);
INSERT INTO `time_record` VALUES ('48', '64', '2019-06-06 15:22:20', null, null, null);
INSERT INTO `time_record` VALUES ('49', '65', '2019-06-28 15:24:05', null, null, null);
INSERT INTO `time_record` VALUES ('50', '66', '2019-02-22 15:24:28', null, null, null);
INSERT INTO `time_record` VALUES ('51', '67', '2019-10-01 15:24:49', null, null, null);
INSERT INTO `time_record` VALUES ('52', '68', '2019-01-30 15:25:19', '2019-12-15 15:47:20', null, null);
INSERT INTO `time_record` VALUES ('53', '81', '2019-01-10 15:33:28', null, null, null);
INSERT INTO `time_record` VALUES ('54', '82', '2019-06-08 15:33:42', null, null, null);
INSERT INTO `time_record` VALUES ('55', '83', '2019-05-22 15:33:51', null, null, null);
INSERT INTO `time_record` VALUES ('56', '84', '2019-04-30 15:33:59', null, null, null);
INSERT INTO `time_record` VALUES ('57', '89', '2019-03-03 15:38:47', null, null, null);
INSERT INTO `time_record` VALUES ('58', '90', '2019-03-20 15:38:57', null, null, null);
INSERT INTO `time_record` VALUES ('59', '91', '2019-08-28 15:39:05', null, null, null);
INSERT INTO `time_record` VALUES ('60', '92', '2019-07-07 15:39:11', null, null, null);
INSERT INTO `time_record` VALUES ('61', '93', '2019-03-26 15:39:19', null, null, null);
INSERT INTO `time_record` VALUES ('62', '94', '2019-09-17 15:39:26', null, null, null);
INSERT INTO `time_record` VALUES ('63', '95', '2019-07-27 15:39:35', null, null, null);
INSERT INTO `time_record` VALUES ('64', '96', '2019-08-15 15:39:42', null, null, null);
INSERT INTO `time_record` VALUES ('65', '97', '2019-10-01 15:39:48', null, null, null);
INSERT INTO `time_record` VALUES ('66', '98', '2019-03-17 15:39:53', null, null, null);
INSERT INTO `time_record` VALUES ('67', '99', '2019-06-16 15:40:09', null, null, null);
INSERT INTO `time_record` VALUES ('68', '100', '2019-02-28 15:40:21', null, null, null);
INSERT INTO `time_record` VALUES ('69', '101', '2019-01-01 15:40:29', null, null, null);
INSERT INTO `time_record` VALUES ('70', '102', '2019-05-25 15:40:51', null, null, null);
INSERT INTO `time_record` VALUES ('71', '103', '2019-03-18 15:40:40', null, null, null);
INSERT INTO `time_record` VALUES ('72', '107', '2019-01-28 15:46:34', null, '2019-12-12 08:12:49', null);
INSERT INTO `time_record` VALUES ('73', '108', '2019-04-27 15:46:49', null, '2019-12-16 07:43:40', null);
INSERT INTO `time_record` VALUES ('74', '109', '2019-02-16 15:46:59', null, null, null);
INSERT INTO `time_record` VALUES ('75', '110', '2019-06-10 15:47:13', '2019-12-12 08:12:48', null, null);
INSERT INTO `time_record` VALUES ('76', '111', '2019-07-25 15:47:26', null, null, null);
INSERT INTO `time_record` VALUES ('77', '112', '2019-09-29 15:47:36', null, null, null);
INSERT INTO `time_record` VALUES ('78', '113', '2019-09-10 15:47:46', null, null, null);
INSERT INTO `time_record` VALUES ('79', '114', '2019-04-11 15:47:55', null, null, null);
INSERT INTO `time_record` VALUES ('80', '115', '2019-07-18 15:48:07', null, '2019-12-12 08:12:46', null);
INSERT INTO `time_record` VALUES ('81', '116', '2019-06-18 15:48:16', null, null, null);
INSERT INTO `time_record` VALUES ('82', '117', '2019-05-20 15:48:27', null, null, null);
INSERT INTO `time_record` VALUES ('83', '118', '2019-01-31 15:48:36', null, null, null);
INSERT INTO `time_record` VALUES ('84', '119', '2019-06-22 15:48:48', null, null, null);
INSERT INTO `time_record` VALUES ('85', '120', '2019-06-12 15:48:58', null, null, null);
INSERT INTO `time_record` VALUES ('86', '121', '2019-06-18 15:49:07', null, null, null);
INSERT INTO `time_record` VALUES ('87', '122', '2019-07-29 15:49:20', null, null, null);
INSERT INTO `time_record` VALUES ('88', '123', '2019-09-20 15:49:31', null, null, null);
INSERT INTO `time_record` VALUES ('89', '124', '2019-09-16 15:49:43', null, null, null);
INSERT INTO `time_record` VALUES ('91', '126', '2019-12-16 00:35:57', null, null, null);
INSERT INTO `time_record` VALUES ('93', '128', '2019-12-16 07:40:09', '2019-12-16 07:43:32', null, null);
INSERT INTO `time_record` VALUES ('94', '129', '2019-12-16 07:46:14', null, null, null);
INSERT INTO `time_record` VALUES ('95', '130', '2019-12-16 08:52:48', null, null, null);
INSERT INTO `time_record` VALUES ('96', '131', '2019-12-16 09:11:16', null, null, null);
INSERT INTO `time_record` VALUES ('97', '132', '2019-12-16 09:17:30', null, null, null);
