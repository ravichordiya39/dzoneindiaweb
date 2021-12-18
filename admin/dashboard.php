<?php 
	require_once("_header.php");
?>
<style>
	.span3{
		height: 100px;
	}
	.span3 a {
		color: #fff;
		font-size: 11px;
		float: right
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
				<li><a href="#">Dashboard</a></li>
			</ul>
		<!--	<div class="row-fluid">
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
					<div style="font-size: 30px;"><?= $functions->get_count_all('users','id'); ?> <i class="icon-arrow-up"></i></div>
					<div class="title">Total Users
					<div><a href="<?php echo "http://" . $_SERVER['SERVER_NAME'];  ?>/Vedik/admin/users_all">View More</a></div>
					</div>
					
				</div>
				
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
					<div style="font-size: 30px;"><?= $functions->get_count('users','status','Active','id'); ?> <i class="icon-arrow-up"></i></div>
					<div class="title">Total Active Users
						
					<div><a href="<?php echo "http://" . $_SERVER['SERVER_NAME'];  ?>/Vedik/admin/users?status=Active">View More</a></div>
					</div>
				</div>
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
					<div style="font-size: 30px;"><?= $functions->get_count('users','status','Pending','id'); ?> <i class="icon-arrow-left"></i></div>
					<div class="title">Total Pending Users
					<div><a href="<?php echo "http://" . $_SERVER['SERVER_NAME'];  ?>/Vedik/admin/users?status=Pending">View More</a></div>
					</div>
				</div>
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
					<div style="font-size: 30px;"><?= $functions->get_count('users','status','Suspended','id'); ?> <i class="icon-arrow-left"></i></div>
					<div class="title">Total Suspended Users
					<div><a href="<?php echo "http://" . $_SERVER['SERVER_NAME'];  ?>/Vedik/admin/users?status=Suspended">View More</a></div>
					</div>
				</div>
				
			</div> -->
			<?php
			/*$res1 = $functions->get_rate();
			echo 0.5/$res1['ETH'];*/
			// $res =$functions->GetBalances();			
			?>
				
		</div>
	</div>
</div>

<?php

require_once("_footer.php");

?>

