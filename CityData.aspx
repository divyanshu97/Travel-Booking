<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CityData.aspx.cs" Inherits="CityData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cities Data</title>
  <link rel="stylesheet" href="city.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="HandheldFriendly" content="true">
    <style type="text/css">
        #form1 {
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <header>
    <div class="img">
        <img id="head" src="head.png" height="100px"/>
    </div>
    </header>
 
    <form id="form1" runat="server">
            <asp:GridView ID="GridViewCity" runat="server" ShowFooter="True" AutoGenerateColumns="False" OnRowEditing="GridViewCity_EditRow" OnRowCancelingEdit="GridViewCity_CancelEdit" OnRowUpdating="GridViewCity_UpdateCity" OnRowDeleting="GridViewCity_DeleteRow" CellPadding="4" ForeColor="#333333" GridLines="None" Width="812px" style="margin-top: 224px; margin-left: 236px;" Height="170px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CommandArgument='<%# Eval("cityId") %>' CommandName="Edit" Text="Edit">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%# Eval("cityId") %>'  CommandName="Delete" Text="Delete">
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CommandArgument='<%# Eval("cityId") %>'  CommandName="Update" Text="Update">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbCancel" runat="server" CommandArgument='<%# Eval("cityId") %>' CommandName="Cancel" Text="Cancel">
                            </asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add City" OnClick ="GridViewCity_InsertCity" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City ID">
                        <ItemTemplate>
                            <asp:Label ID="lblCityId" runat="server" Text='<%# Eval("cityId") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxCityId" runat="server" Text='<%# Eval("cityId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbxCityId" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City Name">
                        <ItemTemplate>
                            <asp:Label ID="lblCityName" runat="server" Text='<%# Eval("cityName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxCityName" runat="server" Text='<%# Eval("cityName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbxCityName" runat="server"></asp:TextBox>
                        </FooterTemplate>                    
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State ID">
                        <ItemTemplate>
                            <asp:Label ID="lblStateId" runat="server" Text='<%# Eval("stateId") %>'></asp:Label>
                        </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxStateId" runat="server" Text='<%# Eval("stateId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbxStateId" runat="server"></asp:TextBox>
                        </FooterTemplate> 
                    </asp:TemplateField>
                </Columns> 
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
             </asp:GridView> 
    </form>
</body>
</html>
