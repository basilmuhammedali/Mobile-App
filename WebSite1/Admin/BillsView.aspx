<%@ Page Title="Sipariş detayları" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="BillsView.aspx.vb" Inherits="Admin_BillsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style2">
        <tr>
            <td align="center" bgcolor="#F4F4F4">
                <asp:Label ID="Lbmsg" runat="server" Text="Sipariş detayları"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    CellPadding="2" CellSpacing="2" DataKeyNames="BillsID,IDUser" 
                    DataSourceID="SqlDataSource1" EmptyDataText="Hata faturası önce belirlenmelidirً" 
                    EnableModelValidation="True" Height="50px" Width="500px">
                    <CommandRowStyle HorizontalAlign="Center" />
                    <FieldHeaderStyle ForeColor="Blue" HorizontalAlign="Left" Width="180px" />
                    <Fields>
                        <asp:BoundField DataField="BillsID" HeaderText="Fatura / sipariş numarası" 
                            InsertVisible="False" ReadOnly="True" SortExpression="BillsID" />
                        <asp:BoundField DataField="BillsDate" HeaderText="Fatura / sipariş açılış tarihi" 
                            SortExpression="BillsDate" />
                        <asp:BoundField DataField="BillsTime" HeaderText="Fatura / sipariş açılış zamanı" 
                            SortExpression="BillsTime" />
                        <asp:BoundField DataField="UserNicName" HeaderText="kullancı adı" 
                            SortExpression="UserNicName" />
                        <asp:BoundField DataField="DeliveryDate" HeaderText="teslim tarihi" 
                            SortExpression="DeliveryDate" />
                        <asp:BoundField DataField="DeliveryTime" HeaderText="teslim zamanı" 
                            SortExpression="DeliveryTime" />
                        <asp:BoundField DataField="MoreNote" HeaderText="Kullanıcı yorumları" 
                            NullDisplayText="yok" SortExpression="MoreNote" />
                        <asp:TemplateField HeaderText="Onay durumu ve isteğin yürütülmesi" SortExpression="ISOK">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ISOK") %>' 
                                    Enabled="false" Text="Sipariş onayı" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ISOK") %>' />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ISOK") %>' />
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" style="font-size: large" Text="Değişiklik" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" onclientclick="return confirm('هGerçekten silmek istiyormudunuz?')" 
                                    style="font-size: large" Text="sil" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                    CommandName="Update" style="font-size: large" Text="kayıdet" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" style="font-size: large" Text="iptal" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle HorizontalAlign="Center" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM [TaBills] WHERE [BillsID] = @BillsID" 
                    InsertCommand="INSERT INTO [TaBills] ([UserID], [BillsDate], [BillsTime], [DeliveryDate], [DeliveryTime], [MoreNote], [ISOK]) VALUES (@UserID, @BillsDate, @BillsTime, @DeliveryDate, @DeliveryTime, @MoreNote, @ISOK)" 
                    SelectCommand="SELECT TaBills.BillsID, TaBills.UserID, TaBills.BillsDate, TaBills.BillsTime, TaBills.DeliveryDate, TaBills.DeliveryTime, TaBills.MoreNote, TaBills.ISOK, TaUsers.IDUser, TaUsers.UserNicName FROM TaBills LEFT OUTER JOIN TaUsers ON TaBills.UserID = TaUsers.IDUser WHERE (TaBills.BillsID = @BillsID)" 
                    
                    
                    UpdateCommand="UPDATE [TaBills] SET  [ISOK] = @ISOK WHERE [BillsID] = @BillsID">
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
                        <asp:QueryStringParameter Name="BillsID" QueryStringField="BillsID"
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ISOK" Type="Boolean" />
                        <asp:Parameter Name="BillsID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" 
                    style="font-size: x-large; color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F4F4F4">
                Fatura malzemesi</td>
        </tr>
        <tr>
            <td align="right">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataKeyNames="MealsID" DataSourceID="SqlDataSource2" 
                    EmptyDataText="Bu tasarıda hiçbir malzeme yok." EnableModelValidation="True" 
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="MealsID" HeaderText="numara" InsertVisible="False" 
                            ReadOnly="True" SortExpression="MealsID" />
                        <asp:BoundField DataField="MealsName" HeaderText="malzeme" 
                            SortExpression="MealsName" />
                        <asp:BoundField DataField="MealsTotal" HeaderText="Gerekli miktar" 
                            SortExpression="MealsTotal" />
                        <asp:BoundField DataField="MealsPrice" HeaderText="Miktar" 
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
                    SelectCommand="SELECT * FROM [TaBillsMeals] WHERE ([BillsIDFKey] = @BillsIDFKey)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="BillsIDFKey" QueryStringField="BillsID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

