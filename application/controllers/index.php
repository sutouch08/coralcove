<?php
	class index extends CI_Controller
	{
		public $layout = "include/template";
		public function __construct()
		{
			parent::__construct();
		}
		public function index()
		{
			$data['page_title'] = "Welcome";
			$this->load->view("index" ,$data);
		}
		
		
	
	}
	
?>