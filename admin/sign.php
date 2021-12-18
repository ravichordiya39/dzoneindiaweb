<?php
	require_once("_header.php");
 	$functions->admin_acty('users page visited');
?>
<style>
	
	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap');
* {
    padding: 0;
    margin: 0;
    font-family: 'Poppins', sans-serif;
}

.flex-row {
    display: flex;
}
.wrapper {
    border: 1px solid #4b00ff;
    border-right: 0;
}
canvas#signature-pad {
    background: #fff;
    width: 100%;
    height: 100%;
    cursor: crosshair;
}
button#clear {
    height: 100%;
    background: #4b00ff;
    border: 1px solid transparent;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}
button#clear span {
    transform: rotate(90deg);
    display: block;
}

	
	
	
</style>
<div class="container-fluid-full">
	<div class="row-fluid">
		<?php require_once("_sidebar.php"); ?>
			<!-- start: Content -->
		<div id="content" class="span10">
            <ul class="breadcrumb">
				<li><i class="icon-home"></i><a href="dashboard.php">Home</a><i class="icon-angle-right"></i></li>
				<li><a href="#">Frenchise</a></li>
			</ul>
			
			<div class="row-fluid">		
				<div class="span4"></div>
				<div class="flex-row">
				   <div class="wrapper">
					   <canvas id="signature-pad" width="400" height="200"></canvas>
				   </div>
				   <div class="clear-btn">
					   <button id="clear"><span> Clear </span></button>
				   </div>
			   </div>

				<div class="span4"></div>
			</div>
			
		</div><!--/.fluid-container-->
	</div><!--/#content.span10-->
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.3.5/signature_pad.min.js" integrity="sha512-kw/nRM/BMR2XGArXnOoxKOO5VBHLdITAW00aG8qK4zBzcLVZ4nzg7/oYCaoiwc8U9zrnsO9UHqpyljJ8+iqYiQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
       var canvas = document.getElementById("signature-pad");

       function resizeCanvas() {
           var ratio = Math.max(window.devicePixelRatio || 1, 1);
           canvas.width = canvas.offsetWidth * ratio;
           canvas.height = canvas.offsetHeight * ratio;
           canvas.getContext("2d").scale(ratio, ratio);
       }
       window.onresize = resizeCanvas;
       resizeCanvas();

       var signaturePad = new SignaturePad(canvas, {
        backgroundColor: 'rgb(250,250,250)'
       });

       document.getElementById("clear").addEventListener('click', function(){
        signaturePad.clear();
       })
   </script>

<?php

require_once("_footer.php");

?>