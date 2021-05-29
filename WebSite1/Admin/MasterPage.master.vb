
Partial Class Admin_MasterPage
    Inherits  System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoginAdmin") <> "Ok" Then
            Response.Redirect("Default.aspx")
        End If
    End Sub
End Class

