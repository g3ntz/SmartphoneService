<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchBy.aspx.cs" Inherits="Smartphone_Service.SearchBy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smartphone Service - Search By</title>
    <link rel="stylesheet" href="Css/Style.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <ul>
                <li><a href="Create.aspx">Create</a></li>
			    <li><a href="Update.aspx">Update</a></li>
			    <li><a href="SearchBy.aspx">Search By</a></li>
                <li><a href="Parts.aspx">Parts</a></li>
            </ul>
        </header>
        <div class="SearchBy">
            <asp:Label ID="lblSearchByServiceType" runat="server" Text="Search By Service Type" ForeColor="White" CssClass="lblSearchByServiceType"></asp:Label>
            <asp:DropDownList ID="ServiceTypeList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ServiceTypeList_SelectedIndexChanged">
                <asp:ListItem Value="1">Pastrim</asp:ListItem>
                <asp:ListItem Value="2">Riparim</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblSearchByClient" runat="server" Text="Search by Client ID" ForeColor="White" CssClass="lblSearchByClient"></asp:Label>
            <asp:TextBox ID="txtSearchByClient" runat="server" CssClass="txtSearchByClient"></asp:TextBox>
            <asp:Button ID="btnSearchByClient" runat="server" Text="Search" OnClick="btnSearchByClient_Click1" CssClass="btnSearchByClient" />
            <asp:Label ID="lblRepairedExchangedPart" runat="server" Text="Repaired/Exchanged Part" ForeColor="White"></asp:Label>
            <asp:DropDownList ID="RepairedExchangedList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RepairedExchangedList_SelectedIndexChanged" CssClass="RepairedExchangedList">
                <asp:ListItem>Camera</asp:ListItem>
                <asp:ListItem>Battery</asp:ListItem>
                <asp:ListItem>Sensor</asp:ListItem>
                <asp:ListItem>Display</asp:ListItem>
            </asp:DropDownList>
            <asp:RadioButton ID="rbRepaired" runat="server" AutoPostBack="True" Checked="True" Text="Repaired" OnCheckedChanged="rbRepaired_CheckedChanged" CssClass="rbRepaired" ForeColor="White" />
            <asp:RadioButton ID="rbExchanged" runat="server" AutoPostBack="True" Text="Exchanged" OnCheckedChanged="rbExchanged_CheckedChanged" CssClass="rbExchanged" ForeColor="White" />
            <div class="ServicesTable">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Service ID">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Label ID="Service_IDLabel" runat="server" Text='<%# Eval("[Service ID]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Client_NameLabel" runat="server" Text='<%# Eval("[Client Name]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Client_SurnameLabel" runat="server" Text='<%# Eval("[Client Surname]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Client_Phone_NrLabel" runat="server" Text='<%# Eval("[Client Phone Nr]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Service_TypeLabel" runat="server" Text='<%# Eval("[Service Type]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Phone_BrandLabel" runat="server" Text='<%# Eval("[Phone Brand]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Phone_ModelLabel" runat="server" Text='<%# Eval("[Phone Model]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("[Total Price]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
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
                            <asp:Label ID="Service_IDLabel1" runat="server" Text='<%# Eval("[Service ID]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Client_NameTextBox" runat="server" Text='<%# Bind("[Client Name]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Client_SurnameTextBox" runat="server" Text='<%# Bind("[Client Surname]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Client_Phone_NrTextBox" runat="server" Text='<%# Bind("[Client Phone Nr]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Service_TypeTextBox" runat="server" Text='<%# Bind("[Service Type]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Phone_BrandTextBox" runat="server" Text='<%# Bind("[Phone Brand]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Phone_ModelTextBox" runat="server" Text='<%# Bind("[Phone Model]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Total_PriceTextBox" runat="server" Text='<%# Bind("[Total Price]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
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
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="Client_NameTextBox" runat="server" Text='<%# Bind("[Client Name]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Client_SurnameTextBox" runat="server" Text='<%# Bind("[Client Surname]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Client_Phone_NrTextBox" runat="server" Text='<%# Bind("[Client Phone Nr]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Service_TypeTextBox" runat="server" Text='<%# Bind("[Service Type]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Phone_BrandTextBox" runat="server" Text='<%# Bind("[Phone Brand]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Phone_ModelTextBox" runat="server" Text='<%# Bind("[Phone Model]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Total_PriceTextBox" runat="server" Text='<%# Bind("[Total Price]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Label ID="Service_IDLabel" runat="server" Text='<%# Eval("[Service ID]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Client_NameLabel" runat="server" Text='<%# Eval("[Client Name]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Client_SurnameLabel" runat="server" Text='<%# Eval("[Client Surname]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Client_Phone_NrLabel" runat="server" Text='<%# Eval("[Client Phone Nr]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Service_TypeLabel" runat="server" Text='<%# Eval("[Service Type]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Phone_BrandLabel" runat="server" Text='<%# Eval("[Phone Brand]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Phone_ModelLabel" runat="server" Text='<%# Eval("[Phone Model]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("[Total Price]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">Service ID</th>
                                        <th runat="server">Client Name</th>
                                        <th runat="server">Client Surname</th>
                                        <th runat="server">Client Phone Nr</th>
                                        <th runat="server">Service Type</th>
                                        <th runat="server">Phone Brand</th>
                                        <th runat="server">Phone Model</th>
                                        <th runat="server">Total Price</th>
                                        <th runat="server">Date</th>
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
                            <asp:Label ID="Service_IDLabel" runat="server" Text='<%# Eval("[Service ID]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Client_NameLabel" runat="server" Text='<%# Eval("[Client Name]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Client_SurnameLabel" runat="server" Text='<%# Eval("[Client Surname]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Client_Phone_NrLabel" runat="server" Text='<%# Eval("[Client Phone Nr]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Service_TypeLabel" runat="server" Text='<%# Eval("[Service Type]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Phone_BrandLabel" runat="server" Text='<%# Eval("[Phone Brand]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Phone_ModelLabel" runat="server" Text='<%# Eval("[Phone Model]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("[Total Price]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
          
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SmartphoneServiceConnectionString %>" SelectCommand="usp_GetAllServices" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </div>
            </div>
    </form>
</body>
</html>
