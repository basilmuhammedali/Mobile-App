<%@ Page Title="Çeşitliler" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Varieties.aspx.vb" Inherits="Varieties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <table cellpadding="2" class="style4">
        <tr>
            <td align="right" bgcolor="White">
                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="IDMeals" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" EmptyDataText="لBu bölümde içerik yok" Width="100%">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <table cellspacing="1" class="style4" align="right">
                        <tr>
                            <td align="right">
                                <table cellpadding="2">
                                    <tr>
                                        <td align="right" valign="top">
                                            <table cellpadding="2" class="style4">
                                                <tr>
                                                    <td align="right">
                                                        <asp:HyperLink ID="HyperLink9" runat="server" Font-Bold="True" 
                                                            Font-Size="Large" Font-Underline="False" ForeColor="#993333" Width="400px" 
                                                            NavigateUrl='<%# Eval("IDMeals", "Details.aspx?IDMeals={0}") %>' 
                                                            Text='<%# Eval("NameMeals") %>'></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#FFEAFF">
                                                        <table cellpadding="2" style="font-size: small">
                                                            <tr>
                                                                <td class="style5">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TypeMeals") %>'></asp:Label>
                                                                </td>
                                                                <td style="direction: rtl">
                                                                    telefon türü:</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#FFEAFF">
                                                        <table cellpadding="2" style="font-size: small">
                                                            <tr>
                                                                <td class="style5">
                                                                    <asp:Label ID="Label2" runat="server" style="color: #996600" 
                                                                        Text='<%# Eval("PriceMeals") %>'></asp:Label>
                                                                </td>
                                                                <td style="direction: rtl">
                                                                    Fiyat:</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:HyperLink ID="HyperLink10" runat="server" Font-Size="Large" 
                                                            Font-Strikeout="False" Font-Underline="False" 
                                                            NavigateUrl='<%# Eval("IDMeals", "Details.aspx?IDMeals={0}") %>'>Ayrıntıları görüntüle / şimdi sipariş ver</asp:HyperLink>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image1" runat="server" BorderColor="#CC0000" 
                                                BorderStyle="Dotted" BorderWidth="1px" Height="143px" 
                                                ImageUrl='<%# Eval("ImageMeals") %>' Width="144px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#532B3A">
                                &nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
                      <EmptyDataRowStyle ForeColor="#CC0099" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [IDMeals], [IDVarietiesFKey], [NameMeals], [TypeMeals], [PriceMeals], [ImageMeals] FROM [TaMeals] WHERE ([IDVarietiesFKey] = @IDVarietiesFKey) ORDER BY [IDMeals] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="IDVarietiesFKey" QueryStringField="IDVarieties" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>&nbsp;</td>
        </tr>
    </table>
  
</asp:Content>

