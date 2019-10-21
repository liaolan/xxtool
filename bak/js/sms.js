var thisIP = "192.168.0.127";
var btn_sms = document.getElementById("Button4");
btn_sms.onclick=open_smsUrl;

function open_smsUrl(){
	var DetailsView1 = document.getElementById("DetailsView1");
	var DetailsView2 = document.getElementById("DetailsView2");

	var num = DetailsView1.childNodes[1].childNodes[0].childNodes[2].innerText;
	var vel = DetailsView2.childNodes[1].childNodes[0].childNodes[2].innerText;
	var id = DetailsView2.childNodes[1].childNodes[3].childNodes[2].innerText;
	var sim = DetailsView1.childNodes[1].childNodes[3].childNodes[2].innerText;
	// console.log(num);
	// console.log(vel);
	// console.log(id);
	// console.log(sim);

	var num_kv = "num="+num+"&";
	var vel_kv = "vel="+vel+"&";
	var id_kv = "id="+id+"&";
	var sim_kv = "sim="+sim+"&";

	var vk_str = num_kv+vel_kv+id_kv+sim_kv;

	window.open("http://"+thisIP+"/test/sms.html?"+vk_str);
}