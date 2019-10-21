//关于表格的一些初始化

function initEvent() {

    //获取id为GridView1的表格
    var tableCol = document.getElementById("GridView1");
    //获取表格中所有的行
    var trs = tableCol.getElementsByTagName("tr");
    //循环遍历所有行
    for (var i = 0; i < trs.length; i++) {
        var tr = trs[i];
        //动态给当前行注册点击事件
        tr.onclick = tronClick;
        //设置鼠标样式
        tr.style.cursor = "pointer";
    }
}


//GridView1里找td，车牌颜色为“蓝色”，则加上“BlueCarID”类
$("#GridView1").find("td").each(
	function (index, elem) {
		if (elem.innerHTML == "蓝色")
		{
			$(this).attr("class", "BlueCarID");
		}
	}
);


function tronClick() {
	if (localStorage.last_click_rid != "undefined") {
		if(this.getElementsByTagName("td")[0]){
			localStorage.now_click_rid = this.getElementsByTagName("td")[0].innerText;
		}
		//如果点的是同一行，则return
		if (localStorage.last_click_rid == localStorage.now_click_rid) {
			localStorage.last_click_rid = localStorage.now_click_rid;
			this.style.cursor = "text";
			return;
		}
		//如果点的不是同一行
		else {
			localStorage.last_click_rid = localStorage.now_click_rid;
		}
	} else {
		localStorage.last_click_rid = this.getElementsByTagName("td")[0].innerText;
		localStorage.now_click_rid = this.getElementsByTagName("td")[0].innerText;
	}


	var tableCol = document.getElementById("GridView1");
	var trs = tableCol.getElementsByTagName("tr");


	for (var i = 0; i < trs.length; i++) {
		//若点击当前行，则添加一个selectRow类
		if (trs[i] == this & i != 0 & i != trs.length-1 & i != trs.length-2) {

			//执行点击，使DetailView更新
			console.log(i);
			trs[i].children[6].children[0].click();
		}
		else if (trs[i] == this & i != 0 & (i != trs.length-1 | i != trs.length-2)){
		    this.setAttribute("class", "selectRow");
		    if (i < 26) {
                //临时解决方案
		        console.log(i);
		        trs[i].children[6].children[0].click();
		    }
		}
		else {
			//其他所有行则移除之前的selectRow类
			//trs[i].removeAttribute("class","selectRow")
		}
	}
}

