var DataMap="";
function SetValue(key,value){
	var Node = key+"*"+value;
	if(DataMap!=""){
		DataMap=DataMap+"$"+Node;
	}
	else{
		DataMap="data="+Node;
	}
}
function AjaxDataClear(){
	DataMap="";
}

function AjaxCall(){
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			//to do code
		}
	}
	xhttp.open("POST", "XMLHTTPServlet?" + DataMap, true);
	xhttp.send();
}