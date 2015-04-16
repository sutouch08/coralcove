<?php
class Authentication extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
	}
	
	public function index()
	{
		$this->load->view("admin/login");
	}
	
	public function validate_credentials()
	{
		$this->load->model("admin/login_model");
		$rs = $this->login_model->validate();
		if($rs == 8)
		{
			$data = array(
				"id_admin"=>-1,
				"user_name"=>"super admin",
				"id_profile"=>0
			);
			$this->session->set_userdata($data);
			redirect(base_url()."admin/index");
		}else if($rs == true)
		{
			$ro = $this->login_model->get_profile($rs->id_admin);
			$data = array(
				"id_admin"=>$rs->id_admin,
				"user_name"=>$rs->user_name,
				"id_profile"=>$ro->id_profile
			);
			$this->session->set_userdata($data);
			redirect(base_url()."admin/index");
		}else{
			$this->index();
		}
	}
	
	public function logout()
	{
		$this->session->unset_userdata("id_admin");
		$this->session->unset_userdata("user_name");
		$this->session->unset_userdata("id_profile");
		$this->index();
		//redirect("","refresh");	
	}
	
}

?>