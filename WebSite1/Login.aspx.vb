Imports System.Data.SqlClient
Imports System.Data

Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelComplite.Text = Session("NewUser")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

        Dim sql As String = "SELECT * FROM Users WHERE UserEmail = @UserEmail"

        conn.Open()
        Dim dt As DataTable = New DataTable()
        Dim adp As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(sql, conn)
        adp.SelectCommand.Parameters.AddWithValue("UserEmail", TextBoxEmail.Text.ToString)
        adp.Fill(dt)
        conn.Close()

        If dt.Rows.Count > 0 Then
            'Aşağıdaki kodlar veritabanından Sishen alanlarını doldurur
            Session("UserEmail") = dt.Rows(0)("UserEmail").ToString()
            Session("UserPassword") = dt.Rows(0)("UserPassword").ToString()
         
            'Posta bulunursa, şifre ve kullanıcı verileri doldurulur
            'Daha sonra koşul cümlesi, aşağıdaki kod aracılığıyla şifrenin geçerliliğine uygulanır
            If Session("UserPassword").ToString = TextBoxPass1.Text.ToString Then
                Session("Login") = "Ok"
                Session("UserNicName") = dt.Rows(0)("UserNicName").ToString()
                Response.Redirect("Default.aspx")
            Else
                Lbmsg.Text = "Şifre yanlış"
                Lbmsg.ForeColor = Drawing.Color.Red
                Exit Sub
            End If



        Else
            'Aramada herhangi bir sonuç olmaması durumunda
            Lbmsg.Text = "Bilinmeyen bir hata"
            Lbmsg.ForeColor = Drawing.Color.Red
            Exit Sub
        End If
    End Sub
End Class
