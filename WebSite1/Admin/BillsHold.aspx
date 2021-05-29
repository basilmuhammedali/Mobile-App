<%@ Page Title="Bekleyen faturalar ve Siparişler" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="BillsHold.aspx.vb" Inherits="Admin_BillsHold" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style2">
        <tr>
            <td align="center" bgcolor="#F4F4F4">
                <asp:Label ID="Lbmsg" runat="server" Text="Talepler ve faturalar beklemede"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataKeyNames="BillsID,IDUser" DataSourceID="SqlDataSource1" 
                    EmptyDataText="Şu anda emir yok." EnableModelValidation="True">
                    <Columns>
                        <asp:BoundField DataField="BillsID" HeaderText="Fatura / sipariş numarası" 
                            InsertVisible="False" ReadOnly="True" SortExpression="BillsID" />
                        <asp:BoundField DataField="BillsDate" HeaderText="Fatura açılış tarihi" 
                            SortExpression="BillsDate" />
                        <asp:BoundField DataField="BillsTime" HeaderText="Fatura açılış zamanı" 
                            SortExpression="BillsTime" />
                        <asp:BoundField DataField="DeliveryDate" HeaderText="Teslim tarihi" 
                            SortExpression="DeliveryDate" />
                        <asp:BoundField DataField="DeliveryTime" HeaderText="Teslim zamanı" 
                            SortExpression="DeliveryTime" />
                        <asp:BoundField DataField="UserNicName" HeaderText="Kullanıcı adı" 
                            SortExpression="UserNicName" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink11" runat="server" Font-Underline="False" 
                                    NavigateUrl='<%# Eval("BillsID", "BillsView.aspx?BillsID={0}") %>' 
                                    style="color: #FF0000">Ayrıntı</asp:HyperLink>
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
                    DeleteCommand="DELETE FROM [TaBills] WHERE [BillsID] = @BillsID" 
                    InsertCommand="INSERT INTO [TaBills] ([UserID], [BillsDate], [BillsTime], [DeliveryDate], [DeliveryTime], [MoreNote], [ISOK]) VALUES (@UserID, @BillsDate, @BillsTime, @DeliveryDate, @DeliveryTime, @MoreNote, @ISOK)" 
                    SelectCommand="SELECT TaBills.BillsID, TaBills.UserID, TaBills.BillsDate, TaBills.BillsTime, TaBills.DeliveryDate, TaBills.DeliveryTime, TaBills.MoreNote, TaBills.ISOK, TaUsers.IDUser, TaUsers.UserNicName FROM TaBills LEFT OUTER JOIN TaUsers ON TaBills.UserID = TaUsers.IDUser WHERE (TaBills.ISOK = @ISOK) ORDER BY TaBills.BillsID DESC" 
                    
                    UpdateCommand="UPDATE [TaBills] SET [UserID] = @UserID, [BillsDate] = @BillsDate, [BillsTime] = @BillsTime, [DeliveryDate] = @DeliveryDate, [DeliveryTime] = @DeliveryTime, [MoreNote] = @MoreNote, [ISOK] = @ISOK WHERE [BillsID] = @BillsID">
                    <DeleteParameters>
                        <asp:Parameter Name="BillsID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="UserID" Type="Int32" />
                        <asp:Parameter Name="BillsDate" Type="String" />
                        <asp:Parameter Name="BillsTime" Type="String" />
                        <asp:Parameter Name="DeliveryDate" Type="String" />
                        <asp:Parameter Name="DeliveryTime" Type="String" />
                        <asp:Parameter Name="MoreNote" Type="String" />
                        <asp:Parameter Name="ISOK" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="ISOK" Type="Boolean" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="UserID" Type="Int32" />
                        <asp:Parameter Name="BillsDate" Type="String" />
                        <asp:Parameter Name="BillsTime" Type="String" />
                        <asp:Parameter Name="DeliveryDate" Type="String" />
                        <asp:Parameter Name="DeliveryTime" Type="String" />
                        <asp:Parameter Name="MoreNote" Type="String" />
                        <asp:Parameter Name="ISOK" Type="Boolean" />
                        <asp:Parameter Name="BillsID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

