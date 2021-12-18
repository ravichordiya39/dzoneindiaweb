<?php
require_once("_header.php");
  $functions->admin_acty('users page visited');

?>
<div class="container-fluid-full">
	<div class="row-fluid">
		<?php require_once("_sidebar.php"); ?>
			<!-- start: Content -->
		<div id="content" class="span10">
            <ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>

					<a href="dashboard.php">Home</a> 

					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">Banner Image</a></li>
			</ul>
						<?php 

				if(@$_SESSION['success']){

					echo $_SESSION['success'];
					unset($_SESSION['success']);

				}

				if(@$_SESSION['failed']){

					echo $_SESSION['failed'];
					unset($_SESSION['failed']);
				}

			?>

			<?php 

			if(@$_GET['action']=='Delete'){
				$id = $_GET['id'];
				$res = $functions->event_image_delete($id);
				if($res){

					$_SESSION['success']  =  "<div class='alert alert-success'><button type='button' class='close' data-dismiss='alert'>×</button>
					<strong>SUCCESS : Banner Image Delete Successfully !</strong> 
					</div>";
			header('Location: event_image');
			exit();
				}	
			}
			 ?>

			<?php 

			if(@$_POST['submit'] == 'Upload'){

			$redirect = 'event_image';

			if($_FILES['image']['name'] != ""){

					if($_FILES['image']['error'] > 0){

						$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Error Opening in Image<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
                          header('Location: '.$redirect);
                          exit;

					}

					$allowed = array('jpeg','jpg','png');
					$name = $_FILES['image']['name'];
					$ext = pathinfo($name,PATHINFO_EXTENSION);

					if($_FILES['image']['size'] < 1024*1024*2){
                          if(!in_array($ext, $allowed)){
                            $_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Image must be in jpg,png,jpeg format<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
                          header('Location: '.$redirect);
                          exit;
                          }
                        }else{
                          $_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Image size not larger than 2 MB<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
                          header('Location: '.$redirect);
                          exit;
                        }
					
					$res = $functions->add_image_gallery();
					if($res){

						 $_SESSION['success']='<div class="alert alert-success alert-dismissable">Banner Image Add Successfully ! <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
                          header('Location: '.$redirect);
                          exit;
					}
				}
			}

			?>
			<div class="row-fluid">		
				<div class="span12">
					<div class="span4"></div>
					<form class=""  method="post" enctype="multipart/form-data">
						<fieldset>


                         	<div class="control-group span12" style="margin-left: 0px;">
							  <label class="control-labe1l"><strong>Banner Image</strong></label>
							 
							  <input type="file" name="image" required="" style="border: 1px solid black;box-shadow: 0px 0px 3px 2px black;border-radius: 10px">
							  <div style="font-size:10px">Image dimension : 350X150</div>	
							</div>

							<div class="control-group span3">
							  <br>
								<input type="submit" class="input-xlarge btn btn-primary" name="submit" value="Upload">
							</div>

						</fieldset>
					</form>
					<div class="span4"></div>
				</div>
			</div>
			<div class="row-fluid">		
             <div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white user"></i><span class="break"></span> Banner Image History</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content" style="overflow-y: auto;z-index: 0;">
					<div style="clear: both"></div>
					<table class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
			<tr>
				<th>S.NO.</th>
				<th>Banner Image</th>
				<th>Action</th>
				
				
			</tr>
	    </thead>
		<?php
					$result_ar = $functions->get_order_by('banners','id','DESC');
					$i =0;
					foreach($result_ar as $result){
						
						?>
					<tr>
						<td class="center"><?= ++$i ?></td>
						<td class="center"><a href="../gallery/banners/<?= $result['image'] ?>" target="_blank"><img src="../gallery/banners/<?= $result['image'] ?>" style="width: 100px;height:100px"></a></td>
						<td class="center">
						  <a onclick="return confirm('Are you sure you would like to Delete Image?');"  class="btn btn-danger" href="event_image?id=<?php echo $result["id"];?>&action=Delete" title="Delete">
							<i class="halflings-icon white remove"></i>  
						  </a>
						</td>
					</tr>	
					<?php } ?>
					</table>
				</div>
			</div>  
		</div>
		</div><!--/.fluid-container-->
		<!-- end: Content -->
	</div><!--/#content.span10-->


</div>

<?php

require_once("_footer.php");

?>