<?php
/**
 * 增加日志
 * @param $log
 * @param bool $name
 */

function addlog($log, $name = false)
{
    $Model = M('log');
    if (!$name) {
        session_start();
        $uid = session('uid');
        if ($uid) {
            $user = M('member')->field('user')->where(array('uid' => $uid))->find();
            $data['name'] = $user['user'];
        } else {
            $data['name'] = '';
        }
    } else {
        $data['name'] = $name;
    }
    $data['t'] = time();
    $data['ip'] = $_SERVER["REMOTE_ADDR"];
    $data['log'] = $log;
    $Model->data($data)->add();
}


/**
 *
 * 获取用户信息
 *
 **/
function member($uid, $field = false)
{
    $model = M('Member');
    if ($field) {
        return $model->field($field)->where(array('uid' => $uid))->find();
    } else {
        return $model->where(array('uid' => $uid))->find();
    }
}