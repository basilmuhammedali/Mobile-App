Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class Admin_MealsEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not String.IsNullOrEmpty(Request.QueryString("IDMeals")) Then
                If Not IsPostBack Then
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

                        DropListIDVarieties.SelectedValue = dt.Rows(0)("IDVarietiesFKey").ToString()
                        TextBoxNameMeals.Text = dt.Rows(0)("NameMeals").ToString()
                        TextBoxTypeMeals.Text = dt.Rows(0)("TypeMeals").ToString()
                        TextBoxPriceMeals.Text = dt.Rows(0)("PriceMeals").ToString()
                        TextBoxDetailsMeals.Text = dt.Rows(0)("DetailsMeals").ToString()
                        Image1.ImageUrl = dt.Rows(0)("ImageMeals").ToString()
                        Session("ImageURL") = dt.Rows(0)("ImageMeals").ToString()

                    End If



                End If

            End If
        Catch ex As Exception
            Lbmsg.Text = "hata"
            Lbmsg.ForeColor = Drawing.Color.Red

            Exit Sub
        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If FileUpload1.HasFile Then
            Dim theFileName As String = Path.Combine(Server.MapPath("~/ImageUpload/"), Date.Now.ToString("yyyyMMddHHhhmmss") + ".jpg")
            FileUpload1.SaveAs(theFileName)
            Session("ImageURL") = "~/ImageUpload/" + Date.Now.ToString("yyyyMMddHHhhmmss") + ".jpg"
            SaveMeals()
        Else

            SaveMeals()
        End If
    End Sub



    Public Sub SaveMeals()
        Try
            Dim conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

            Dim sql As String = "update TaMeals set IDVarietiesFKey =@IDVarietiesFKey , NameMeals =@NameMeals , TypeMeals =@TypeMeals , PriceMeals =@PriceMeals , ImageMeals =@ImageMeals , DetailsMeals =@DetailsMeals where IDMeals=@IDMeals"

            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand(sql, conn)

            cmd.Parameters.AddWithValue("IDMeals", Request.QueryString("IDMeals"))

            cmd.Parameters.AddWithValue("IDVarietiesFKey", DropListIDVarieties.SelectedItem.Value)
            cmd.Parameters.AddWithValue("NameMeals", TextBoxNameMeals.Text.Trim)
            cmd.Parameters.AddWithValue("TypeMeals", TextBoxTypeMeals.Text.Trim)
            cmd.Parameters.AddWithValue("PriceMeals", TextBoxPriceMeals.Text.Trim)
            cmd.Parameters.AddWithValue("ImageMeals", Session("ImageURL"))
            cmd.Parameters.AddWithValue("DetailsMeals", TextBoxDetailsMeals.Text.Trim)
          

            cmd.ExecuteScalar()
            conn.Close()


            Lbmsg.Text = "Değişiklikler başarıyla kaydedildi"
            Lbmsg.ForeColor = Drawing.Color.Blue
            Image1.ImageUrl = Session("ImageURL")


        Catch ex As Exception
            Lbmsg.ForeColor = Drawing.Color.Red
            Lbmsg.Text = "hata !"

        End Try
    End Sub



End Class
