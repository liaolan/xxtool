
Partial Class gghypt_mirror
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        DetailsView1.ChangeMode(DetailsViewMode.Insert)
        DetailsView2.ChangeMode(DetailsViewMode.Insert)
        DetailsView3.ChangeMode(DetailsViewMode.Insert)
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim sql_str, sql_base, sql_field, sql_value, sql_and As String
        Dim DDL_SI As Integer = DropDownList1.SelectedIndex
        sql_base = "SELECT [车牌号], [车牌颜色], [车主/业户], [联系人], [联系人手机]  FROM [carInfo] where "
        If DDL_SI <> 0 Then
            sql_and = " and " & "[手机验证状态]='" & DropDownList1.SelectedValue & "'"
        Else
            sql_and = ""
        End If
        If (TextBox1.Text <> "") Then
            sql_field = "[SIM卡卡号]='"
            sql_value = TextBox1.Text
        ElseIf (TextBox2.Text <> "") Then
            sql_field = "[车牌号]='"
            '↓去除不同的空格：最里面的是不正常的，外面的是正常的
            sql_value = Replace(Replace(TextBox2.Text, "	", ""), " ", "")
        ElseIf (TextBox3.Text <> "") Then
            sql_field = "[车辆识别代码/车架号]='"
            sql_value = TextBox3.Text
        ElseIf (TextBox4.Text <> "") Then
            sql_field = "[手机验证状态]='"
            sql_value = TextBox4.Text
        ElseIf (TextBox5.Text <> "") Then
            sql_field = "[车主/业户]='"
            sql_value = TextBox5.Text
        ElseIf (TextBox6.Text <> "") Then
            sql_field = "[联系人手机]='"
            sql_value = TextBox6.Text
        Else
            sql_field = "null"
            sql_value = "null"
        End If
        If (sql_field <> "null" And sql_value <> "null") Then
            sql_str = sql_base & sql_field & sql_value & "'" & sql_and
            SqlDataSource1.SelectCommand = sql_str

        Else
            SqlDataSource1.SelectCommand = "SELECT * FROM [carInfo]"

        End If


    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        SqlDataSource1.SelectCommand = "SELECT * FROM [carInfo]"
        DropDownList1.SelectedIndex = 1
    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Write("<script language='javascript'>")
        Response.Write("window.open('batch_query.aspx?id=77','newwindow','height=500,width=400,top=180,left=650,toolbar=no,menubar=no,scrollbar=yes,resizable=no,location=no,status=no');")
        Response.Write("</script>")
    End Sub
End Class
