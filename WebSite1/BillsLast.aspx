<%@ Page Title="daha önce tamamlanmış faturalar" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="BillsLast.aspx.vb" Inherits="BillsLast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style4">
        <tr>
            <td align="center" bgcolor="#F3E9ED">
                 faturalar listesi / tamamlanan ve teslim edilen öncekş siparişler </td>
        </tr>
        <tr>
            <td align="right" bgcolor="White" style="direction: rtl">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" 
                    DataKeyNames="BillsID" DataSourceID="SqlDataSource1" 
                    EmptyDataText="Şu anda fatura veya sipariş yok" 
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="BillsID" HeaderText="Numara" InsertVisible="False" 
                            ReadOnly="True" SortExpression="BillsID" />
                        <asp:BoundField DataField="BillsDate" HeaderText="sipariş tarihi" 
                            SortExpression="BillsDate" />
                        <asp:BoundField DataField="BillsTime" HeaderText="sipariş zamanı" 
                            SortExpression="BillsTime" />
                        <asp:BoundField DataField="DeliveryDate" HeaderText="tarih teslimi" 
                            SortExpression="DeliveryDate" />
                        <asp:BoundField DataField="DeliveryTime" HeaderText="teslim zamanı" 
                            SortExpression="DeliveryTime" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Font-Underline="False" 
                                    onclientclick="return confirm('Gerçekten silmek istiyormusunız?')" Text="Sil ve iptal et"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink9" runat="server" Font-Underline="False" 
                                    NavigateUrl='<%# Eval("BillsID", "BillsView.aspx?BillsID={0}") %>'>İçeriği görüntüle</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#532B3A" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM [TaBills] WHERE [BillsID] = @BillsID" 
                    InsertCommand="INSERT INTO [TaBills] ([UserID], [BillsDate], [BillsTime], [DeliveryDate], [DeliveryTime], [MoreNote], [ISOK]) VALUES (@UserID, @BillsDate, @BillsTime, @DeliveryDate, @DeliveryTime, @MoreNote, @ISOK)" 
                    SelectCommand="SELECT * FROM [TaBills] WHERE (([UserID] = @UserID) AND ([ISOK] = @ISOK)) ORDER BY [BillsID] DESC" 
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
                        <asp:SessionParameter Name="UserID" SessionField="IDUser" Type="Int32" />
                        <asp:Parameter DefaultValue="True" Name="ISOK" Type="Boolean" />
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
    </table>
</asp:Content>

