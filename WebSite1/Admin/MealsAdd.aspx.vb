Imports System.IO
Imports System.Data.SqlClient

Partial Class Admin_MealsAdd
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If FileUpload1.HasFile Then
            Dim theFileName As String = Path.Combine(Server.MapPath("~/ImageUpload/"), Date.Now.ToString("yyyyMMddHHhhmmss") + ".jpg")
            FileUpload1.SaveAs(theFileName)
            Session("ImageURL") = "~/ImageUpload/" + Date.Now.ToString("yyyyMMddHHhhmmss") + ".jpg"

            InsertMeals()
        Else
            Session("ImageURL") = "~/Image/NoImage.png"
            InsertMeals()
        End If
    End Sub



    Public Sub InsertMeals()
        Try
            Dim conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

            conn.Open()
            Dim sql As String = "INSERT INTO TaMeals(IDVarietiesFKey, NameMeals, TypeMeals, PriceMeals, ImageMeals, DetailsMeals) VALUES(@IDVarietiesFKey, @NameMeals, @TypeMeals, @PriceMeals, @ImageMeals, @DetailsMeals) SELECT @@IDENTITY"
            Dim cmd As SqlCommand = New SqlCommand(sql, conn)

            cmd.Parameters.AddWithValue("@IDVarietiesFKey", DropListIDVarieties.SelectedItem.Value)
            cmd.Parameters.AddWithValue("@NameMeals", TextBoxNameMeals.Text.ToString)
            cmd.Parameters.AddWithValue("@TypeMeals", TextBoxTypeMeals.Text.Trim)
            cmd.Parameters.AddWithValue("@PriceMeals", TextBoxPriceMeals.Text.Trim)
            cmd.Parameters.AddWithValue("@ImageMeals", Session("ImageURL").ToString)
            cmd.Parameters.AddWithValue("@DetailsMeals", TextBoxDetailsMeals.Text.Trim)
           
            cmd.ExecuteScalar()
            conn.Close()


            Response.Redirect("MealsList.aspx")

        Catch ex As Exception
            Lbmsg.Text = "Bilinmeyen bir hata "
            Lbmsg.ForeColor = Drawing.Color.Red

        End Try
    End Sub


End Class
