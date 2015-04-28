<?php
function setError($message)
{
	$c =& get_instance();
	$c->session->set_flashdata("error", $message);
}

function setMessage($message)
{
	$c =& get_instance();
	$c->session->set_flashdata("success", $message);
}

function isActived($value)
{
	$icon = "<i class='fa fa-remove' style='color:red'></i>";
	if($value == "1")
	{
		$icon = "<i class='fa fa-check' style='color:green'></i>";
	}
	return $icon;
}
function isChecked($val1, $val2)
{
	$value = "";
	if( $val1 == $val2 )
	{
		$value = "checked='checked'";
	}
	return $value;
}

function getEmployeeNameByIdUser($id_user)
{
	$c =& get_instance();
	$name = "";
	$rs = $c->db->select("first_name")->join("tbl_employee","tbl_employee.id_employee = tbl_user.id_emp")->get_where("tbl_user", array("id_user"=>$id_user),1);
	if($rs->num_rows() == 1)
	{
		$name = $rs->row()->first_name;
	}
	return $name;	
}

function getEmployeeNameByIdAdmin($id_user)
{
	$c =& get_instance();
	$name = "";
	$rs = $c->db->select("first_name")->join("tbl_employee","tbl_employee.id_employee = tbl_admin.id_employee")->get_where("tbl_admin", array("id_admin"=>$id_user),1);
	if($rs->num_rows() == 1)
	{
		$name = $rs->row()->first_name;
	}
	return $name;	
}

function getTypeName($id_type)
{
	$c =& get_instance();
	$name = "";
	$rs = $c->db->select("type_name")->get_where("tbl_site_type", array("id_site_type"=>$id_type),1);
	if($rs->num_rows() == 1)
	{
		$name = $rs->row()->type_name;
	}
	return $name;	
}

function selectSiteType($id="")
{
	$c =& get_instance();
	$option = "<option value='0'>Plase choose one</option>";
	$rs = $c->db->get("tbl_site_type");
	if($rs->num_rows() >0)
	{
		foreach($rs->result() as $ro)
		{
			if($ro->id_site_type == $id){ $select = "selected='selected'"; }else{ $select = ""; }
			$option .= "<option value='".$ro->id_site_type."' ".$select.">".$ro->type_name."</option>";
		}
	}
	return $option;
}
?>