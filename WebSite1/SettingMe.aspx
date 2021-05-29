<%@ Page Title="Ayarlar" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SettingMe.aspx.vb" Inherits="SettingMe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style4">
        <tr>
            <td align="center" bgcolor="#F3E9ED">
                <asp:Label ID="Lbmsg" runat="server" Text="Ayarları değiştir"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="White">
                <table cellpadding="3" cellspacing="3">
                    <tr>
                        <td align="right">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TextBoxEmail" Display="Dynamic" 
                                ErrorMessage="E-postayı doğru girin" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                        <td align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxEmail" runat="server" 
                                style="font-family: Tahoma; color: #800000" Width="200px"></asp:TextBox>
                        </td>
                        <td align="left" bgcolor="#F3E9ED" style="direction: rtl">
                           E-posta:</td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxPass1" runat="server" 
                                style="font-family: Tahoma; color: #800000" Width="200px" 
                                TextMode="Password"></asp:TextBox>
                        </td>
                        <td align="left" bgcolor="#F3E9ED" style="direction: rtl">
                            Şifre:</td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxPass2" runat="server" 
                                style="font-family: Tahoma; color: #800000" Width="200px" 
                                TextMode="Password"></asp:TextBox>
                        </td>
                        <td align="left" bgcolor="#F3E9ED" style="direction: rtl">
                            şifreyi onayla:</td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="TextBoxNickName" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxNickName" runat="server" 
                                style="font-family: Tahoma; color: #800000" Width="200px"></asp:TextBox>
                        </td>
                        <td align="left" bgcolor="#F3E9ED" style="direction: rtl">
                            Ad:</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="White">
                <asp:Button ID="Button1" runat="server" 
                    style="font-family: Tahoma; font-size: medium" Text="Kaydet" Width="150px" />
            </td>
        </tr>
    </table>
</asp:Content>

