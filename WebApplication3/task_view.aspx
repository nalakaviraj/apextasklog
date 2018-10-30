<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="task_view.aspx.cs" Inherits="WebApplication3.task_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
    <style>

        #datetimepicker{

            width: 100%;
            height: 30px;

        }

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
#Gridview2
{
	width: 80%;
	border: solid 2px black;
	min-width: 80%;
    margin:auto;
}
#Gridview2 .header
{
	background-color: #646464!important;
	font-family: Arial!important;
	color: White!important;
	border: none 0px transparent!important;
	height: 25px!important;
	text-align: center!important;
	font-size: 16px!important;
}

#Gridview2 .rows
{
	background-color: #8c9098!important;
	font-family: Arial!important;
	font-size: 14px!important;
	color: #000!important;
	min-height: 25px!important;
	text-align: left!important;
	border: none 0px transparent!important;
}
#Gridview2 .rows:hover
{
	background-color: #ff8000!important;
	font-family: Arial!important;
	color: #fff!important;
	text-align: left!important;
}
#Gridview2 .selectedrow
{
	background-color: #ff8000!important;
	font-family: Arial!important;
	color: #fff!important;
	font-weight: bold!important;
	text-align: left!important;
}
#Gridview2  a /** FOR THE PAGING ICONS  **/
{
	background-color: Transparent!important;
	padding: 5px 5px 5px 5px!important;
	color: #fff!important;
	text-decoration: none!important;
	font-weight: bold!important;
}

#Gridview2 a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
{
	background-color: #000!important;
	color: #fff!important;
}
#Gridview2 span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
{
	background-color: #c9c9c9!important;
	color: #000!important;
	padding: 5px 5px 5px 5px!important;
}
#Gridview2 .pager
{
	background-color: #646464!important;
	font-family: Arial!important;
	color: White!important;
	height: 30px!important;
	text-align: left!important;
}

#Gridview2 td
{
	padding: 5px!important;
}
#Gridview2 th
{
	padding: 5px!important;
}



    </style>

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="date_container">
                                                     <div class="container">
    <div class="row">
      <div class='col-sm-4'>
        <div class="form-group">
          <div class='input-group date' id='datetimepicker1'>
           <asp:TextBox ID="datetimepicker" runat="server" OnTextChanged="datetimepicker_TextChanged"></asp:TextBox>
            <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">


                <Columns>
        <asp:BoundField ItemStyle-Width="150px" DataField="reference_no" HeaderText="Reference No" />
        <asp:BoundField ItemStyle-Width="150px" DataField="member_id" HeaderText="Member ID" />
                       
            </Columns>


            </asp:GridView>

                <asp:TextBox ID="datepicker" runat="server"></asp:TextBox>
                <asp:Button ID="submit_date" runat="server" Text="Button" OnClick="submit_date_Click" />

        </div>
    </form>
</body>
</html>
