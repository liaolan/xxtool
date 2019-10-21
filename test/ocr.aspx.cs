using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using TencentYoutuYun.SDK.Csharp;

public partial class test_ocr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string appid = "10108113";
		string secretId = "AKIDjjo3KgDjifV9b1RPUafr4PhuyulTdCDF";
		string secretKey = "KWXO8gCXhhcT8bsxsc9UddSJ1Xrytb7R";
		string userid = "xx";



		Conf.Instance().setAppInfo(appid, secretId, secretKey, userid, Conf.Instance().YOUTU_END_POINT);

		string path = System.IO.Directory.GetCurrentDirectory() + "\\test.jpg";
		string path2 = System.IO.Directory.GetCurrentDirectory() + "\\test.jpg";
		

		//result = Youtu.facecompare(path,path2);
		//Console.WriteLine(result);
		//Console.ReadKey();

		//// 人脸定位 调用demo
		//result = Youtu.faceshape(path);
		//Console.WriteLine(result);
		//Console.ReadKey();

		//result = Youtu.getpersonids("group");
		//Console.WriteLine(result);
		//Console.ReadKey();

		//// 名片OCR
		//path = System.IO.Directory.GetCurrentDirectory() + "\\ocr_card_01.jpg";
		//result = Youtu.bcocr(path);
		//Console.WriteLine(result);
		//Console.ReadKey();

		//// 通用OCR
		//path = System.IO.Directory.GetCurrentDirectory() + "\\icon_ocr_common01.png";
		//result = Youtu.generalocr(path);
		//Console.WriteLine(result);
		//Console.ReadKey();

		// 行驶证OCR
		path = System.IO.Directory.GetCurrentDirectory() + "\\d-1.jpg";
        //result = Youtu.driverlicenseocrurl("https://open.youtu.qq.com/app/img/experience/char_general/icon_ocr_xsz_02.jpg", 0);


		
		//Console.WriteLine(result);
		//Console.ReadKey();
		
		
		
    }


    protected void OCR_Button_Click(object sender, EventArgs e)
    {
        string result = string.Empty;
        Button but = (Button)sender;
        if (but.ID == "Button0")
        {
            TextBox1.Text = "";//清除TextBox1内容
        }
        else if (but.ID == "Button1")
        {
            if (TextBox1.Text == "")
            {
                TextBox1.Text = "https://open.youtu.qq.com/app/img/experience/char_general/icon_ocr_xsz_01.jpg";
            }
            result = Youtu.driverlicenseocrurl(TextBox1.Text, 0);//行驶证
        }
        else if(but.ID == "Button2")
        {
            if (TextBox1.Text == "")
            {
                TextBox1.Text = "https://open.youtu.qq.com/app/img/experience/char_general/icon_ocr_jsz_01.jpg";
            }
            result = Youtu.driverlicenseocrurl(TextBox1.Text, 1);//驾驶证
        }
        else if (but.ID == "Button3")
        {
            if (TextBox1.Text == "")
            {
                TextBox1.Text = "https://open.youtu.qq.com/app/img/experience/char_general/icon_id_01.jpg";
            }
            result = Youtu.idcardocrurl(TextBox1.Text, 0);//身份证
        }
        else if (but.ID == "Button4")
        {
            if (TextBox1.Text == "")
            {
                TextBox1.Text = "https://open.youtu.qq.com/app/img/experience/char_general/icon_namecard_01.jpg";
            }
            result = Youtu.bcocrurl(TextBox1.Text);//名片
        }
        else if (but.ID == "Button5")
        {
            if (TextBox1.Text == "")
            {
                TextBox1.Text = "https://yyb.gtimg.com/aiplat/static/ai-demo/large/o-1.jpg";
            }
            result = Youtu.generalocrurl(TextBox1.Text);//通用
        }
        else if (but.ID == "Button6")
        {
            if (TextBox1.Text == "")
            {
                TextBox1.Text = "https://open.youtu.qq.com/app/img/experience/char_general/icon_ocr_license_1.jpg";
            }
            result = Youtu.plateocrurl(TextBox1.Text);//车牌
        }	
        else if (but.ID == "Button7")
        {
            if (TextBox1.Text == "")
            {
                TextBox1.Text = "http://open.youtu.qq.com/app/img/experience/char_general/icon_ocr_card_1.jpg";
            }
            result = Youtu.creditcardocrurl(TextBox1.Text);//银行卡
        }		
        Image1.ImageUrl = TextBox1.Text;
        Image1.Width = 600;
        txtContent.Text = result;
    }
}

