<?php
/**
*
* 版权所有：恰维网络<qwadmin.qiawei.com>
* 作    者：寒川<hanchuan@qiawei.com>
* 日    期：2015-09-17
* 版    本：1.0.0
* 功能说明：后台公共文件。
*
**/

/**
*
* 函数：日志记录
* @param  string $log   日志内容。
* @param  string $name （可选）用户名。
*
**/
function addlog($log,$name=false){
	$Model = M('log');
	if(!$name){
		$auth = cookie('auth');
		list($identifier, $token) = explode(',', $auth);
		if (ctype_alnum($identifier) && ctype_alnum($token)) {
			$user = M('member')->field('user')->where(array('identifier'=>$identifier))->find();
			$data['name'] = $user['user'];
		}else{
			$data['name'] = '';
		}
	}else{
		$data['name'] = $name;
	}
	$data['t'] = time();
	$data['ip'] = $_SERVER["REMOTE_ADDR"];
	$data['log'] = $log;
	$Model->data($data)->add();
}


/**
*
* 函数：获取用户信息
* @param  int $uid      用户ID。
* @param  string $name  数据列（如：'uid'、'uid,user'）
*
**/
function member($uid,$field=false) {
	$model = M('Member');
	if($field){
		return $model ->field($field)-> where(array('uid'=>$uid)) -> find();
	}else{
		return $model -> where(array('uid'=>$uid)) -> find();
	}
}