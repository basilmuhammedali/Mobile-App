<%@ Page Title="telefon listesi" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="MealsList.aspx.vb" Inherits="Admin_MealsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style2">
        <tr>
            <td align="center" bgcolor="#F4F4F4">
                <asp:Label ID="Lbmsg" runat="server" Text="telefon listesi"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F4F4F4">
                <asp:HyperLink ID="HyperLink9" runat="server" Font-Underline="False" 
                    ForeColor="Red" NavigateUrl="~/Admin/MealsAdd.aspx">telefon ekle</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyNames="IDMeals,IDVarieties" DataSourceID="SqlDataSource1" 
                    EmptyDataText="İçerik yok" EnableModelValidation="True" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="IDMeals" HeaderText="numara" InsertVisible="False" 
                            ReadOnly="True" SortExpression="IDMeals" />
                        <asp:BoundField DataField="NameMeals" HeaderText="addres" 
                            SortExpression="NameMeals">
                        <ItemStyle Width="300px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NameVarieties" HeaderText="Açıklama" 
                            SortExpression="NameVarieties" />
                        <asp:BoundField DataField="TypeMeals" HeaderText="türü" 
                            SortExpression="TypeMeals" />
                        <asp:BoundField DataField="PriceMeals" HeaderText="fiat" 
                            SortExpression="PriceMeals" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" onclientclick="return confirm('هGerçekten silmek istiyormusunuz?')" 
                                    Text="sil" style="color: #FF0000"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink8" runat="server" 
                                    NavigateUrl='<%# Eval("IDMeals", "MealsEdit.aspx?IDMeals={0}") %>' 
                                    style="color: #003300">Düzenle / görüntüle</asp:HyperLink>
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
                    DeleteCommand="DELETE FROM [TaMeals] WHERE [IDMeals] = @IDMeals" 
                    InsertCommand="INSERT INTO [TaMeals] ([IDVarietiesFKey], [NameMeals], [TypeMeals], [PriceMeals]) VALUES (@IDVarietiesFKey, @NameMeals, @TypeMeals, @PriceMeals)" 
                    SelectCommand="SELECT TaMeals.IDMeals, TaMeals.IDVarietiesFKey, TaMeals.NameMeals, TaMeals.TypeMeals, TaMeals.PriceMeals, TaVarieties.IDVarieties, TaVarieties.NameVarieties FROM TaMeals INNER JOIN TaVarieties ON TaMeals.IDVarietiesFKey = TaVarieties.IDVarieties ORDER BY TaMeals.IDMeals DESC" 
                    UpdateCommand="UPDATE [TaMeals] SET [IDVarietiesFKey] = @IDVarietiesFKey, [NameMeals] = @NameMeals, [TypeMeals] = @TypeMeals, [PriceMeals] = @PriceMeals WHERE [IDMeals] = @IDMeals">
                    <DeleteParameters>
                        <asp:Parameter Name="IDMeals" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IDVarietiesFKey" Type="Int32" />
                        <asp:Parameter Name="NameMeals" Type="String" />
                        <asp:Parameter Name="TypeMeals" Type="String" />
                        <asp:Parameter Name="PriceMeals" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="IDVarietiesFKey" Type="Int32" />
                        <asp:Parameter Name="NameMeals" Type="String" />
                        <asp:Parameter Name="TypeMeals" Type="String" />
                        <asp:Parameter Name="PriceMeals" Type="String" />
                        <asp:Parameter Name="IDMeals" Type="Int32" />
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

