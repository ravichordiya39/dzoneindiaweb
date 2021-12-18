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
				<li><a href="#">Uplaod Logo</a></li>
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

			$redirect = 'upload_logo';

			if($_FILES['image']['name'] != ""){
					
					if($_FILES['image']['error'] > 0){

						$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Error Opening in Image<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
                          header('Location: '.$redirect);
                          exit;

					}
				
					$allowed = array('jpeg','jpg','png');
					$name = $_FILES['image']['name'];
					$ext = pathinfo($name,PATHINFO_EXTENSION);

					if(!in_array($ext, $allowed)){
						$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Image must be in jpg,png,jpeg format<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
					  header('Location: '.$redirect);
					  exit;
					  }
				
					$res = $functions->addLogo();
					
					if($res){

						 $_SESSION['success']='<div class="alert alert-success alert-dismissable">Logo uploaded successfully ! <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
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
							  <label class="control-labe1l"><strong>Upload Logo </strong></label>
							 
							  <input type="file" name="image" required="" style="border: 1px solid black;box-shadow: 0px 0px 3px 2px black;border-radius: 10px">
							  <div style="font-size:10px">Image dimension : 272X60 </div>	
							</div>
							<div class="control-group span12" style="width:272px; height:60px;margin-left: 0px;" >
							<?php  $logo =  $functions->get('settings');
							?>
							<a href="image/logo/<?= $logo[0]['logo'] ?>" target="_blank"><img src="image/logo/<?= $logo[0]['logo'] ?>" style="width: 272px;height:60px"></a>
							
							</div>

							<div class="control-group span12" style="margin-left: 0px;">
							  <br>
								<input type="submit" class="input-xlarge btn btn-primary" name="submit" value="Upload">
							</div>

						</fieldset>
					</form>
					<div class="span4"></div>
				</div>
			</div>
			
		</div><!--/.fluid-container-->
		<!-- end: Content -->
	</div><!--/#content.span10-->


</div>

<?php

require_once("_footer.php");

?>