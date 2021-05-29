<%@ Page Title="bir sipariş iste" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="BillOpen.aspx.vb" Inherits="BillOpen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style4">
        <tr>
            <td align="center" bgcolor="#F3E9ED">
                <asp:Label ID="Lbmsg" runat="server" Text="bir sipariş iste"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="White">
                <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="xx" 
                    Visible="False">bu siparişi kapat</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="White">
                <table cellpadding="3" cellspacing="3">
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBoxDeliveryDate" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxDeliveryDate" runat="server" 
                                style="font-family: Tahoma; color: #800000" Width="200px"></asp:TextBox>
                        </td>
                        <td align="left" bgcolor="#F3E9ED" style="direction: rtl">
                            teslim tarihi</td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBoxDeliveryTime" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxDeliveryTime" runat="server" 
                                style="font-family: Tahoma; color: #800000" Width="200px"></asp:TextBox>
                        </td>
                        <td align="left" bgcolor="#F3E9ED" style="direction: rtl">
                            teslim zamanı</td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            <asp:TextBox ID="TextBoxMoreNote" runat="server" 
                                style="font-family: Tahoma; color: #800000; direction: rtl;" Width="200px" 
                                Height="72px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td align="left" bgcolor="#F3E9ED" style="direction: rtl">
                            bir sey varsa yaz</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="White">
                <asp:Button ID="Button1" runat="server" 
                    style="font-family: Tahoma; font-size: medium" 
                    Text="fatura aç ve alış veriş başla" Width="329px" />
            </td>
        </tr>
    </table>
</asp:Content>

