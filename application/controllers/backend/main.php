<?php
class Main extends CI_Controller
{
	public $id_menu = 1;
	public $home;
	public $layout = "backend/include/template";
	public $title = "Welcome";
	
	public function __construct()
	{
		parent:: __construct();
		$this->home = base_url()."backend/main";
		$this->load->model("backend/main_model");
	}
	
	public function index()
	{
		$data['id_menu'] 	= $this->id_menu;
		$data['view']			= "backend/main_view";
		$this->load->view($this->layout, $data);
		
	}
	
	
}//end class


?>