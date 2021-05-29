<%@ Page Title="ekle" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="MealsAdd.aspx.vb" Inherits="Admin_MealsAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style2">
        <tr>
            <td align="center" bgcolor="#F4F4F4">
                <asp:Label ID="Lbmsg" runat="server" Text="telefon ekle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="3" cellspacing="3">
                    <tr>
                        <td align="left" bgcolor="#F0F0F0">
                           Telefon derecelendirmesini seçin</td>
                        <td align="right">
                            <asp:DropDownList ID="DropListIDVarieties" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="NameVarieties" 
                                DataValueField="IDVarieties" style="font-family: Tahoma" Width="217px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT * FROM [TaVarieties]"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="DropListIDVarieties" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" bgcolor="#F0F0F0">
                            Telefon adresi</td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxNameMeals" runat="server" style="font-family: Tahoma" 
                                Width="217px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBoxNameMeals" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" bgcolor="#F0F0F0">
                            telefon türü</td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxTypeMeals" runat="server" style="font-family: Tahoma" 
                                Width="217px">bir</asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" bgcolor="#F0F0F0">
                            telefon fiatı</td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxPriceMeals" runat="server" style="font-family: Tahoma" 
                                Width="217px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TextBoxPriceMeals" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="TextBoxPriceMeals" Display="Dynamic" 
                                ErrorMessage="2.25 gibi bir sayı girmelisiniz." ValidationExpression="[0-9.]+"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        
                        <td align="right">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" bgcolor="#F0F0F0" valign="top">
                            Kısa açıklama veya telefon detayları</td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxDetailsMeals" runat="server" Height="102px" 
                                TextMode="MultiLine" Width="217px"></asp:TextBox>
                        </td>
                        <td valign="top">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="FileUpload1" Display="Dynamic" 
                                ErrorMessage="Hata, İngilizce olarak adlandırılan bir dosya seçin ve resim yazın" 
                                
                    ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$"></asp:RegularExpressionValidator>
                        </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="Button1" runat="server" Font-Size="Large" 
                    style="font-family: Tahoma" Text="ekle" Width="118px" />
            </td>
        </tr>
    </table>
</asp:Content>

