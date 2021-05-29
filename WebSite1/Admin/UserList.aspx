<%@ Page Title="Üye yönetimi" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="UserList.aspx.vb" Inherits="Admin_UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style2">
    <tr>
        <td align="center" bgcolor="#F4F4F4">
            <asp:Label ID="Lbmsg" runat="server" Text="Üye yönetimi"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyNames="IDUser" DataSourceID="SqlDataSource1" 
                    EmptyDataText="Şu anda üye yok." EnableModelValidation="True" 
                Width="100%">
                <Columns>
                    <asp:BoundField DataField="IDUser" HeaderText="numara" InsertVisible="False" 
                            ReadOnly="True" SortExpression="IDUser" />
                    <asp:BoundField DataField="UserEmail" HeaderText="E-posta" 
                            SortExpression="UserEmail"></asp:BoundField>
                    <asp:BoundField DataField="UserPassword" HeaderText="şifre" 
                            SortExpression="UserPassword" />
                    <asp:BoundField DataField="UserNicName" HeaderText="üye adı" 
                            SortExpression="UserNicName" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Delete" onclientclick="return confirm('Gerçekten silmek istiyormusunuz?')" 
                                Text="sil"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM [TaUsers] WHERE [IDUser] = @IDUser" 
                    InsertCommand="INSERT INTO [TaUsers] ([UserEmail], [UserPassword], [UserNicName]) VALUES (@UserEmail, @UserPassword, @UserNicName)" 
                    SelectCommand="SELECT * FROM [TaUsers] ORDER BY [IDUser] DESC" 
                    
                UpdateCommand="UPDATE [TaUsers] SET [UserEmail] = @UserEmail, [UserPassword] = @UserPassword, [UserNicName] = @UserNicName WHERE [IDUser] = @IDUser">
                <DeleteParameters>
                    <asp:Parameter Name="IDUser" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UserEmail" Type="String" />
                    <asp:Parameter Name="UserPassword" Type="String" />
                    <asp:Parameter Name="UserNicName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="UserEmail" Type="String" />
                    <asp:Parameter Name="UserPassword" Type="String" />
                    <asp:Parameter Name="UserNicName" Type="String" />
                    <asp:Parameter Name="IDUser" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td align="center">
                &nbsp;</td>
    </tr>
    <tr>
        <td align="center">
                &nbsp;</td>
    </tr>
</table>
</asp:Content>

