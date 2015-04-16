<?php /***********************************   ระบบตรวจสอบสิทธิ์  ******************************************/ ?>
<?php $access = valid_access($id_menu);  ?>
<?php if($access['view'] != 1) : ?>
<?php access_deny();  ?>
<?php else : ?>
<div class='row'>
	<div class='col-lg-6'>
    	<h3 style='margin-bottom:0px;'><i class='fa fa-home'></i>&nbsp; <?php echo $this->title; ?></h3>
    </div>
    <div class="col-lg-6">
    	<p class='pull-right'>
        	<a href="<?php echo $this->home; ?>">
        		<button class='btn btn-warning'><i class='fa fa-remove'></i>&nbsp; ยกเลิก</button>
             </a>
             	<button class='btn btn-success' <?php echo $access['add']; ?> onclick="save();"><i class='fa fa-save'></i>&nbsp; บันทึก</button>   	
         </p>
    </div>
</div><!-- End Row -->
<hr style='border-color:#CCC; margin-top: 0px; margin-bottom:20px;' />
<form id="data_form" method="post" action="<?php echo $this->home."/add"; ?>">
<input type="hidden" name="add" value="1"  />
<button type="button" id="btn_submit" style="display:none;">submit</button>
<input type="hidden" id="valid_code" value="0" />
<input type="hidden" id="valid_name" value="0" />
<div class='row'>
<div class='col-lg-3 col-lg-offset-4 col-xs-6 col-xs-offset-3'>
    <div class="col-xs-12">
    	<div class="input-group">
        	<span class="input-group-addon"><?php echo label("site_code"); ?></span>
            <input type="text" name="site_code" id="site_code" class="form-control" placeholder="Enter site code" required="required" autofocus="autofocus" autocomplete="off"  />
        </div>
    </div>
    <div class="col-xs-12">&nbsp;</div>
    <div class="col-xs-12">
    	<div class="input-group">
        	<span class="input-group-addon"><?php echo label("site_name"); ?></span>
            <input type="text" name="site_name" id="site_name" class="form-control" placeholder="Enter site name" required="required" autofocus="autofocus" autocomplete="off"  />
        </div>
    </div>
    <div class="col-xs-12">&nbsp;</div>
    <div class="col-xs-12">
    	<div class="input-group">
        	<span class="input-group-addon"><?php echo label("site_type"); ?></span>
            <select name="site_type" id="site_type" class="form-control"><?php echo selectSiteType(); ?></select>
        </div>
    </div>
    <div class="col-xs-12">&nbsp;</div>
    <div class="col-xs-12">
    	<div class="input-group">
        	<span class="input-group-addon"><?php echo label("active"); ?></span>
            <span class="form-control">
            <label for="yes" style="margin-left:20px;">
           <input class="ace" type="radio" name="active" value="1" id="yes" checked="checked" /><span class="lbl"><i class="fa fa-check" style="color:green; margin-left:10px;"></i></span>
           </label>
           <label for="no" style="margin-left:20px;">
           <input class="ace" type="radio" name="active" value="0" id="no" /><span class="lbl"><i class="fa fa-remove" style="color:red; margin-left:10px;"></i></span>
           </label>
           </span>
        </div>
    </div>
        	
</div><!-- End col-lg-3 -->
</div><!-- End row -->
</form>
<script>
function save()
{
	var code = $("#valid_code").val();
	var name = $("#valid_name").val();
	var type = $("#site_type").val();
	if(code == 1 ){
		swal("<?php echo label("duplicate_code"); ?>","<?php echo label("duplicate_code_message"); ?>","warning");
	}else if(name == 1){
		swal("<?php echo label("duplicate_name"); ?>","<?php echo label("duplicate_name_message"); ?>","warning");
	}else if(type == 0){
		swal("<?php echo label("choose_type"); ?>","<?php echo label("choose_type_message"); ?>","warning");
	}else{
	var btn = $("#btn_submit");
	btn.attr("type", "submit");
	btn.click();
	btn.attr("type","button");
	}
}
$("#site_code").keyup(function(e) {
    var code = $(this).val();
	$.ajax({
		url:"<?php echo $this->home."/valid_code/"; ?>"+code, type:"GET", cache:false,
		success: function(rs){
			$("#valid_code").val(rs);
		}
	});			
});
$("#site_name").keyup(function(e){
	var name = $(this).val();
	$.ajax({
		url: "<?php echo $this->home."/valid_name/"; ?>"+name, type:"GET", cache:false,
		success: function(rs){
			$("#valid_name").val(rs);
		}
	});
});
</script>
<?php endif; ?>