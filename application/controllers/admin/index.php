<?php 
class Index extends CI_Controller
{
	public $id_menu = 1;
	public $home;
	public $title = "Welcome";
	public $layout = "admin/include/template";
	
	public function __construct()
	{
		parent:: __construct();
		$this->home = base_url()."admin/index";
	}
	
	public function index()
	{
		$data['id_menu'] = $this->id_menu;
		$data['view'] = "admin/main_view";
		$this->load->view($this->layout, $data);
	}
	
	
}// end class


?>