<%@ Page Language="VB" AutoEventWireup="false" CodeFile="gghypt_mirror.aspx.vb" Inherits="gghypt_mirror" %>
<%@ Register TagPrefix="uc" TagName="navbar" Src="nav.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>平台车辆数据镜像</title>
    <link href="css/gghypt_mirror.css" rel="stylesheet" type="text/css" />
</head>
<%-- onload="initEvent()" --%>
<body onload="initEvent()">

    <form id="form1" runat="server" defaultbutton="Button1">

    <div>
        <div>
            <table id="table_input" style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="SIM卡号"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="车牌号"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="车架号"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="验证状态"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#DCF8A8">
                            <asp:ListItem Selected="True">全部</asp:ListItem>
                            <asp:ListItem>已验证</asp:ListItem>
                            <asp:ListItem>未验证</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="车主/业户"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Width="98%"></asp:TextBox>
			        </td>
                    <td>
			            <asp:Label ID="Label6" runat="server" Text="手机号"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" cssclass="ClassInAsp"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="操作时间s"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="操作时间e"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="重置" OnClick="Button2_Click" />               
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="批量查询" OnClick="Button3_Click" Enabled="False" Visible="False" />
                    </td>
                    <td class="td_tips" colspan="3">数据更新：【货运平台--2017.12.02】 【过检平台--2017.12.02】</td>
                    <td class="td_sms" colspan="1">
                        <%--<asp:Button ID="Button4" runat="server" Text="上线短信" />--%>
                        <input id="Button4" type="button" value="上线短信" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="kong">
        </div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td rowspan="2" colspan="2" class="auto-style2" ><%--valign="top"--%>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="25" DataKeyNames="车牌号" Width="95%" PagerSettings-Mode="NumericFirstLast" >
                            <PagerSettings PageButtonCount="7" FirstPageText="首页" LastPageText="尾页"  NextPageText="下页"  PreviousPageText="上页" />
                            <Columns>
                                <asp:TemplateField HeaderText="序号">  
                                    <ItemTemplate>  
                                        <%#(Container.DataItemIndex + 1).ToString()%>
                                    </ItemTemplate>  
                                    <ItemStyle HorizontalAlign="Center" />  
                                </asp:TemplateField>
                                <asp:BoundField DataField="车牌号" HeaderText="车牌号" SortExpression="车牌号" />
                                <asp:BoundField DataField="车牌颜色" HeaderText="车牌颜色" SortExpression="车牌颜色" />
                                <asp:BoundField DataField="车主/业户" HeaderText="车主/业户" SortExpression="车主/业户" />
                                <asp:BoundField DataField="联系人" HeaderText="联系人" SortExpression="联系人" />
                                <asp:BoundField DataField="联系人手机" HeaderText="联系人手机" SortExpression="联系人手机" />
                                <asp:CommandField HeaderText="货运信息" SelectText="右上↗" ShowHeader="True" ShowSelectButton="True" />
                                <asp:CommandField HeaderText="过检信息" SelectText="右下↘" ShowHeader="True" ShowSelectButton="True" />
                            </Columns>
                            <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NumericFirstLast" NextPageText="下页" PageButtonCount="7" PreviousPageText="上页"></PagerSettings>
                            <SelectedRowStyle BackColor="#DCF8A8" />
                        </asp:GridView>
                    </td>

                    <td class="auto-style3" ><%--取消valign="top"，在CSS里指定vertical-align: text-top;--%>
                        <asp:DetailsView ID="DetailsView1" runat="server" Width="100%" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Font-Size="Medium">                          
                            <Fields>
                                <asp:BoundField DataField="车牌号" HeaderText="车牌号" SortExpression="车牌号" />
                                <asp:BoundField DataField="车主/业户" HeaderText="车主/业户" SortExpression="车主/业户" />
                                <asp:BoundField DataField="联系人手机" HeaderText="联系人手机" SortExpression="联系人手机" />
                                <asp:BoundField DataField="SIM卡卡号" HeaderText="SIM卡卡号" SortExpression="SIM卡卡号" />
                                <asp:BoundField DataField="终端型号" HeaderText="终端型号" SortExpression="终端型号" />
                                <asp:BoundField DataField="服务合同到期时间" HeaderText="服务合同到期时间" SortExpression="服务合同到期时间" />
                                <asp:BoundField DataField="执照上传数" HeaderText="执照上传数" SortExpression="执照上传数" />
                                <asp:BoundField DataField="车身颜色" HeaderText="车身颜色" SortExpression="车身颜色" />
                                <asp:BoundField DataField="经营范围" HeaderText="经营范围" SortExpression="经营范围" />
                                <asp:BoundField DataField="车辆购置方式" HeaderText="车辆购置方式" SortExpression="车辆购置方式" />
                                <asp:BoundField DataField="道路运输证号" HeaderText="道路运输证号" SortExpression="道路运输证号" />
                                <asp:BoundField DataField="所属省" HeaderText="所属省" SortExpression="所属省" />
                                <asp:BoundField DataField="所属市" HeaderText="所属市" SortExpression="所属市" />
                                <asp:BoundField DataField="所属县" HeaderText="所属县" SortExpression="所属县" />                             
                                                               
<%--                                <asp:BoundField DataField="首次上线时间" HeaderText="首次上线时间" SortExpression="首次上线时间" />
                                <asp:BoundField DataField="车辆类型" HeaderText="车辆类型" SortExpression="车辆类型" />
                                <asp:BoundField DataField="车辆品牌" HeaderText="车辆品牌" SortExpression="车辆品牌" />
                                <asp:BoundField DataField="车辆型号" HeaderText="车辆型号" SortExpression="车辆型号" />
                                <asp:BoundField DataField="总质量(kg)" HeaderText="总质量(kg)" SortExpression="总质量(kg)" />
                                <asp:BoundField DataField="核定载质量(kg)" HeaderText="核定载质量(kg)" SortExpression="核定载质量(kg)" />
                                <asp:BoundField DataField="发动机型号" HeaderText="发动机型号" SortExpression="发动机型号" />--%>
                                <asp:BoundField DataField="发动机号" HeaderText="发动机号" SortExpression="发动机号" />
                            </Fields>
                        </asp:DetailsView>
                    </td>

                    <td class="auto-style4" ><%--取消valign="top"，在CSS里指定vertical-align: text-top;--%>
                        <asp:DetailsView ID="DetailsView2" runat="server" Width="100%" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Font-Size="Medium">
                            <Fields>
                                <asp:BoundField DataField="车辆识别代码/车架号" HeaderText="车辆识别代码/车架号" SortExpression="车辆识别代码/车架号" />
                                <asp:BoundField DataField="联系人" HeaderText="联系人" SortExpression="联系人" />
                                <asp:BoundField DataField="手机验证状态" HeaderText="手机验证状态" SortExpression="手机验证状态" />
                                <asp:BoundField DataField="终端ID" HeaderText="终端ID" SortExpression="终端ID" />
                                <asp:BoundField DataField="终端厂商名称" HeaderText="终端厂商名称" SortExpression="终端厂商名称" />

                                <asp:BoundField DataField="车牌颜色" HeaderText="车牌颜色" SortExpression="车牌颜色" />
                                
                                <asp:BoundField DataField="准牵引总质量(kg)" HeaderText="准牵引总质量(kg)" SortExpression="准牵引总质量(kg)" />
                                <asp:BoundField DataField="外廓尺寸-长(mm)" HeaderText="外廓尺寸-长(mm)" SortExpression="外廓尺寸-长(mm)" />
                                <asp:BoundField DataField="外廓尺寸-宽(mm)" HeaderText="外廓尺寸-宽(mm)" SortExpression="外廓尺寸-宽(mm)" />
                                <asp:BoundField DataField="外廓尺寸-高(mm)" HeaderText="外廓尺寸-高(mm)" SortExpression="外廓尺寸-高(mm)" />
                                <asp:BoundField DataField="货厢内部尺寸-长(mm)" HeaderText="货厢内部尺寸-长(mm)" SortExpression="货厢内部尺寸-长(mm)" />
                                <asp:BoundField DataField="货厢内部尺寸-宽(mm)" HeaderText="货厢内部尺寸-宽(mm)" SortExpression="货厢内部尺寸-宽(mm)" />
                                <asp:BoundField DataField="货厢内部尺寸-高(mm)" HeaderText="货厢内部尺寸-高(mm)" SortExpression="货厢内部尺寸-高(mm)" />
<%--                                <asp:BoundField DataField="轴数" HeaderText="轴数" SortExpression="轴数" />
                                <asp:BoundField DataField="轮胎数" HeaderText="轮胎数" SortExpression="轮胎数" />
                                <asp:BoundField DataField="轮胎规格" HeaderText="轮胎规格" SortExpression="轮胎规格" />
                                <asp:BoundField DataField="车辆出厂日期" HeaderText="车辆出厂日期" SortExpression="车辆出厂日期" />
                                
                                
                                <asp:BoundField DataField="道路运输经营许可证号" HeaderText="道路运输经营许可证号" SortExpression="道路运输经营许可证号" />
                                
                                <asp:BoundField DataField="车辆保险到期时间" HeaderText="车辆保险到期时间" SortExpression="车辆保险到期时间" />--%>
                                <asp:BoundField DataField="检验有效期至" HeaderText="检验有效期至" SortExpression="检验有效期至" />
                                <asp:BoundField DataField="行驶证发证日期" HeaderText="行驶证发证日期" SortExpression="行驶证发证日期" />
                                
                                
                            </Fields>
                        </asp:DetailsView>
                    </td>

                </tr>
                    <td valign="top" colspan="2">
                        <asp:DetailsView ID="DetailsView3" runat="server" Width="100%" Height="100px" AutoGenerateRows="False" DataSourceID="Sql_DS_x0775_GPS_VEHICLE" Font-Size="Medium" DataKeyNames="LICENSE_PLATE" Font-Bold="False">
                            <Fields>
                                <asp:BoundField DataField="LICENSE_PLATE" HeaderText="车牌号码" SortExpression="LICENSE_PLATE" />
                                <asp:BoundField DataField="GPS_DEVICE_NO" HeaderText="设备编号" SortExpression="GPS_DEVICE_NO" />
                                <asp:BoundField DataField="COMPANY_NAME" HeaderText="公司名称" SortExpression="COMPANY_NAME" />
                                <asp:BoundField DataField="INSTALL_POSITION" HeaderText="安装点" SortExpression="INSTALL_POSITION" />
								<asp:BoundField DataField="FIRST_CONTACT" HeaderText="第一联系人" SortExpression="FIRST_CONTACT" />
								<asp:BoundField DataField="FIRST_CONTACT_PHONE" HeaderText="第一联系人电话" SortExpression="FIRST_CONTACT_PHONE" />
								<asp:BoundField DataField="SECOND_CONTACT" HeaderText="第二联系人" SortExpression="SECOND_CONTACT" />
								<asp:BoundField DataField="SECOND_CONTACT_PHONE" HeaderText="第二联系人电话" SortExpression="SECOND_CONTACT_PHONE" />
								<asp:BoundField DataField="REMARKS" HeaderText="备注" SortExpression="REMARKS" />
                            </Fields>
                        </asp:DetailsView>                        
                    </td>
                </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gghypt.net_mirrorConnectionString %>" SelectCommand="SELECT [车牌号], [车牌颜色], [车主/业户], [联系人], [联系人手机] FROM [carInfo]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gghypt.net_mirrorConnectionString %>" SelectCommand="SELECT * FROM [carInfo] WHERE ([车牌号] = @车牌号)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="{1}" Name="车牌号" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Sql_DS_x0775_GPS_VEHICLE" runat="server" ConnectionString="<%$ ConnectionStrings:gghypt.net_mirrorConnectionString %>" SelectCommand="SELECT [LICENSE_PLATE], [COMPANY_NAME], [INSTALL_POSITION], [GPS_DEVICE_NO],FIRST_CONTACT,FIRST_CONTACT_PHONE,SECOND_CONTACT,SECOND_CONTACT_PHONE,REMARKS FROM [GPS_VEHICLE_withCompanyName] WHERE ([LICENSE_PLATE] LIKE '%' + @LICENSE_PLATE + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="{1}" Name="LICENSE_PLATE" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <hr />
    <uc:navbar ID="Navbar1" runat="server"/> 
    </form>

    <%-- 引入jquery.js --%>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <%-- 点击变色效果js --%>
    <script src="js/intTable.js"></script>
    <%-- 条件查询相关js --%>
    <script src="js/intInput.js"></script>
    <%-- 批量查询相关js --%>
    <script src="js/batch_query.js"></script>
    <%-- 上线短信相关js --%>
    <script src="js/sms.js"></script>
</body>
</html>
