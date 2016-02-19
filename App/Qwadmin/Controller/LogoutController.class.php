<?php
/**
*
* 版权所有：恰维网络<www.qiawei.com>
* 作    者：寒川<admin@huikon.cn>
* 日    期：2016-01-17
* 版    本：1.0.4
* 功能说明：后台登出控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
class LogoutController extends ComController {
    public function index(){
		cookie('user',null);
		$url = U("login/index");
		header("Location: {$url}");
		exit(0);
    }
}