<?php
/**
 *
 * 版权所有：恰维网络<qwadmin.qiawei.com>
 * 作    者：寒川<hanchuan@qiawei.com>
 * 日    期：2016-01-19
 * 版    本：1.0.0
 * 功能说明：升级控制器。
 *
 **/

namespace Qwadmin\Controller;

class CacheController extends ComController
{

    //清除缓存
    public function clear()
    {
        $cache = \Think\Cache::getInstance();
        $cache->clear();
        $this->rmdirr(RUNTIME_PATH);
        $this->success('系统缓存清除成功！');
    }

    //递归删除缓存信息

    public function rmdirr($dirname)
    {
        if (!file_exists($dirname)) {
            return false;
        }
        if (is_file($dirname) || is_link($dirname)) {
            return unlink($dirname);
        }
        $dir = dir($dirname);
        if ($dir) {
            while (false !== $entry = $dir->read()) {
                if ($entry == '.' || $entry == '..') {
                    continue;
                }
                //递归
                $this->rmdirr($dirname . DIRECTORY_SEPARATOR . $entry);
            }
        }
        $dir->close();
        return rmdir($dirname);
    }

}