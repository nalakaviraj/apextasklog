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
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)

        {

            if (!Page.IsPostBack)

            {

                SetInitialRow();

            }

            Member_name_textbox.Text= Session["member_name"].ToString();
            string mymember_name = Member_name_textbox.Text;

            commonclass ref_no = new commonclass();
            Reference_no.Text = ref_no.generate_referenceno(mymember_name);


        }


        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }


        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }
        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {

        }


        //protected void Show_calender()
        //{
        //    datepicker.Visible = true;
        //}


        //protected void datepicker_SelectionChanged(object sender, EventArgs e)
        //{
        //    TextBox5.Text = datepicker.SelectedDate.ToLongDateString();
        //    datepicker.Visible = false;
        //}



        private void SetInitialRow()

        {

            DataTable dt = new DataTable();

            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));

            dt.Columns.Add(new DataColumn("Column1", typeof(string)));

            dt.Columns.Add(new DataColumn("Column2", typeof(string)));

            dt.Columns.Add(new DataColumn("Column3", typeof(string)));

            dr = dt.NewRow();

            dr["RowNumber"] = 1;

            dr["Column1"] = string.Empty;

            dr["Column2"] = string.Empty;

            dr["Column3"] = string.Empty;

            dt.Rows.Add(dr);

            //dr = dt.NewRow();



            //Store the DataTable in ViewState

            ViewState["CurrentTable"] = dt;



            Gridview1.DataSource = dt;

            Gridview1.DataBind();

        }

        private void SetPreviousData()

        {

            int rowIndex = 0;

            if (ViewState["CurrentTable"] != null)

            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];

                if (dt.Rows.Count > 0)

                {

                    for (int i = 0; i < dt.Rows.Count; i++)

                    {

                        TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");

                        TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");

                        TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");



                        box1.Text = dt.Rows[i]["Column1"].ToString();

                        box2.Text = dt.Rows[i]["Column2"].ToString();

                        box3.Text = dt.Rows[i]["Column3"].ToString();



                        rowIndex++;

                    }

                }

            }

        }


        private void AddNewRowToGrid()

        {

            int rowIndex = 0;



            if (ViewState["CurrentTable"] != null)

            {

                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];

                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)

                {

                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)

                    {

                        //extract the TextBox values

                        TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");

                        TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");

                        TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");



                        drCurrentRow = dtCurrentTable.NewRow();

                        drCurrentRow["RowNumber"] = i + 1;



                        dtCurrentTable.Rows[i - 1]["Column1"] = box1.Text;

                        dtCurrentTable.Rows[i - 1]["Column2"] = box2.Text;

                        dtCurrentTable.Rows[i - 1]["Column3"] = box3.Text;
                       



                        rowIndex++;

                    }

                    dtCurrentTable.Rows.Add(drCurrentRow);

                    ViewState["CurrentTable"] = dtCurrentTable;
                    



                    Gridview1.DataSource = dtCurrentTable;

                    Gridview1.DataBind();
                    

                }

            }

            else

            {

                Response.Write("ViewState is null");

            }



            //Set Previous Data on Postbacks

            SetPreviousData();

        }

        protected void Gridview1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void add_new_row_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }


        protected void Save()
        {
            foreach (GridViewRow row in this.Gridview1.Rows)
            {
               // string TextBox1 = ((TextBox)Gridview1.Rows[row.RowIndex].FindControl("TextBox1")).Text;
               // string TextBox2 = ((TextBox)Gridview1.Rows[row.RowIndex].FindControl("TextBox2")).Text;
               // string TextBox3 = ((TextBox)Gridview1.Rows[row.RowIndex].FindControl("TextBox3")).Text;


                if (row.RowType == DataControlRowType.DataRow)
                {
                  this.SaveDetails(row);
                   
                }
                
            }
            this.save_report();
            Response.Redirect("userview.aspx");
        }

        private void SaveDetails(GridViewRow row)
        {

            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Apex"].ConnectionString))
                {


                    SqlCommand cmd = new SqlCommand("INSERT INTO Tasks ( reference_no,serial_no, task_name, task_description, time)" + "VALUES(@Reference_no,@TextBox8, @task_name, @task_description ,@time)", con);
                    cmd.Parameters.AddWithValue("@Reference_no", Reference_no.Text);
                    //cmd.Parameters.AddWithValue("@Textbox8",(Gridview1.Rows[row.RowIndex].Cells[1]).Text);
                    cmd.Parameters.AddWithValue("@TextBox8", row.Cells[0].Text);
                    cmd.Parameters.AddWithValue("@task_name", ((TextBox)Gridview1.Rows[row.RowIndex].FindControl("TextBox1")).Text);
                    cmd.Parameters.AddWithValue("@task_description", ((TextBox)Gridview1.Rows[row.RowIndex].FindControl("TextBox2")).Text);
                    cmd.Parameters.AddWithValue("@time", Convert.ToInt16(((TextBox)Gridview1.Rows[row.RowIndex].FindControl("TextBox3")).Text.ToString()));

                    con.Open();
                    //cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //Response.Redirect("userview.aspx");



                }
            }

            catch (Exception ex)
            {
                string myerr = ex.ToString();
                throw;
            }

        }

        private void save_report()
        {


            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Apex"].ConnectionString);

                SqlCommand cmd = new SqlCommand("INSERT INTO Assign ( reference_no, member_name, date_assigned)" + "VALUES(@Reference_no,@Member_name_textbox,@datetpicker)", con);
                cmd.Parameters.AddWithValue("@Reference_no", Reference_no.Text);
                cmd.Parameters.AddWithValue("@Member_name_textbox", Member_name_textbox.Text);
                cmd.Parameters.AddWithValue("@datetpicker", datepicker.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception)
            {

                throw;
            }


        }

        protected void Submit_Click(object sender, EventArgs e)
        {
        
            Save();

        }

        protected void datepicker_TextChanged(object sender, EventArgs e)
        {

        }






    }
}