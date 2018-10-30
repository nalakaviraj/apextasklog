<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">


    <script>
        $(function() {
  $('#datetimepicker1').datetimepicker();
});
    </script>

    <style>

#Member_name_textbox{

    border: 1px solid #00000042;
    border-radius: 4px;
    width: 65%;
    height: 33px;

}
#date_container{

    width:89%!important;
}

#datetimepicker1{
    
    
    width: 83%;
    height: 33px;

}

#Reference_no{

    border: 1px solid #00000042;
    border-radius: 4px;
    width: 65%;
    height: 33px;
}
#Gridview1
{
	width: 80%;
	border: solid 2px black;
	min-width: 80%;
    margin:auto;
}
#Gridview1 .header
{
	background-color: #646464!important;
	font-family: Arial!important;
	color: White!important;
	border: none 0px transparent!important;
	height: 25px!important;
	text-align: center!important;
	font-size: 16px!important;
}

#Gridview1 .rows
{
	background-color: #8c9098!important;
	font-family: Arial!important;
	font-size: 14px!important;
	color: #000!important;
	min-height: 25px!important;
	text-align: left!important;
	border: none 0px transparent!important;
}
#Gridview1 .rows:hover
{
	background-color: #ff8000!important;
	font-family: Arial!important;
	color: #fff!important;
	text-align: left!important;
}
#Gridview1 .selectedrow
{
	background-color: #ff8000!important;
	font-family: Arial!important;
	color: #fff!important;
	font-weight: bold!important;
	text-align: left!important;
}
#Gridview1  a /** FOR THE PAGING ICONS  **/
{
	background-color: Transparent!important;
	padding: 5px 5px 5px 5px!important;
	color: #fff!important;
	text-decoration: none!important;
	font-weight: bold!important;
}

#Gridview1 a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
{
	background-color: #000!important;
	color: #fff!important;
}
#Gridview1 span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
{
	background-color: #c9c9c9!important;
	color: #000!important;
	padding: 5px 5px 5px 5px!important;
}
#Gridview1 .pager
{
	background-color: #646464!important;
	font-family: Arial!important;
	color: White!important;
	height: 30px!important;
	text-align: left!important;
}

#Gridview1 td
{
	padding: 5px!important;
}
#Gridview1 th
{
	padding: 5px!important;
}



    </style>
   
</head>


<body>
    <form id="form1" runat="server">
        <div>

            

             <table border="0" class="auto-style7" style="width:100%; margin-top:5%;margin-bottom:3%">
                <tr>
                    <td class="auto-style15" style="text-align: left">Member Name <asp:TextBox ID="Member_name_textbox" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style17">  <div id="date_container">
                                                    <div class='input-group date' id='datetimepicker1'>
                                                        Date 
                                                        <asp:TextBox ID="datetimepicker1" runat="server"></asp:TextBox>
                                                      <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                      </span>
                                                    </div>
                                                    </div>
                       </td>                           
                                                 

                    <td class="auto-style18">Report Ref <asp:TextBox ID="Reference_no" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <asp:gridview ID="Gridview1" CssClass="default" PagerStyle-CssClass="pager"  HeaderStyle-CssClass="header" AllowPaging="True" RowStyle-CssClass="rows" runat="server" AutoGenerateColumns="False" Width="100%" OnSelectedIndexChanged="Gridview1_SelectedIndexChanged" BorderStyle="None" BorderWidth="0px" CellPadding="10">

        <Columns>

        <asp:BoundField DataField="RowNumber" HeaderText="Ref" />

        <asp:TemplateField HeaderText="Task Name">

            <ItemTemplate>

                <asp:TextBox ID="TextBox1" runat="server" style="width:99%;border:none; height:95%;" Height="20px"></asp:TextBox>

            </ItemTemplate>

        </asp:TemplateField>

        <asp:TemplateField HeaderText="Task Description">

            <ItemTemplate>

                <asp:TextBox ID="TextBox2" runat="server" style="width:99%;border:none;"></asp:TextBox>

            </ItemTemplate>

        </asp:TemplateField>

        <asp:TemplateField HeaderText="Time allocated">

            <ItemTemplate>

                 <asp:TextBox ID="TextBox3" runat="server" style="width:99%;border:none;"></asp:TextBox>

            </ItemTemplate>

        </asp:TemplateField>

        </Columns>

                <RowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="Red" />

</asp:gridview>

        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add New Row" />
        <p>
            <asp:Button ID="submit" runat="server" OnClick="Submit_Click" Text="Submit" />
        </p>
    </form>
</body>
</html>
