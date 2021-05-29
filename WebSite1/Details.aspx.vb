Imports System.Data.SqlClient
Imports System.Data

Partial Class Details
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load




        Try

            'İstek verilerini almak için aşağıdaki kod
            If Not String.IsNullOrEmpty(Request.QueryString("IDMeals")) Then
                Dim conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
                Dim sql As String = "SELECT * FROM TaMeals WHERE IDMeals = @IDMeals"
                conn.Open()
                Dim dt As DataTable = New DataTable()
                Dim adp As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(sql, conn)
                adp.SelectCommand.Parameters.AddWithValue("IDMeals", Request.QueryString("IDMeals"))
                adp.Fill(dt)
                conn.Close()

                If dt.Rows.Count > 0 Then
                    Session("NameMeals") = dt.Rows(0)("NameMeals").ToString()
                    Session("PriceMeals") = dt.Rows(0)("PriceMeals").ToString()

                    Me.Title = Session("NameMeals")
                End If


            Else
                Response.Redirect("Default.aspx")
            End If



        Catch ex As Exception
            Lbmsg.Text = "Bilinmeyen bir hata"
            Lbmsg.ForeColor = Drawing.Color.Red

            Exit Sub
        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If Session("BillsID") Is Nothing Then
            'Bir fatura olup olmadığını kontrol edin, faturanın yokluğunda kullanıcı yeni bir fatura açılış sayfasına aktarılır
            Response.Redirect("BillOpen.aspx")
        Else
            'Fatura durumunda, aşağıdaki kod yürütülür
            'Sipariş değerinin çıktısını çıkarmak için bir sonraki kod, gerekli sayıyla çarpılır
            Dim PrinceMeal As Decimal = Val(Session("PriceMeals"))
            Dim TotalN As Integer = Val(TextBoxTotal.Text)
            Dim CountPrince As Decimal
            CountPrince = PrinceMeal * TotalN
            Session("CountPrince") = CountPrince

            InsertNewMealsInBills()
            'Çıktı çıkarıldıktan sonra, emtia için Sipariş verileri faturaya eklenir

        End If

       



    End Sub


    Public Sub InsertNewMealsInBills()
        'Sipariş verilerini Tamamla faturada üyenin sipariş çıktısı ile kod Ekle

        Try

            'Veritabanına fatura eklemek için aşağıdaki kod
            Dim conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

            conn.Open()
            Dim sql As String = "INSERT INTO TaBillsMeals(BillsIDFKey, MealsName, MealsTotal, MealsPrice) VALUES(@BillsIDFKey, @MealsName, @MealsTotal, @MealsPrice) SELECT @@IDENTITY"
            Dim cmd As SqlCommand = New SqlCommand(sql, conn)



            cmd.Parameters.AddWithValue("@BillsIDFKey", Session("BillsID"))
            cmd.Parameters.AddWithValue("@MealsName", Session("NameMeals"))
            cmd.Parameters.AddWithValue("@MealsTotal", TextBoxTotal.Text)
            cmd.Parameters.AddWithValue("@MealsPrice", Session("CountPrince"))


            cmd.ExecuteScalar()

            conn.Close()



            Button1.Enabled = False
            Button1.Text = "Başarıyla eklendi"






        Catch ex As Exception
            Lbmsg.Text = "Bilinmeyen bir hata"
            Lbmsg.ForeColor = Drawing.Color.Red

        End Try
    End Sub
End Class
