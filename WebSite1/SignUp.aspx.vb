Imports System.Data.SqlClient

Partial Class SignUp
    Inherits System.Web.UI.Page



    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If TextBoxPass1.Text = TextBoxPass2.Text Then
            'Şifre eşleşirse, uzantıdaki özel prosiger'a gidin
            InsertNewUser()
        Else

            'Uyumsuzluk durumunda, metin etiketinde bir hata mesajı görüntülenir
            Lbmsg.Text = "şifreler yanlış "
            Lbmsg.ForeColor = Drawing.Color.Red
            Exit Sub
        End If


    End Sub


    Public Sub InsertNewUser()
        Try
            Dim conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

            conn.Open()
            Dim sql As String = "INSERT INTO TaUsers(UserEmail, UserPassword, UserNicName) VALUES(@UserEmail, @UserPassword, @UserNicName) SELECT @@IDENTITY"
            Dim cmd As SqlCommand = New SqlCommand(sql, conn)

            cmd.Parameters.AddWithValue("@UserEmail", TextBoxEmail.Text.ToString)
            cmd.Parameters.AddWithValue("@UserPassword", TextBoxPass1.Text.ToString)
            cmd.Parameters.AddWithValue("@UserNicName", TextBoxNickName.Text.Trim)

            cmd.ExecuteScalar()
            conn.Close()


            Session("NewUser") = "Kayıt işlemi başarılı oldu"
            Response.Redirect("Login.aspx")

        Catch ex As Exception
            Lbmsg.Text = "Hata bu e-posta başkası tarafından kullanılabilir"
            Lbmsg.ForeColor = Drawing.Color.Red

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
      
    End Sub
End Class
