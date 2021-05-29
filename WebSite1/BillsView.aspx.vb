Imports System.Data.SqlClient
Imports System.Data

Partial Class BillsView
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") <> "Ok" Then
            Response.Redirect("Login.aspx")
        End If

        GetTotal()
    End Sub


    Public Sub GetTotal()
        Try


            'Bu prosiger, satılan malların fatura numarasını içeren kayıtları geri çeker ve fatura değerini görüntülemek için fiyatlarını toplar
            Dim GV As New GridView
            Dim conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

            Dim sql As String = "SELECT * FROM TaBillsMeals WHERE BillsIDFKey = @BillsIDFKey"

            conn.Open()
            Dim dt As DataTable = New DataTable()
            Dim adp As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(sql, conn)
            adp.SelectCommand.Parameters.AddWithValue("BillsIDFKey", Request.QueryString("BillsID"))

            adp.Fill(dt)
            conn.Close()

            GV.DataSource = dt
            GV.DataBind()


            Dim sum As Double = 0
            For index As Integer = 0 To GV.Rows.Count - 1
                sum += (GV.Rows(index).Cells(4).Text)
            Next
            Label1.Text = "Fatura değeri:" + " " + sum.ToString()

        Catch ex As Exception
            Label1.Text = "Hata ilk fatura belirlenmelidir"
            Exit Sub
        End Try

    End Sub
End Class
