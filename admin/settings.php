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
				<li><a href="#">Settings</a></li>
			</ul>
			<?php 

			$min_day_trade = 0.75;
			$max_day_trade = 2;

			$min_fix_trade = 2;
			$max_fix_trade = 4;

				if (@$_POST['submit']){

					$message  		=trim($_POST['message']);
					$whatsappgroup  =trim($_POST['whatsappgroup']);
					$ppt     		=trim($_POST['ppt']);
					$day_trade     		=trim($_POST['day_trade']);
					$fix_trade     		=trim($_POST['fix_trade']);

					if($message=="" || $day_trade == "" || $fix_trade == ""){

						$_SESSION['failed']="<div class='alert alert-danger'>
							<button type='button' class='close' data-dismiss='alert'>×</button>
							<strong>FAILED: Required field can not be empty</strong></div>";

						header('Location: settings.php');

						exit();

					}elseif($day_trade < $min_day_trade || $day_trade > $max_day_trade){

						$_SESSION['failed']='<div class="alert alert-danger">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong>FAILED: Minimum Day Trade is '.$min_day_trade.' & Maximum Day Trade is '.$max_day_trade.'</strong></div>';

						header('Location: settings.php');

						exit();

					}elseif($fix_trade < $min_fix_trade || $fix_trade > $max_fix_trade){

						$_SESSION['failed']='<div class="alert alert-danger">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong>FAILED: Minimum Fix Trade is '.$min_fix_trade.' & Maximum Fix Trade is '.$max_fix_trade.'  </strong></div>';

						header('Location: settings.php');

						exit();

					}else{

						$res= $functions->manage_settings($message, $whatsappgroup, $ppt,$fix_trade,$day_trade);

						if ($res){

							$_SESSION['success']="<div class='alert alert-success'>
								<button type='button' class='close' data-dismiss='alert'>×</button><strong>Settings update Succefully</strong></div>";
							header('Location: settings.php');
							exit;	
						}
					}
				}

				$res = $functions->getSettings();

			?>
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
			<div class="row-fluid">		
				<div class="span12">
					<div class="span4"></div>
					<form class="" action="" method="post">
						<fieldset>


                         	<div class="control-group span12" style="margin-left: 0px;">
							  <label class="control-labe1l">Message</label>
							 
							  <textarea  name="message"><?=@$res->message?></textarea>
							</div>

							<div class="control-group span12" style="margin-left: 0px;">
							  <label class="control-label1">Telegram Channal</label>
							  <input type="url" name="whatsappgroup"  value="<?=@$res->telegram?>">
							</div>

							

							<div class="control-group span12" style="margin-left: 0px;">
							  <label class="control-label1">PPT</label>
							  <input type="url" name="ppt" value="<?=@$res->ppt?>">
							</div>

							<div class="control-group span12" style="margin-left: 0px;">
							  <label class="control-label1">Day trade rate</label>
							  <input type="text" name="day_trade"  value="<?=@$res->day_trade?>">
							</div>

							<div class="control-group span12" style="margin-left: 0px;">
							  <label class="control-label1">Fix trade rate</label>
							  <input type="text" name="fix_trade"  value="<?=@$res->fix_trade?>">
							</div>

							<div class="control-group span3">
							  <br>
								<input type="submit" class="input-xlarge btn btn-primary" name="submit" value="Submit">
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