/*
 Navicat Premium Data Transfer

 Source Server         : shop
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 08/02/2023 10:05:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'admin', 'admin');
INSERT INTO `admin_user` VALUES (2, 'hfb', 'hfb');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '购物车ID:自增列，主键',
  `user_id` int(0) NOT NULL COMMENT '用户ID:外键，引用user(id)',
  `good_id` int(0) NOT NULL COMMENT '商品ID:外键，引用good(id)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carUserID`(`user_id`) USING BTREE,
  INDEX `carGoodID`(`good_id`) USING BTREE,
  CONSTRAINT `carGoodID` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `carUserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (1, 1, 6);
INSERT INTO `car` VALUES (7, 2, 3);
INSERT INTO `car` VALUES (8, 2, 4);
INSERT INTO `car` VALUES (12, 2, 11);
INSERT INTO `car` VALUES (13, 2, 12);
INSERT INTO `car` VALUES (15, 6, 5);
INSERT INTO `car` VALUES (16, 5, 13);
INSERT INTO `car` VALUES (17, 1, 13);
INSERT INTO `car` VALUES (21, 7, 11);
INSERT INTO `car` VALUES (22, 6, 6);
INSERT INTO `car` VALUES (23, 2, 16);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '种类ID:自增，主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, '家具');
INSERT INTO `category` VALUES (3, '日常用品');
INSERT INTO `category` VALUES (4, '男装');
INSERT INTO `category` VALUES (5, '女装');
INSERT INTO `category` VALUES (6, '化妆品');
INSERT INTO `category` VALUES (7, '首饰');
INSERT INTO `category` VALUES (8, '箱包');
INSERT INTO `category` VALUES (9, '数码');
INSERT INTO `category` VALUES (10, '家电');
INSERT INTO `category` VALUES (11, '运动');
INSERT INTO `category` VALUES (12, '宠物');

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classification
-- ----------------------------
INSERT INTO `classification` VALUES (1, '服装', 0, 1);
INSERT INTO `classification` VALUES (2, '电脑', NULL, 1);
INSERT INTO `classification` VALUES (3, '手机', NULL, 1);
INSERT INTO `classification` VALUES (4, '食品', NULL, 1);
INSERT INTO `classification` VALUES (5, '笔记本', 2, 2);
INSERT INTO `classification` VALUES (6, '平板', 2, 2);
INSERT INTO `classification` VALUES (7, '台式机', 2, 2);
INSERT INTO `classification` VALUES (9, '家居', 0, 1);
INSERT INTO `classification` VALUES (10, '饮料', 4, 2);
INSERT INTO `classification` VALUES (11, '智能手机', 3, 2);

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品ID：自增，主键',
  `user_id` int(0) NOT NULL COMMENT '用户ID:外键，引用user(id)',
  `category_id` int(0) NOT NULL COMMENT '种类ID:外键，引用category（id）',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品描述',
  `price` int(0) NOT NULL COMMENT '商品价格',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '商品状态：（1：未出售）（0：已出售）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodUserID`(`user_id`) USING BTREE,
  INDEX `goodCategoryID`(`category_id`) USING BTREE,
  CONSTRAINT `goodCategoryID` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goodUserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES (3, 1, 2, '可折叠加厚双面使用榻榻米床垫', '可以折叠的榻榻米床垫，收纳不占空间，正反两面都可以使用，同时纯棉材质舒适亲肤，透气性好，保持贴身换将干爽 不粘腻。', 180, '/upload/2021-06-25/15/1582443919266.jpg', 1);
INSERT INTO `good` VALUES (4, 1, 7, '人鱼的眼泪 祖母绿琉璃吊坠', '简约的祖母绿水晶吊坠，光泽迷人，尽显十足的典雅宫廷风。', 278, '/upload/2021-06-25/15/1582444313438.jpg', 0);
INSERT INTO `good` VALUES (5, 2, 7, '手工琉璃淡紫项链', '\"淡雅的紫色调十分迷人，小小的性感韵味却不会显得人老气横秋。\"', 278, '/upload/2021-06-25/16/1582445742199.jpg', 0);
INSERT INTO `good` VALUES (6, 2, 7, '人鱼的眼泪薰衣草海外原创设计手工琉璃吊坠项链', '\"人鱼的眼泪薰衣草海外原创设计手工琉璃吊坠项链。手工成形，纯银抛光，热熔镶嵌，来自世界时尚之都日本东京的手工首饰，纯银与琉璃的完美结合，带你探寻源于心灵的浪漫与精致。\"', 298, '/upload/2021-06-25/16/1582445885698.jpg', 0);
INSERT INTO `good` VALUES (8, 2, 7, '航民 实心光面足金手镯', '\"耀眼的足金无需过多修饰，便能凸显出它的独特气质。实心的光圈创意，犹如知性的少女，无需张扬讨好亦有人爱。更有可调节的开扣，独特的设计，展现女性温柔如水的内涵。\"', 6053, '/upload/2021-06-25/16/1582446346946.jpg', 1);
INSERT INTO `good` VALUES (9, 2, 7, '周大福 简约足金黄金手链', '\"足金打造，佩戴起来凸显华丽质感，别致迷人的镂空徽章造型做工精湛，可调节链带脱戴更显方便，整体简约自然，更显亮白肤色。\"', 8465, '/upload/2021-06-25/16/1582446462373.jpg', 0);
INSERT INTO `good` VALUES (10, 1, 4, 'Kiko联名Asics斗篷夹克', 'Kiko Kostadinov X Asics Poncho 联名推出的一款可拆卸外套，是一款运动风格的连帽冲锋衣，通过立体剪裁工艺，设计出的这样时尚别致的运动服。深色鸭蛋蓝，喉部有引人注目的黑色镶板，呈现出简单而醒目的轮廓。', 1799, '/upload/2021-06-27/17/1584437283172.jpg', 1);
INSERT INTO `good` VALUES (11, 1, 4, '白糖玫瑰 日系复古宽松潮流夹克', '夹克版型，上身帅气有型，复古风格，彰显时尚潮流，短款外套，拉长身材比例。宽松版型，舒适百搭。\"', 168, '/upload/2021-06-27/17/1584437346060.jpg', 0);
INSERT INTO `good` VALUES (12, 1, 4, '男士羊羔绒连帽夹克', '此款工装夹克选用羊羔毛作内胆，水洗棉作面料，加厚保暖，柔软舒适，经典的连帽设计增添休闲感，胸前的拉链独特个性，兼具一定的实用性，两侧的贴布口袋容量大，实用性强，衣身五金做旧有质感，彰显不俗品质。', 242, '/upload/2021-06-27/17/1584437423156.jpg', 0);
INSERT INTO `good` VALUES (13, 2, 4, 'TIANC BRAND撞色翻领夹克', '大面积撞色显得别具一格，突出浓郁的复古街头风设计特点。结合垃圾食品的印花主题，能够渲染有趣的年轻氛围，从而散发青春流行风气息。立体拼接大口袋，诠释工装的硬朗魅力。', 529, '/upload/2021-06-27/17/1584437784107.jpg', 0);
INSERT INTO `good` VALUES (14, 2, 4, 'TIANC BRAND撞色夹克外套', '此款夹克充分的借鉴经典冲锋衣外套的设计精髓，通过断层分割以及半拉链门襟，体现潮酷机能性。大胆的撞色元素，有着强烈的视觉冲击力，解析出复古街头风格。', 349, '/upload/2021-06-27/17/1584437873477.jpg', 0);
INSERT INTO `good` VALUES (15, 2, 4, 'FYP国潮嘻哈印花套头工装夹克', '半拉链的套头款夹克外套，缔造冲锋衣那种机能性设计感，潮酷风采十足。偏宽松的版型，有着不拘一格的随性气息。干净明朗的底色，渗透欧美风的简约基调。', 399, '/upload/2021-06-27/17/1584437960047.jpg', 1);
INSERT INTO `good` VALUES (16, 6, 2, '优木家具纯实木沙发', '简单也是一种美/ 纯净的颜色，搭配任一款家具，尽显浪漫生活气息，满走您对居家生活的无止境追求。', 1000, '/upload/2021-06-28/17/1624873872247.jpg', 1);
INSERT INTO `good` VALUES (19, 6, 5, '霉霉同款裙子', '霉霉同款裙子，仙气飘飘！', 200, '/upload/2021-07-02/08/1625185041862.png', 1);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '留言ID:自增，主键',
  `user_id` int(0) NOT NULL COMMENT '用户ID:外键，引用user(id)',
  `good_id` int(0) NOT NULL COMMENT '商品ID:外键，引用good(id)',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `messageUserID`(`user_id`) USING BTREE,
  INDEX `messageGoodID`(`good_id`) USING BTREE,
  CONSTRAINT `messageGoodID` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `messageUserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (4, 1, 4, '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈');
INSERT INTO `message` VALUES (5, 1, 5, '好好好好好好好好好好好好好');
INSERT INTO `message` VALUES (6, 6, 5, '(๑•̀ㅂ•́)و✧');
INSERT INTO `message` VALUES (7, 6, 5, '挺好的');
INSERT INTO `message` VALUES (8, 7, 11, '7777');
INSERT INTO `message` VALUES (9, 6, 9, '真金白银');
INSERT INTO `message` VALUES (10, 2, 3, '1');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_time` datetime(0) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 'fjsdakl', '小明', '2017-11-25 19:23:48', '12345654', 4, 8888, 1);
INSERT INTO `order` VALUES (2, 'kdls;ajfklafkasld', 'tom', '2017-11-25 22:10:39', '123456894', 2, 17998, 1);
INSERT INTO `order` VALUES (3, 'ffggghhhhfdfhjhff', 'Catalina', '2017-11-25 22:52:44', '1234322313', 2, 6077, 1);
INSERT INTO `order` VALUES (4, 'fdsakldfjasl;', 'tomcat', '2017-11-25 23:35:01', '1234567878', 4, 8999, 1);
INSERT INTO `order` VALUES (5, 'Gggggggg', 'Hfb', '2017-11-26 02:53:14', '18679658549', 1, 5999, 1);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `count` int(0) NULL DEFAULT NULL,
  `order_id` int(0) NULL DEFAULT NULL,
  `product_id` int(0) NULL DEFAULT NULL,
  `sub_total` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (1, 1, 1, 10, 8888);
INSERT INTO `order_item` VALUES (2, 2, 2, 9, 17998);
INSERT INTO `order_item` VALUES (3, 2, 3, 11, 78);
INSERT INTO `order_item` VALUES (4, 1, 3, 13, 5999);
INSERT INTO `order_item` VALUES (5, 1, 4, 9, 8999);
INSERT INTO `order_item` VALUES (6, 1, 5, 13, 5999);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `csid` int(0) NULL DEFAULT NULL,
  `desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_hot` int(0) NULL DEFAULT NULL,
  `market_price` double NULL DEFAULT NULL,
  `pdate` datetime(0) NULL DEFAULT NULL,
  `shop_price` bigint(0) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (9, 5, '新一代 Surface Pro 比以往更出色，它不仅仅是一台笔记本，还能在工作室模式和平板间灵活切换.\r\n\r\n随心所欲，百变菁英 震撼的 PixelSense™ 显示屏支持触控笔* 和触摸操作，设计方面也有所改进，与 Surface Pro 4 相比，速度和性能都得到了进一步提升，电池续航能力有较大提高。\r\n\r\n无风扇，更安静 灵感随意 随手拈来 \r\n\r\n快捷刷脸登陆 保护隐私 轻松唤醒刷脸登陆 充分保护您的私人数据**** 无论您喜欢摄影、绘画、音乐或创作\r\n\r\n精彩视频\r\nSurface Pro总能满足您诸多创作需求 Surface Pro 酷睿 m3 和 i5 型号配备全新无风扇冷却系统***，\r\ni7 型号改进了混合冷却系统，您可以更安静地工作或播放喜欢的节目。', '/mall/admin/product/img/0B1CDC0C82A79A25A4BA159D88D8AC.jpg', 1, 9999, '2017-11-25 00:37:57', 8999, '微软（Microsoft）新Surface Pro 二合一平板电脑 12.3英寸（Intel Core i5 8G内存 256G存储 ）');
INSERT INTO `product` VALUES (10, 11, '一直以来，我们都心存一个设想，期待着能够打造出这样一部 iPhone：它有整面的屏幕，能让你在使用时完全沉浸其中，仿佛忘记了它的存在。它是如此智能，你的一触、一碰、一言、一语，哪怕是轻轻一瞥，都会得到它心有灵犀的回应。而这个设想，终于随着 iPhone X 的到来成为了现实。现在，就跟未来见个面吧。', '/mall/admin/product/img/E98ECEAC9E68BE31BB623419FD0C9E.png', 1, 9999, '2017-11-24 22:17:54', 8888, 'Apple iPhone X (A1865) 64GB 银色 移动联通电信4G手机');
INSERT INTO `product` VALUES (11, 10, '京东价：京东价为商品的销售价，是您最终决定是否购买商品的依据。\r\n划线价：商品展示的划横线价格为参考价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或该商品在京东平台上曾经展示过的销售价；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。\r\n折扣：如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。\r\n异常问题：商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。', '/mall/admin/product/img/EA03D40CEC55463A958B3629511493.jpg', 0, 40.9, '2017-11-25 22:37:23', 39, '可口可乐330ml*24听整箱装');
INSERT INTO `product` VALUES (12, 7, '搭载NVIDIA GeForce GTX1060 3G独立显卡，强大的图像显示和处理功能，\r\n既可以高画质下流畅运行工作软件，也支持主流大型游戏，工作游戏，左右兼顾。\r\n并支持兼容主流VR眼镜设备，为你带来身临其境的沉浸体验。', '/mall/admin/product/img/3E1E590D6BD2ED1CF047045C83B313.jpg', 1, 4999, '2017-11-25 22:39:01', 3999, '惠普（HP）光影精灵580 吃鸡游戏主机（i5-7400 8G 128GSSD+1T GTX1060）');
INSERT INTO `product` VALUES (13, 7, '原本就拥有强劲的基础性能，能够轻松通吃时下的主流电竞游戏；外观方面整机采用多面切割搭配碳纤铠甲风格，搭配“胜利之眼”游戏氛围灯，凸显电竞元素；最主要的是这是一款UIY电竞主机，机箱内部已经给升级留足了接口和空间，在官方配置的基础上我们还可以进行性能和外观方面的额升级，而且官方配件仍然能在保修范围内。品牌PC厂商参与到PC个性化定制和部件升级服务中来，同时提供品牌厂商一贯的服务优势，完全解决了DIY模式下遇到的种种痛点。不得不说联想拯救者刃 7000的出现，开启了PC UIY时代。', '/mall/admin/product/img/9F6B955F4C732FF96793FC8BB2F244.jpg', 1, 6499, '2017-11-25 22:41:06', 5999, '联想（Lenovo）拯救者刃7000 UIY主机( i7-7700 8G 128G SSD 1T硬盘 GTX1060 Win10)');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'wew6698888', '89****96@qq.com', 'skywalker', '123456', '17688970006', 'hfb');
INSERT INTO `user` VALUES (2, '1235645645646', '89***96@qq.com', 'hfb', '123456', '18645954845', 'jesse');
INSERT INTO `user` VALUES (3, '江西省 吉安市 泰和县', '8976677657@qq.com', '曾涛涛', '123456', '12345678941', 'ztt');

SET FOREIGN_KEY_CHECKS = 1;
