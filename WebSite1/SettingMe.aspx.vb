Imports System.Data.SqlClient
Imports System.Data

Partial Class SettingMe
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") <> "Ok" Then
            Response.Redirect("Login.aspx")
        End If

        Try


            If Not IsPostBack Then
                Dim conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

                Dim sql As String = "SELECT * FROM TaUsers WHERE IDUser = @IDUser"

                conn.Open()
                Dim dt As DataTable = New DataTable()
                Dim adp As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(sql, conn)
                adp.SelectCommand.Parameters.AddWithValue("IDUser", Session("IDUser"))
                adp.Fill(dt)
                conn.Close()

                If dt.Rows.Count > 0 Then


                    Session("UserEmail") = dt.Rows(0)("UserEmail").ToString()
                    Session("UserPassword") = dt.Rows(0)("UserPassword").ToString()
                    Session("UserNicName") = dt.Rows(0)("UserNicName").ToString()


                    TextBoxEmail.Text = Session("UserEmail")
                    TextBoxPass1.Text = Session("UserPassword")
                    TextBoxPass2.Text = Session("UserPassword")

                    TextBoxNickName.Text = Session("UserNicName")

                End If



            End If


        Catch ex As Exception
            Lbmsg.Text = "Bilinmeyen bir hata"
            Lbmsg.ForeColor = Drawing.Color.Red

            Exit Sub
        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TextBoxPass1.Text <> "" And TextBoxPass2.Text <> "" Then
            'Şifre eşleşirse, uzantıdaki özel prosiger'a gidin
            If TextBoxPass1.Text = TextBoxPass2.Text Then

                Session("UserEmail") = TextBoxEmail.Text
                Session("UserPassword") = TextBoxPass1.Text
                Session("UserNicName") = TextBoxNickName.Text

                UpdateUser()
            Else
                'Uyumsuzluk durumunda, metin etiketinde bir hata mesajı görüntülenir
                Lbmsg.Text = " şifreler yanlış  "
                Lbmsg.ForeColor = Drawing.Color.Red
                Exit Sub
            End If

        Else



            Session("UserEmail") = TextBoxEmail.Text
            Session("UserNicName") = TextBoxNickName.Text
            UpdateUser()
        End If

    End Sub



    Public Sub UpdateUser()
        Try
            Dim conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

            Dim sql As String = "update TaUsers set UserEmail =@UserEmail , UserPassword =@UserPassword , UserNicName =@UserNicName where IDUser=@IDUser"

            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand(sql, conn)

            cmd.Parameters.AddWithValue("IDUser", Session("IDUser"))


            cmd.Parameters.AddWithValue("UserEmail", Session("UserEmail"))
            cmd.Parameters.AddWithValue("UserPassword", Session("UserPassword"))
            cmd.Parameters.AddWithValue("UserNicName", Session("UserNicName"))
           

            cmd.ExecuteScalar()
            conn.Close()


            Lbmsg.Text = "Değişiklikler başarıyla kaydedildi"
            Lbmsg.ForeColor = Drawing.Color.Blue
           

        Catch ex As Exception
            Lbmsg.ForeColor = Drawing.Color.Red
            Lbmsg.Text = "Bilinmeyen bir hata !"

        End Try
    End Sub
End Class
