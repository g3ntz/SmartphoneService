<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Smartphone_Service.Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smartphone Service - Update</title>
    <link rel="stylesheet" href="Css/Style.css"/>
    <style type="text/css">
        .auto-style3 {
            margin-top: 0px;
            margin-bottom: 10px;
        }
        .auto-style4 {
            margin-top: 15px;
            margin-bottom: 12px;
        }
        .auto-style5 {
            margin-top: 12px;
            margin-bottom: 19px;
        }
        .auto-style6 {
            margin-top: 14px;
            margin-bottom: 11px;
        }
        .auto-style7 {
            margin-top: 12px;
            margin-bottom: 11px;
        }
        .auto-style8 {
            margin-top: 12px;
            margin-bottom: 13px;
        }
        .auto-style9 {
            margin-top: 12px;
            margin-bottom: 4px;
        }
        .auto-style11 {
            margin-left: 100px;
            margin-top: 29px;
        }   
    </style>
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
        <div class="create">
            <asp:Label CssClass="lblWriteInfos" ID="Label1" runat="server" ForeColor="White" Text="Update Infos"></asp:Label>
            <asp:Label ID="lblServiceID" runat="server" ForeColor="White" Text="Service ID" CssClass="lblName"></asp:Label>
            <asp:TextBox ID="txtServiceID" runat="server" CssClass="auto-style5"></asp:TextBox>
            <asp:Label ID="lblName" runat="server" ForeColor="White" Text="Name" CssClass="lblName"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style3"></asp:TextBox>
        <br />
            <asp:Label ID="lblSurname" runat="server" ForeColor="White" Text="Surname"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style5"></asp:TextBox>
        <br />
            <asp:Label ID="lblPhoneNr" runat="server" ForeColor="White" Text="Phone Nr"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style4"></asp:TextBox>
        <br />
        <asp:Label ID="lblSelectPhone" runat="server" ForeColor="White" Text="Select Phone"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style6">
            <asp:ListItem Value="1">Samsung A7</asp:ListItem>
            <asp:ListItem Value="2">Samsung A9</asp:ListItem>
            <asp:ListItem Value="3">Samsung S9</asp:ListItem>
            <asp:ListItem Value="4">Samsung S10</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label6" runat="server" ForeColor="White" Text="Select Service Type"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style7">
            <asp:ListItem Value="1">Pastrim</asp:ListItem>
            <asp:ListItem Value="2">Riparim</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblPrice" runat="server" ForeColor="White" Text="Service Price"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style8"></asp:TextBox>
        <br />
        <asp:Label ID="lblRepairedOrExchanged" runat="server" ForeColor="White" Text="Repaired/Exchanged Part"></asp:Label>
        <br />
            <asp:CheckBox ID="chkCamera" runat="server" ForeColor="White" Text="Camera" />
            <asp:RadioButton ID="rbCameraRepaired" runat="server" Text="Repaired" CssClass="rbRepaired" ForeColor="White" />
            <asp:RadioButton ID="rbCameraExchanged" runat="server" Text="Exchanged" CssClass="rbExchanged" ForeColor="White" />
            <br />
            <asp:CheckBox ID="chkBattery" runat="server" ForeColor="White" Text="Battery" />
            <asp:RadioButton ID="rbBatteryRepaired" runat="server" Text="Repaired" CssClass="rbRepaired" ForeColor="White" />
        <asp:RadioButton ID="rbBatteryExchanged" runat="server" Text="Exchanged" CssClass="rbExchanged" ForeColor="White" />
            <br />
            <asp:CheckBox ID="chkSensor" runat="server" ForeColor="White" Text="Sensor" />
            <asp:RadioButton ID="rbSensorRepaired" runat="server" Text="Repaired" CssClass="rbRepaired" ForeColor="White" />
        <asp:RadioButton ID="rbSensorExchanged" runat="server" Text="Exchanged" CssClass="rbExchanged" ForeColor="White" />
            <br />
            <asp:CheckBox ID="chkDisplay" runat="server" ForeColor="White" Text="Display" />
        <asp:RadioButton ID="rbDisplayRepaired" runat="server" Text="Repaired" CssClass="rbRepaired" ForeColor="White" />
        <asp:RadioButton ID="rbDisplayExchanged" runat="server" Text="Exchanged" CssClass="rbExchanged" ForeColor="White" />
        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="auto-style11" OnClick="btnUpdate_Click" />
            </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SmartphoneServiceConnectionString %>" 
            SelectCommand="usp_GetAllServices" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        <div class="ServicesTableCreate">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Service ID" DataSourceID="SqlDataSource2">
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
            </div>
    </form>
</body>
</html>
