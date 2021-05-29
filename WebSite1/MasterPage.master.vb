
Partial Class MasterPage
    Inherits  System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") = "Ok" Then
            Panel1.Visible = False
            Panel2.Visible = True
            LbName.Text = Session("UserNicName")
        Else
            Panel1.Visible = True
            Panel2.Visible = False
        End If
    End Sub
End Class

