#qwadmin变更日志

## V2.0
### 2016-10-31

1、引入thinkphp5.0.2

2、调整整体框架目录结构

## V1.2
### 2016-10-06

1、删除`config_bak.php`文件，增加`config.php`,`db.php`为数据库配置文件，安装请在`db.php`修改数据库信息
2、增加栏目英文目录
3、增加获取文章url功能吗，可以实现 `http://wwww.qwadmin.com/分类/子分类/子分类/id.html`的url结构，
具体参考`App/Common/Common/function.php`函数 articleUrl函数

