<?php
/**
*
* 版权所有：恰维网络<www.qiawei.com>
* 作    者：寒川<admin@huikon.cn>
* 日    期：2016-01-21
* 版    本：1.0.4
* 功能说明：零星功能控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;

class ToolController extends ComController {
	
	//友情链接
	public function links(){
		
		$list = M('links')->order('o asc')->select();
		$this->assign('list',$list);
		$this->assign('nav',array('tool','links'));
		$this -> display();
	}
	//新增或修改链接
	public function linkform($id=null){
		
		$id = intval($id);
		$link = M('links')->where('id='.$id)->find();
		$this->assign('link',$link);
		$this->assign('nav',array('tool','links'));
		$this -> display();
	}
	//删除链接
	public function dellink(){
		
		$ids = isset($_REQUEST['ids'])?$_REQUEST['ids']:false;
		if($ids){
			if(is_array($ids)){
				$ids = implode(',',$ids);
				$map['id']  = array('in',$ids);
			}else{
				$map = 'id='.$ids;
			}
			if(M('links')->where($map)->delete()){
				addlog('删除友情链接，ID：'.$ids);
				$this->success('恭喜，删除成功！');
			}else{
				$this->error('参数错误！');
			}
		}else{
			$this->error('参数错误！');
		}
	}
	//保存链接
	public function linksave($id=0){
		$id = intval($id);
		$data['title'] = I('post.title','','strip_tags');
		if(!$data['title']){
			$this->error('请填写标题！');
		}
		$data['url'] = I('post.url','','strip_tags');
		$data['o'] = I('post.o','','strip_tags');
		$pic = I('post.logo','','strip_tags');
		if($pic<>'') {
			$data['logo'] = $pic;
		}
		if($id){
			M('links')->data($data)->where('id='.$id)->save();
			addlog('修改友情链接，ID：'.$id);
		}else{
			M('links')->data($data)->add();
			addlog('新增友情链接');
		}
		
		$this->success('恭喜，操作成功！',U('links'));
	}
	
	//flash焦点图
	public function flash(){
		
		$list = M('flash')->order('o asc')->select();
		$this->assign('list',$list);
		$this->assign('nav',array('tool','flash'));
		$this -> display();
	}
	//新增或修改焦点图
	public function flashform($id=null){
		
		$id = intval($id);
		$flash = M('flash')->where('id='.$id)->find();
		$this->assign('flash',$flash);
		$this->assign('nav',array('tool','flash'));
		$this -> display();
	}
	//删除焦点图
	public function delflash(){
		
		$ids = isset($_REQUEST['ids'])?$_REQUEST['ids']:false;
		if($ids){
			if(is_array($ids)){
				$ids = implode(',',$ids);
				$map['id']  = array('in',$ids);
			}else{
				$map = 'id='.$ids;
			}
			if(M('flash')->where($map)->delete()){
				addlog('删除焦点图，ID：'.$ids);
				$this->success('恭喜，删除成功！');
			}else{
				$this->error('参数错误！');
			}
		}else{
			$this->error('参数错误！');
		}
	}
	//保存焦点图
	public function flashsave($id=0){
		$id = intval($id);
		$data['title'] = I('post.title','','strip_tags');
		if(!$data['title']){
			$this->error('请填写标题！');
		}
		$data['url'] = I('post.url','','strip_tags');
		$data['o'] = I('post.o','','strip_tags');
		$data['pic'] = I('post.pic','','strip_tags');
		if($data['pic']=='') {
			$this->error('请上传图片！');
		}
		if($id){
			M('flash')->data($data)->where('id='.$id)->save();
			addlog('修改焦点图，ID：'.$id);
		}else{
			M('flash')->data($data)->add();
			addlog('新增焦点图');
		}
		
		$this->success('恭喜，操作成功！',U('flash'));
	}
}