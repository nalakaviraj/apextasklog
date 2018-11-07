<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Daily Task</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <%--<link rel="stylesheet" href="/resources/demos/style.css" />--%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />


    <%--language="javascript"--%>
    <script type="text/javascript">
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>

    <style>
        #form1 {
            height: 90%;
        }

        .main_container {
            padding-top: 10px;
            width: 80%;
            margin: auto;
            height: 90%;
        }

        #Member_name_textbox {
            border: 1px solid #00000042;
            border-radius: 4px;
            width: 60%;
            height: 33px;
        }


        #datepicker {
            border: 1px solid #00000042;
            border-radius: 4px;
            width: 65%;
            height: 33px;
        }

        #Reference_no {
            border: 1px solid #00000042;
            border-radius: 4px;
            width: 60%;
            height: 33px;
            padding: 10px;
        }

        #Gridview1 {
            width: 80%;
            border: solid 2px black;
            min-width: 80%;
            margin: auto;
        }

            #Gridview1 .header {
                background-color: #646464 !important;
                font-family: Arial !important;
                color: White !important;
                border: none 0px transparent !important;
                height: 25px !important;
                text-align: center !important;
                font-size: 13px !important;
            }

            #Gridview1 .rows {
                /*background-color: #0492cfb8 !important;*/
                font-family: Arial !important;
                font-size: 14px !important;
                /*color: #000!important;*/
                min-height: 25px !important;
                text-align: left !important;
                border: solid 1px black !important;
            }

                #Gridview1 .rows:hover {
                    background-color: #0492cf !important;
                    font-family: Arial !important;
                    /*color: #fff!important;*/
                    text-align: left !important;
                }

            #Gridview1 .selectedrow {
                background-color: #ff8000 !important;
                font-family: Arial !important;
                color: #fff !important;
                font-weight: bold !important;
                text-align: left !important;
            }

            #Gridview1 a /** FOR THE PAGING ICONS  **/ {
                background-color: Transparent !important;
                padding: 5px 5px 5px 5px !important;
                color: #fff !important;
                text-decoration: none !important;
                font-weight: bold !important;
            }

                #Gridview1 a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/ {
                    background-color: #000 !important;
                    color: #fff !important;
                }

            #Gridview1 span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
                background-color: #c9c9c9 !important;
                color: #000 !important;
                padding: 5px 5px 5px 5px !important;
            }

            #Gridview1 .pager {
                background-color: #646464 !important;
                font-family: Arial !important;
                color: White !important;
                height: 30px !important;
                text-align: left !important;
            }

            #Gridview1 td {
                padding: 5px !important;
            }

            #Gridview1 th {
                padding: 5px !important;
            }

        /*#add_new_row {
            margin: 31px 20px 20px 0;
        }*/

        #submit {
            margin-bottom: 63px !important;
        }

        #RequiredFieldValidatorDetail {
            background-color: red !important;
        }
    </style>

</head>


<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div style="height:200px" class="jumbotron">
                <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
                    <h1 class="display-2" style="font-size: 35px;color: #e67979;">Apex Technologies Private Limited</h1>
                    <h1 class="display-1" style="font-size: 25px;">Daily Task Report</h1>
                </div>
            </div>

            <table border="0" class="auto-style7" style="width: 100%; margin-bottom: 3%">
                <tr>
                    <td class="auto-style15" style="text-align: left">Member Name
                        :
                        <asp:TextBox CssClass="text-center" ID="Member_name_textbox" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                    </td>
                    <td class="auto-style17">Date :
                        <asp:TextBox CssClass="text-center" ID="datepicker" runat="server" OnTextChanged="datepicker_TextChanged" AutoPostBack="True" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="validate_warn"
                                runat="server"
                                ControlToValidate="datepicker"
                                ErrorMessage="Please Add the date"
                                ForeColor="Red"
                                Style="position: absolute; background-color: #d9534f!important; border-radius: 5px; position: absolute; color: white!important;"></asp:RequiredFieldValidator>

                    </td>


                    <td class="auto-style18">Ref No :
                        <asp:TextBox CssClass="text-center" ID="Reference_no" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <asp:GridView ID="Gridview1" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" AllowPaging="True" RowStyle-CssClass="rows" runat="server" AutoGenerateColumns="False" Width="100%" OnSelectedIndexChanged="Gridview1_SelectedIndexChanged" BorderWidth="1px" CellPadding="4" BackColor="White" BorderColor="#DEDFDE" ForeColor="Black" BorderStyle="Solid">

                <AlternatingRowStyle BackColor="White" />

                <Columns>

                    <asp:BoundField DataField="RowNumber" HeaderText="Serial." >

                    <ItemStyle Width="6%" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Task Name">

                        <ItemTemplate>

                            <asp:TextBox ID="TextBox1" runat="server" Style="width: 99%; border: none;" Height="20px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTaskName" runat="server"
                                ControlToValidate="TextBox1"
                                ErrorMessage="Task Name is needed"
                                ForeColor="Red"
                                Style="position: absolute; background-color: #d9534f!important; border-radius: 5px; position: absolute; color: white!important;">
                            </asp:RequiredFieldValidator>
                        </ItemTemplate>

                        <ItemStyle Width="10%" />

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Task Description">

                        <ItemTemplate>

                            <asp:TextBox ID="TextBox2" runat="server" Style="width: 99%; border: none;"></asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidatorDetail"
                                CssClass="validate_warn"
                                runat="server"
                                ControlToValidate="TextBox2"
                                ErrorMessage="Please Add a Task Description"
                                ForeColor="Red"
                                Style="position: absolute; background-color: #d9534f!important; border-radius: 5px; position: absolute; color: white!important;">
                            </asp:RequiredFieldValidator>
                        </ItemTemplate>

                        <ItemStyle Width="69%" />

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Allocated Time">

                        <ItemTemplate>

                            <asp:TextBox ID="TextBox3" runat="server" Style="width: 99%; border: none;" Visible="true"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTime" runat="server"
                                ControlToValidate="TextBox3"
                                ErrorMessage="Time allocated is a required field."
                                ForeColor="Red"
                                Style="position: absolute; background-color: #d9534f!important; border-radius: 5px; position: absolute; color: white!important;">
                            </asp:RequiredFieldValidator>

                            <asp:RangeValidator runat="server" Type="Integer"
                                MinimumValue="0" MaximumValue="24" ControlToValidate="TextBox3"
                                Style="position: absolute;"
                                ErrorMessage="Value must be a  number between 0 and 24">

                            </asp:RangeValidator>
                        </ItemTemplate>


                        <ItemStyle Width="15%" />


                    </asp:TemplateField>

                </Columns>

                <FooterStyle BackColor="#CCCC99" />

<HeaderStyle CssClass="header" BackColor="#6B696B" Font-Bold="True" ForeColor="White"></HeaderStyle>

<PagerStyle CssClass="pager" BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right"></PagerStyle>

                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />


                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />


            </asp:GridView>
            <br />
            <div>
                <asp:Button Style="width: 150px;" ID="add_new_row" CssClass="btn btn-info pull-left " runat="server" OnClick="add_new_row_Click" Text="Add Task" />
                <asp:Button Style="width: 150px;" ID="submit" CssClass="btn btn-info pull-right" runat="server" OnClick="Submit_Click" Text="Submit" />
            </div>

        </div>

        </div>

    </form>
</body>
</html>
