<?php
/**
 * 程序入口文件
 *
 * @author 恰维网络 <support@qiawei.com>
 * @link  http://www.qiawei.com/
 * @license  ( http://www.apache.org/licenses/LICENSE-2.0 )
 * @copyright (c) 2006-2016 http://www.qiawei.com All rights reserved.
 *
 **/

// 定义应用目录
define('APP_PATH', __DIR__ . '/App/');
// 定义vendor目录
define('VENDOR_PATH', __DIR__ . '/vendor/');

// 加载composer
require VENDOR_PATH."autoload.php";
// 加载thinkphp引导文件
require VENDOR_PATH."/topthink/thinkphp/start.php";
