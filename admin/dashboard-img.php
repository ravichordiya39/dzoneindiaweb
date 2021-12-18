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
				<li><a href="#">Dashbaord Image</a></li>
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

			if(@$_POST['submit'] == 'Upload'){

			$redirect = 'dashboard-img';

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
					
					$res = $functions->add_image_dashboard();
					if($res){

						 $_SESSION['success']='<div class="alert alert-success alert-dismissable">Gallery Image Add Successfully ! <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';
                          header('Location: '.$redirect);
                          exit;
					}
				}
			}

			?>

			<?php
					$result_ar = $functions->get_where('admins',1);
					$bg_data  =$result_ar['bg_img'];
						
			?>
			<div class="row-fluid">		
				<div class="span12">
					<div class="span4"></div>
					<form class=""  method="post" enctype="multipart/form-data">
						<fieldset>


                         	<div class="control-group span12" style="margin-left: 0px;">
							  <label class="control-labe1l"><strong>Dashboard Image</strong></label>
							 
							  <input type="file" name="image" required="" style="border: 1px solid black;box-shadow: 0px 0px 3px 2px black;border-radius: 10px">
							</div>

							<div class="control-group span3">
							  <br>
								<input type="submit" class="input-xlarge btn btn-primary" name="submit" value="Upload">
								<?php if($bg_data != ""){ ?>
								<img src="../images/dash_bg/<?= $bg_data ?>" style="width: 100px;height:100px"></a></td>
								<?php } ?>
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