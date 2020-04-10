<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartphoneService._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <header>
            <ul>
                <li><a >Create</a></li>
			    <li><a >Update</a></li>
			    <li><a >Search By</a></li>
            </ul>
            
        </header>
        <div class="create">
            <asp:Label CssClass="lblWriteInfos" ID="Label1" runat="server" ForeColor="White" Text="Write Client Infos"></asp:Label>
            <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Name" CssClass="lblName"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style3"></asp:TextBox>
        <br />
            <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Surname"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style5"></asp:TextBox>
        <br />
            <asp:Label ID="Label4" runat="server" ForeColor="White" Text="Phone Nr"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style4"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" ForeColor="White" Text="Select Phone"></asp:Label>
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
        <asp:Label ID="Label7" runat="server" ForeColor="White" Text="Service Price"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style8"></asp:TextBox>
        <br />
        <asp:Label ID="Label8" runat="server" ForeColor="White" Text="Repaired/Exchanged Part"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="auto-style9">
            <asp:ListItem>Camera</asp:ListItem>
            <asp:ListItem>Sensor</asp:ListItem>
            <asp:ListItem>Battery</asp:ListItem>
            <asp:ListItem>Display</asp:ListItem>
        </asp:DropDownList>
        <asp:RadioButton ID="RadioButton1" runat="server" Text="Repaired" CssClass="rbRepaired" ForeColor="White" />
        <asp:RadioButton ID="RadioButton2" runat="server" Text="Exchanged" CssClass="rbExchanged" ForeColor="White" />
        <br />
        <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="auto-style11" OnClick="btnCreate_Click" />
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
</asp:Content>
