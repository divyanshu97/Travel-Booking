<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminData.aspx.cs" Inherits="AdminData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admins Data</title>
  <link rel="stylesheet" href="city.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="HandheldFriendly" content="true">
    <style type="text/css">
        #form1 {
            margin-top: 0px;
        }
        .GridView {
            margin-left: 24px;
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
            <asp:GridView ID="GridViewAdminData" runat="server" AllowPaging="True" CssClass="GridView" AutoGenerateColumns="False" OnRowEditing="GridViewAdminData_EditRow" OnRowCancelingEdit="GridViewAdminData_CancelEdit" OnRowUpdating="GridViewAdminData_UpdateRow" OnRowDeleting="GridViewAdminData_DeleteRow" CellPadding="4" ForeColor="#333333" GridLines="None">
        
            <AlternatingRowStyle BackColor="White" />
        
            <Columns>
                   <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("RegId") %>' runat="server" CommandName="Edit" Text="Edit">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("RegId") %>' runat="server" CommandName="Delete" Text="Delete">
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("RegId") %>' runat="server" CommandName="Update" Text="Update">
                           </asp:LinkButton>
                           <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("RegId") %>' runat="server" CommandName="Cancel" Text="Cancel">
                           </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="Admin ID">
                        <ItemTemplate>
                            <asp:Label ID="lblAdminID" runat="server" Text='<%# Eval("AdminID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Reg ID">
                        <ItemTemplate>
                            <asp:Label ID="lblRegID" runat="server" Text='<%# Eval("RegID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxEmail" input type="email" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                        </EditItemTemplate>
                         <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxPassword" runat="server" Text='<%# Eval("PW") %>'></asp:TextBox>
                        </EditItemTemplate>
                         <ItemTemplate>
                            <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("PW") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Security Question">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxQues" runat="server" Text='<%# Eval("SecurityQuestion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQues" runat="server" Text='<%# Eval("SecurityQuestion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxAns" runat="server" Text='<%# Eval("Answer") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAns" runat="server" Text='<%# Eval("Answer") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Of Birth">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxDOB" runat="server" input type="date" Text='<%# Eval("DOB") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDOB" runat="server" input type="date" Text='<%# Eval("DOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxCity" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Admin Request">
                        <ItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Remove Admin" OnClick="btnApprove_Click"   />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Remove Admin" OnClick="btnApprove_Click"  />
                        </EditItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Approved">
                        <ItemTemplate>
                            <asp:Label ID="lblApprove" runat="server" Text='<%# Eval("Approved") %>'></asp:Label>
                        </ItemTemplate>
                        <%--<EditItemTemplate>
                            <asp:TextBox ID="tbxApprove" runat="server" Text='<%# Eval("Approved") %>'></asp:TextBox>
                        </EditItemTemplate>--%>
                    </asp:TemplateField>
                </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
    
    </form>
        </div>
</body>
</html>
