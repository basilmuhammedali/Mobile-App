<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Details.aspx.vb" Inherits="Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style5
    {
        color: #FF0000;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style4">
    <tr>
        <td align="center" bgcolor="#F3E9ED">
            <asp:Label ID="Lbmsg" runat="server" Text="Ürün detayları ve sipariş"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="White">
            <table cellpadding="2" class="style4">
                <tr>
                    <td bgcolor="#532B3A" valign="top">
                        <table cellpadding="3" cellspacing="3" class="style4">
                            <tr>
                                <td bgcolor="White">
                                    <table cellpadding="2" class="style4">
                                        <tr>
                                            <td align="center" style="direction: rtl">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="direction: rtl">
                                                Gerekli miktarı seçin:</td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="direction: ltr">
                                                <asp:TextBox ID="TextBoxTotal" runat="server" ForeColor="#993333" 
                                                    style="font-weight: 700" Width="74px">1</asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    Display="Dynamic" ErrorMessage="Sadece bir numara girin." 
                                                    ControlToValidate="TextBoxTotal" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    Display="Dynamic" ErrorMessage="Miktarı girin" 
                                                    ControlToValidate="TextBoxTotal"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Button ID="Button1" runat="server" Height="40px" 
                                                    style="font-size: large; font-family: Tahoma" Text="Faturaya Ekle-istek" 
                                                    Width="211px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="521">
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="IDMeals" 
                            DataSourceID="SqlDataSource1" EnableModelValidation="True">
                            <EditItemTemplate>
                                IDMeals:
                                <asp:Label ID="IDMealsLabel1" runat="server" Text='<%# Eval("IDMeals") %>' />
                                <br />
                                IDVarietiesFKey:
                                <asp:TextBox ID="IDVarietiesFKeyTextBox" runat="server" 
                                    Text='<%# Bind("IDVarietiesFKey") %>' />
                                <br />
                                NameMeals:
                                <asp:TextBox ID="NameMealsTextBox" runat="server" 
                                    Text='<%# Bind("NameMeals") %>' />
                                <br />
                               
                                PriceMeals:
                                <asp:TextBox ID="PriceMealsTextBox" runat="server" 
                                    Text='<%# Bind("PriceMeals") %>' />
                                <br />
                                ImageMeals:
                                <asp:TextBox ID="ImageMealsTextBox" runat="server" 
                                    Text='<%# Bind("ImageMeals") %>' />
                                <br />
                                DetailsMeals:
                                <asp:TextBox ID="DetailsMealsTextBox" runat="server" 
                                    Text='<%# Bind("DetailsMeals") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                IDVarietiesFKey:
                                <asp:TextBox ID="IDVarietiesFKeyTextBox" runat="server" 
                                    Text='<%# Bind("IDVarietiesFKey") %>' />
                                <br />
                                NameMeals:
                                <asp:TextBox ID="NameMealsTextBox" runat="server" 
                                    Text='<%# Bind("NameMeals") %>' />
                                <br />
                                TypeMeals:
                                <asp:TextBox ID="TypeMealsTextBox" runat="server" 
                                    Text='<%# Bind("TypeMeals") %>' />
                                <br />
                                PriceMeals:
                                <asp:TextBox ID="PriceMealsTextBox" runat="server" 
                                    Text='<%# Bind("PriceMeals") %>' />
                                <br />
                                ImageMeals:
                                <asp:TextBox ID="ImageMealsTextBox" runat="server" 
                                    Text='<%# Bind("ImageMeals") %>' />
                                <br />
                                DetailsMeals:
                                <asp:TextBox ID="DetailsMealsTextBox" runat="server" 
                                    Text='<%# Bind("DetailsMeals") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table cellpadding="2">
                                    <tr>
                                        <td align="right" valign="top">
                                            <table cellpadding="2">
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #800000" 
                                                            Text='<%# Eval("NameMeals") %>' Width="300px"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#FFFFCC">
                                                        <table cellpadding="2">
                                                            <tr>
                                                               
                                                                <td>
                                                                   Tip</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="margin-left: 120px">
                                                                    <span class="style5">$</span><asp:Label ID="Label3" runat="server" 
                                                                        style="color: #800000" Text='<%# Eval("PriceMeals") %>'></asp:Label>
                                                                </td>
                                                                <td>
                                                                   Fiyat</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="Label4" runat="server" style="color: #000000" 
                                                            Text='<%# Eval("DetailsMeals") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image1" runat="server" BorderColor="#532B3A" 
                                                BorderStyle="Dotted" BorderWidth="1px" Height="170px" 
                                                ImageUrl='<%# Eval("ImageMeals") %>' Width="195px" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [IDMeals], [IDVarietiesFKey], [NameMeals], [PriceMeals], [ImageMeals], [DetailsMeals] FROM [TaMeals] WHERE ([IDMeals] = @IDMeals)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="IDMeals" QueryStringField="IDMeals" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>

