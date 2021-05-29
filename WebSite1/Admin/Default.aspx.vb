
Partial Class Admin_Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim UserName As String = "admin"
        Dim Password As String = "admin"


        If TextBox1.Text = UserName.ToString And TextBox2.Text = Password.ToString Then
            Session("LoginAdmin") = "Ok"
            Response.Redirect("BillsHold.aspx")
        Else
            Lbmsg.Text = "Oturum açma verisinde hata "
            Lbmsg.ForeColor = Drawing.Color.Red
        End If
    End Sub


End Class
