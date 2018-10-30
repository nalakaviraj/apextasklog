using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace WebApplication3
{
    public partial class task_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        //private void BindGrid()
        //{

            
            

            
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Apex"].ConnectionString))
        //    {

        //        using (SqlCommand cmd = new SqlCommand("SELECT A.reference_no, A.member_id,T.task_name,T.task_description FROM assign A INNER JOIN Tasks T ON A.reference_no= T.reference_no"))

        //            //"select e.empid,	e.sal,	e.Address,	ed.ename from edetail e inner join emp ed on e.empid=ed.empid";
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter())
        //            {
        //                cmd.Connection = con;
        //                sda.SelectCommand = cmd;
        //                using (DataTable dt = new DataTable())
        //                {
        //                    sda.Fill(dt);
        //                    GridView2.DataSource = dt;
        //                    GridView2.DataBind();
        //                }
        //            }
        //        }
        //    }
        //}


        private void BindGrid()
        {

            string startdatetime = "2018-10-30";




            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Apex"].ConnectionString))
            {

                using (SqlCommand cmd = new SqlCommand("SELECT reference_no, member_id FROM assign where date_assigned= @date_assigned "))

                //"select e.empid,	e.sal,	e.Address,	ed.ename from edetail e inner join emp ed on e.empid=ed.empid";
                {
                    cmd.Parameters.Add("@date_assigned", SqlDbType.DateTime);
                    cmd.Parameters["@date_assigned"].Value = startdatetime;
                    
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView2.DataSource = dt;
                            GridView2.DataBind();
                        }
                    }
                }
            }
        }

        private void Viewnow()
        {

            string startdatetime = Request.Form["TextBox1"];




            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Apex"].ConnectionString))
            {

                using (SqlCommand cmd = new SqlCommand("SELECT reference_no, member_id FROM assign where date_assigned= @date_assigned "))

                //"select e.empid,	e.sal,	e.Address,	ed.ename from edetail e inner join emp ed on e.empid=ed.empid";
                {
                    cmd.Parameters.Add("@date_assigned", SqlDbType.DateTime);
                    cmd.Parameters["@date_assigned"].Value = startdatetime;

                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView2.DataSource = dt;
                            GridView2.DataBind();
                        }
                    }
                }
            }
        }



        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void datetimepicker_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void submit_date_Click(object sender, EventArgs e)
        {
            this.Viewnow();
        }
    }
}