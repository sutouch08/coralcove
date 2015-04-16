<?php
class Site_model extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}
	
	public function get_data($id="")
	{
		if($id !="")
		{
			$this->db->where("id_site", $id);
		}
		$rs = $this->db->get("tbl_site");
		if($rs->num_rows() >0)
		{
			return $rs->result();
		}else{
			return false;
		}
	}
	
	public function add($data)
	{
		$rs = $this->db->insert("tbl_site", $data);
		if($rs)
		{
			return true;
		}else{
			return false;
		}
	}
	
	
	public function valid_code($code, $id)
	{
		if($id !="")
		{
			$this->db->where("site_code", $code)->where("id_site !=", $id);
		}else{
			$this->db->where("site_code", $code);
		}
		$rs = $this->db->get("tbl_site");
		if($rs->num_rows() >0)
		{
			return true;
		}else{
			return false;
		}
	}
	
	public function valid_name($code, $id)
	{
		if($id !="")
		{
			$this->db->where("site_name", $code)->where("id_site !=", $id);
		}else{
			$this->db->where("site_name", $code);
		}
		$rs = $this->db->get("tbl_site");
		if($rs->num_rows() >0)
		{
			return true;
		}else{
			return false;
		}
	}
}// End Class

?>