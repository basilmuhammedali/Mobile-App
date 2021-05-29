<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 100%;
        }
        .style5
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style4">
        <tr>
            <td align="center" bgcolor="#F3E9ED">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" bgcolor="White">
                <asp:DataList ID="DataList2" runat="server" DataKeyField="IDVarieties" 
                    DataSourceID="SqlDataSource1" RepeatColumns="3" ShowFooter="False" 
                    ShowHeader="False" Width="100%" HorizontalAlign="Right" 
                    RepeatDirection="Horizontal">
                    <AlternatingItemStyle VerticalAlign="Top" />
                    <ItemStyle VerticalAlign="Top" />
                    <ItemTemplate>
                        <table cellpadding="2" class="style5">
                            <tr>
                                <td align="center" bgcolor="#673648">
                                    <asp:HiddenField ID="HiddenField1" runat="server" 
                                        Value='<%# Eval("IDVarieties") %>' />
                                    <asp:HyperLink ID="HyperLink9" runat="server" 
                                        NavigateUrl='<%# Eval("IDVarieties", "Varieties.aspx?IDVarieties={0}") %>' 
                                        Text='<%# Eval("NameVarieties") %>' Font-Bold="True" 
                                        Font-Underline="False" ForeColor="#FF99FF"></asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:FormView ID="FormView1" runat="server" BorderColor="#673648" 
                                        BorderStyle="Dotted" BorderWidth="1px" DataKeyNames="IDMeals" 
                                        DataSourceID="SqlDataSource1" EmptyDataText="Bu bölümde hiçbir öğe yok" 
                                        EnableModelValidation="True" Width="250px">
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
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update" />
                                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </EditItemTemplate>
                                        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <InsertItemTemplate>
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
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                CommandName="Insert" Text="Insert" />
                                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <table cellpadding="2" class="style5">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Image ID="Image1" runat="server" BorderColor="#532B3A" 
                                                            BorderStyle="Dotted" BorderWidth="1px" Height="163px" 
                                                            ImageUrl='<%# Eval("ImageMeals") %>' Width="215px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:HyperLink ID="HyperLink10" runat="server" 
                                                            NavigateUrl='<%# Eval("IDMeals", "Details.aspx?IDMeals={0}") %>' 
                                                            Text='<%# Eval("NameMeals") %>'></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <table cellpadding="2" style="font-size: x-large">
                                                            <tr>
                                                                <td>
                                                                    $</td>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" style="color: #990000" 
                                                                        Text='<%# Eval("PriceMeals") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:HyperLink ID="HyperLink11" runat="server" 
                                                            NavigateUrl='<%# Eval("IDMeals", "Details.aspx?IDMeals={0}") %>' 
                                                            style="color: #FF0000" Text="Şimdi sipariş verin"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        SelectCommand="SELECT [IDMeals], [IDVarietiesFKey], [NameMeals], [PriceMeals], [ImageMeals] FROM [TaMeals] WHERE ([IDVarietiesFKey] = @IDVarietiesFKey) ORDER BY [IDMeals] DESC">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="IDVarietiesFKey" 
                                                PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle VerticalAlign="Top" />
                    <SeparatorStyle VerticalAlign="Top" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [TaVarieties] ORDER BY [IDVarieties]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

