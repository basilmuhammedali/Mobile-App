<%@ Page Title="Öğeleri Yönet" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Varieties.aspx.vb" Inherits="Admin_Varieties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="style2">
        <tr>
            <td align="center" bgcolor="#F4F4F4">
                <asp:Label ID="Lbmsg" runat="server" Text="Öğeleri Yönet"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="IDVarieties" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                    EnableModelValidation="True" GridLines="None" Height="50px" Width="300px">
                    <FieldHeaderStyle Width="90px" />
                    <Fields>
                        <asp:BoundField DataField="IDVarieties" HeaderText="IDVarieties" 
                            InsertVisible="False" ReadOnly="True" SortExpression="IDVarieties" />
                        <asp:TemplateField HeaderText="Öğe adı" SortExpression="NameVarieties">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NameVarieties") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" style="font-family: Tahoma" 
                                    Text='<%# Bind("NameVarieties") %>' ValidationGroup="x1" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*" 
                                    ValidationGroup="x1"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NameVarieties") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                    CommandName="Insert" style="font-family: Tahoma" Text="ekle" 
                                    ValidationGroup="x1" />
                                &nbsp;
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                    CommandName="New" Text="New" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM [TaVarieties] WHERE [IDVarieties] = @IDVarieties" 
                    InsertCommand="INSERT INTO [TaVarieties] ([NameVarieties]) VALUES (@NameVarieties)" 
                    SelectCommand="SELECT * FROM [TaVarieties] ORDER BY [IDVarieties] DESC" 
                    UpdateCommand="UPDATE [TaVarieties] SET [NameVarieties] = @NameVarieties WHERE [IDVarieties] = @IDVarieties">
                    <DeleteParameters>
                        <asp:Parameter Name="IDVarieties" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="NameVarieties" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NameVarieties" Type="String" />
                        <asp:Parameter Name="IDVarieties" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F4F4F4">
                Şu anda görüntülenen öğelerin listesi</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IDVarieties" DataSourceID="SqlDataSource1" 
                    EmptyDataText="Hiçbir çeşidi yoktur." EnableModelValidation="True" Width="500px">
                    <Columns>
                        <asp:BoundField DataField="IDVarieties" HeaderText="numara" 
                            InsertVisible="False" ReadOnly="True" SortExpression="IDVarieties" />
                        <asp:TemplateField HeaderText="Öğe addresi" SortExpression="NameVarieties">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NameVarieties") %>' 
                                    Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NameVarieties") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="350px" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="kaydet"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="iptal"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Değişiklik"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" onclientclick="return confirm('Gerçekten silmek istiyor musun?')" 
                                    Text="sil"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

