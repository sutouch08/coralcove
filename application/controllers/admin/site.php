<?php
class Site extends CI_Controller
{
	public $id_menu = 1;
	public $home;
	public $title = "Add/edit site";
	public $layout = "admin/include/template";
	
	public function __construct()
	{
		parent::__construct();
		$this->home = base_url()."admin/site";
		$this->load->model("admin/site_model");
	}
	
	public function index()
	{
		$rs = $this->site_model->get_data();
		$data['data'] = $rs;
		$data['view'] = "admin/site_view";
		$data['id_menu'] = $this->id_menu;
		$this->load->view($this->layout, $data);
	}
	
	public function add()
	{
		if($this->input->post("add"))
		{
			if( $this->verify->validate($this->id_menu, "add") )
			{
				$data['site_code'] = $this->input->post("site_code");
				$data['site_name'] = $this->input->post("site_name");
				$data['site_type'] = $this->input->post("site_type");
				$data['active'] = $this->input->post("active");
				if(!$this->site_model->add($data))
				{
					setError( label("add_error") );
				}
				redirect($this->home);					
				
			}else{
				action_deny();
			}
		}else{
			$data['view'] = "admin/add_site_view";
			$data['id_menu'] = $this->id_menu;
			$this->load->view($this->layout, $data);
		}
	}
	
	
	
	
	public function valid_code($code, $id="")
	{
		if($this->site_model->valid_code(urldecode($code), $id))
		{
			echo "1"; // รหัสซ้ำ
		}else{
			echo "0"; // ไม่ซ้ำ
		}
	}
	
	public function valid_name($name, $id="")
	{
		if($this->site_model->valid_name(urldecode($name), $id))
		{
			echo "1"; // รหัสซ้ำ
		}else{
			echo "0"; // ไม่ซ้ำ
		}
	}
	
}// End class


?>