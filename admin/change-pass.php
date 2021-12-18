<?php
require_once("_header.php");
?>
<?php

	 $status="";
  if(array_key_exists("pass",$_POST)){
		$status = $functions->change_password();
	}
?>
<div class="container-fluid-full">
		<div class="row-fluid">
				
			<?php require_once("_sidebar.php"); ?>
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="dashboard.php">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">Change Password</a></li>
			</ul>
			<div class="row-fluid">
                <div class="span6">
                
						<form class="form-horizontal" method="post">
						  <fieldset>
						  <div class="control-group">
						  <?php 
						  if($status != ""){?>
						  <?php echo $status; ?>
						  <?php } ?>
							  <label class="control-label" for="old_pass">Old Password</label>
							  <div class="controls">
								<input class="input-xlarge focused" id="old_pass" type="password"
                                 placeholder="Enter Old Password" value="" name="old_pass">
							  </div>
							</div>
                          <div class="control-group">
							  <label class="control-label" for="pass">New Password</label>
							  <div class="controls">
								<input class="input-xlarge focused" id="pass" type="password"
                                 placeholder="Enter New Password" value="" name="pass">
							  </div>
							</div>
							<div class="control-group">
							  <label class="control-label" for="c_pass">Confirm Password</label>
							  <div class="controls">
								<input class="input-xlarge focused" id="c_pass" type="password"
                                 placeholder="Confirm Password" value="" name="c_pass">
							  </div>
							</div>
							<div class="form-actions">
							  <input type="submit" class="btn btn-primary" name="submit" value="Submit">
							  <input type="reset" class="btn" value="Reset">
							</div>
						  </fieldset>
						</form>  
						</div> 

					
	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div>
<?php
require_once("_footer.php");
?>
