
Partial Class BillsHold
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") <> "Ok" Then
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridView1.RowDeleted
        Session.Remove("BillsID")
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e  As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Session.Remove("BillsID")
        Response.Redirect("BillOpen.aspx")
    End Sub
End Class
