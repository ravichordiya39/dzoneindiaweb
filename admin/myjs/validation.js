
function checkAll(){
	count = document.getElementById("hd").value;
	var arr = new Array(count);
	for(var i = 0; i < count; i++){
		arr[i] = "sms" + (i+1);
	}
	if(document.getElementById("main_check").checked){
		//check all check boxes
		for(i = 0; i < count; i++){
			var name = arr[i];
			name = "" + name + "";
			document.getElementById(name).checked = true;
		}
	}else{
		//uncheck all check boxes
		for(i = 0; i < count; i++){
			var name = arr[i];
			name = "" + name + "";
			document.getElementById(name).checked = false;
		}
	}
}