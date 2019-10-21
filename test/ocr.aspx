<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ocr.aspx.cs" Inherits="test_ocr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id = "div1" runat="server">
		    <asp:TextBox ID="TextBox1" runat="server" Width="730px"></asp:TextBox>
            <asp:Button ID="Button0" runat="server" Text="清空" OnClick="OCR_Button_Click" Width="70px"/>
		    <br />
            <asp:Button ID="Button1" runat="server" Text="行驶证识别" OnClick="OCR_Button_Click" />
            <asp:Button ID="Button2" runat="server" Text="驾驶证识别" OnClick="OCR_Button_Click" />
            <asp:Button ID="Button3" runat="server" Text="身份证识别" OnClick="OCR_Button_Click" />
            <asp:Button ID="Button4" runat="server" Text="名片识别" OnClick="OCR_Button_Click" />
            <asp:Button ID="Button5" runat="server" Text="通用识别" OnClick="OCR_Button_Click" />
			<asp:Button ID="Button6" runat="server" Text="车牌识别" OnClick="OCR_Button_Click" />
			<asp:Button ID="Button7" runat="server" Text="银行卡识别" OnClick="OCR_Button_Click" />
            <br />
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Height="500px" Width="800px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Image ID="Image1" runat="server" />
                    </td>
                </tr>
		    </table>
        </div>
    </form>
</body>
</html>
