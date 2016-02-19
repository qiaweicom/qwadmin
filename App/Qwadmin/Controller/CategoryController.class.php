<?php
/**
*
* 版权所有：恰维网络<qwadmin.qiawei.com>
* 作    者：寒川<hanchuan@qiawei.com>
* 日    期：2016-09-20
* 版    本：1.0.4
* 功能说明：文章控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class CategoryController extends ComController {

	public function index(){
	
		
		$category = M('category')->field('id,pid,name,o')->order('o asc')->select();
		$category = $this->getMenu($category);
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function del(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		if($id){
			$data['id'] = $id;
			$category = M('category');
			if($category->where('pid='.$id)->count()){
				die('2');//存在子类，严禁删除。
			}else{
				$category->where('id='.$id)->delete();
				addlog('删除分类，ID：'.$id);
			}
			die('1');
		}else{
			die('0');
		}

	}
	
	public function edit(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		$currentcategory = M('category')->where('id='.$id)->find();
		$this->assign('currentcategory',$currentcategory);

		$category = M('category')->field('id,pid,name')->order('o asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['pid']);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function add(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		$category = M('category')->field('id,pid,name')->order('o asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function update($act=null){
		if($act=='order'){
			$id = I('post.id',0,'intval');
			if(!$id){
				die('0');
			}
			$o = I('post.o',0,'intval');
			M('category')->data(array('o'=>$o))->where("id='{$id}'")->save();
			addlog('分类修改排序，ID：'.$id);
			die('1');
		}		$id = isset($_POST['id'])?intval($_POST['id']):false;
		$data['pid'] = isset($_POST['pid'])?intval($_POST['pid']):0;
		$data['name'] = isset($_POST['name'])?trim($_POST['name']):false;
		$data['keywords'] = isset($_POST['keywords'])?strip_tags(trim($_POST['keywords'])):'';
		$data['description'] = isset($_POST['description'])?strip_tags(trim($_POST['description'])):'';
		$data['o'] = isset($_POST['o'])?intval($_POST['o']):0;
		if(!$data['name']){
			die('0');
		}
		if($id){
			if(M('category')->data($data)->where('id='.$id)->save()){
				addlog('文章分类修改，ID：'.$id.'，名称：'.$name);
				die('1');
			}
		}else{
			$id = M('category')->data($data)->add();
			if($id){
				addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
				die('1');
			}
		}
		die('0');
	}
}