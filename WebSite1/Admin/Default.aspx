<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oturum aç</title>
    <style type="text/css">

        .style1
        {
            width: 100%;
            font-family: Tahoma;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="2" class="style1">
            <tr>
                <td align="center" bgcolor="#EEEEEE" style="direction: rtl">
                   Kontrol paneli</td>
            </tr>
            <tr>
                <td style="direction: rtl">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="direction: rtl" align="center">
                    <asp:Label ID="Lbmsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="direction: rtl" align="center">
                    <table cellpadding="2">
                        <tr>
                            <td align="left">
                                kullancı adı:</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Width="179px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                şifre:</td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="179px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="direction: rtl" align="center">
                    <asp:Button ID="Button1" runat="server" Height="39px" 
                        style="font-family: Tahoma" Text="giriş" Width="120px" />
                </td>
            </tr>
            <tr>
                <td style="direction: rtl">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" bgcolor="#EEEEEE" style="direction: rtl">
                    programlama ve analiz basil muhammed ali<br />
                    <a href="http://www.basilmuhammedali.com">www.basilmuhammedali.com</a>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
