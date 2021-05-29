Imports System.Data.SqlClient

Partial Class BillOpen
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'giriş doğrulaması 

        If Session("Login") <> "Ok" Then
            Response.Redirect("Login.aspx")
        End If


        'açık bir fatura  doğrulaması
        If Session("BillsID") Is Nothing Then
            'fatura yoksa yeni bir fatura iste yada yeni bir sipariş iste
            Lbmsg.Text = "yeni bir sipariş"
            Lbmsg.ForeColor = Drawing.Color.Black
            Button1.Enabled = True
            LinkButton1.Visible = False
        Else
            'fatura varsa yeni fatura kapatlacak 
            Lbmsg.Text = "yeni bir fatura açamasınız çünkü faturayı doğrulamadınız"
            Lbmsg.ForeColor = Drawing.Color.Red
            LinkButton1.Visible = True
            Button1.Enabled = False
            Exit Sub
        End If

        '1- 3 saat arasında bu işlem yapabilirsiniz
        '3 saat içinde düzenlebilirsiniz
        TextBoxDeliveryDate.Text = Date.Now.ToString("yyyy/MM/dd")
        TextBoxDeliveryTime.Text = Date.Now.AddHours(3).ToString("hh:mm")

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try

            'bu kod yeni bir fatura eklemek için
            Dim conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

            conn.Open()
            Dim sql As String = "INSERT INTO TaBills(UserID, BillsDate, BillsTime, DeliveryDate, DeliveryTime, MoreNote) VALUES(@UserID, @BillsDate, @BillsTime, @DeliveryDate, @DeliveryTime, @MoreNote) SELECT SCOPE_IDENTITY()"
            Dim cmd As SqlCommand = New SqlCommand(sql, conn)



            cmd.Parameters.AddWithValue("@UserID", Session("IDUser"))
            cmd.Parameters.AddWithValue("@BillsDate", Date.Now.ToString("yyyy/MM/dd"))
            cmd.Parameters.AddWithValue("@BillsTime", Date.Now.ToString("hh:mm"))
            cmd.Parameters.AddWithValue("@DeliveryDate", TextBoxDeliveryDate.Text.Trim)
            cmd.Parameters.AddWithValue("@DeliveryTime", TextBoxDeliveryTime.Text.Trim)
            cmd.Parameters.AddWithValue("@MoreNote", TextBoxMoreNote.Text.Trim)
          


            Session("BillsID") = cmd.ExecuteScalar

            conn.Close()



            Response.Redirect("Default.aspx")





        Catch ex As Exception
            Lbmsg.Text = "bilinmeyen hata"
            Lbmsg.ForeColor = Drawing.Color.Red

        End Try
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Session.Remove("BillsID")
    End Sub
End Class
