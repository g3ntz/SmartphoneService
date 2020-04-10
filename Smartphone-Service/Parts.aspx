<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parts.aspx.cs" Inherits="Smartphone_Service.Parts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smartphone Service - Parts</title>
    <link rel="stylesheet" href="Css/Style.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
            <ul>
                <li><a href="Create.aspx">Create</a></li>
			    <li><a href="Update.aspx">Update</a></li>
			    <li><a href="SearchBy.aspx">Search By</a></li>
                <li><a href="Parts.aspx">Parts</a></li>
            </ul>
        </header>
        </div>
        <div class="content">
            <asp:Label ID="lblServiceID" runat="server" Text="Write Service ID" ForeColor="White" CssClass="lblServiceID"></asp:Label>
            <asp:TextBox ID="txtServiceID" runat="server"></asp:TextBox>
            <asp:Button ID="btnShowParts" runat="server" Text="Show" CssClass="btnShowParts" OnClick="btnShowParts_Click" />
        </div>
        <div class="PartsTable">
        <asp:ListView ID="ListView1" runat="server">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsRepairCheckBox" runat="server" Checked='<%# Eval("IsRepair") %>' Enabled="false" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsRepairCheckBox" runat="server" Checked='<%# Bind("IsRepair") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsRepairCheckBox" runat="server" Checked='<%# Bind("IsRepair") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsRepairCheckBox" runat="server" Checked='<%# Eval("IsRepair") %>' Enabled="false" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">Name</th>
                                    <th runat="server">IsRepair</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsRepairCheckBox" runat="server" Checked='<%# Eval("IsRepair") %>' Enabled="false" />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SmartphoneServiceConnectionString %>" SelectCommand="usp_GetPartsByID" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="ServiceID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            </div>
    </form>
</body>
</html>
