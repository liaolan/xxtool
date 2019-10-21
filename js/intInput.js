//关于查询条件输入的一些初始化


//获取id为table_input的表格
var table_input = document.getElementById("table_input");
//获取表格中所有的TextBox
var tboxs = table_input.getElementsByTagName("input");
for (i = 0; i < tboxs.length; i++) {
	var tbox = tboxs[i];
	if (tboxs[i].type == "text") {
		//动态给当前TextBox注册点击事件
		tbox.onclick = int_Input;
	}
}

function int_Input() {
	for (var i = 0; i < tboxs.length; i++) {
		//若点击当前TextBox，则
		if (tboxs[i] == this) {
			if (tboxs[i].type == "text") {
				tboxs[i].setAttribute("class", "selectRow");
				//tboxs[i].value = "77777";
			}
		}
			//其他所有TextBox
		else {
			if (tboxs[i].type == "text") {
				tboxs[i].value = "";
				tboxs[i].removeAttribute("class", "selectRow");
			}
		}
	}
}
