<?php
/**
*
* 版权所有：恰维网络<www.qiawei.com>
* 作    者：寒川<admin@huikon.cn>
* 日    期：2016-01-21
* 版    本：1.0.4
* 功能说明：前台公用控制器。
*
**/

namespace Home\Controller;
use Think\Controller;
class ComController extends Controller {

	public function _initialize(){
		C(setting());
		/*
		$links = M('links')->limit(10)->order('o ASC')->select();
		$this->assign('links',$links);
		*/
    }
}