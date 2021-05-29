<%@ Page Title="Fatura detayları" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="BillsView.aspx.vb" Inherits="BillsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style4">
        <tr>
            <td align="center" bgcolor="#F3E9ED">
                Fatura detayları</td>
        </tr>
        <tr>
            <td align="right" bgcolor="White" style="direction: rtl">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    CellPadding="2" CellSpacing="4" DataKeyNames="BillsID" 
                    DataSourceID="SqlDataSource1" 
                    EmptyDataText="Hata listeden önce faturayı seçmelisiniz" 
                    EnableModelValidation="True" Height="50px" Width="100%">
                    <FieldHeaderStyle BackColor="#FFCCFF" HorizontalAlign="Left" Width="150px" />
                    <Fields>
                        <asp:BoundField DataField="BillsID" HeaderText="Fatura veya sipariş numarası" 
                            InsertVisible="False" ReadOnly="True" SortExpression="BillsID" />
                        <asp:BoundField DataField="BillsDate" HeaderText="Fatura açılış tarihi" 
                            SortExpression="BillsDate" />
                        <asp:BoundField DataField="BillsTime" HeaderText="Fatura açılış zamanı" 
                            SortExpression="BillsTime" />
                        <asp:BoundField DataField="DeliveryDate" HeaderText="teslim tarihi" 
                            SortExpression="DeliveryDate" />
                        <asp:BoundField DataField="DeliveryTime" HeaderText="teslim zamanı" 
                            SortExpression="DeliveryTime" />
                        <asp:BoundField DataField="MoreNote" HeaderText="Notlar" 
                            SortExpression="MoreNote" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [TaBills] WHERE ([BillsID] = @BillsID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="BillsID" QueryStringField="BillsID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="White" style="direction: rtl">
                <table cellspacing="1" class="style4">
                    <tr>
                        <td align="center">
                            <asp:Label ID="Label1" runat="server" ForeColor="Maroon" 
                                style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                Fatura malzemesi</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="White" style="direction: rtl">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataKeyNames="MealsID" DataSourceID="SqlDataSource2" 
                    EmptyDataText="Bu tasarıda hiçbir malzeme yok." EnableModelValidation="True" 
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="MealsID" HeaderText="numara" InsertVisible="False" 
                            ReadOnly="True" SortExpression="MealsID" />
                        <asp:BoundField DataField="MealsName" HeaderText="Makalenin adı veya başlığı" 
                            SortExpression="MealsName" />
                        <asp:BoundField DataField="MealsTotal" HeaderText="Gerekli miktar" 
                            SortExpression="MealsTotal" />
                        <asp:BoundField DataField="MealsPrice" HeaderText="Toplam fiyat" 
                            SortExpression="MealsPrice" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [TaBillsMeals] WHERE ([BillsIDFKey] = @BillsIDFKey) ORDER BY [MealsID] DESC">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="BillsIDFKey" QueryStringField="BillsID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

