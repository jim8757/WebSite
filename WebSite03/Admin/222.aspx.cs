using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;//添加引用SQL Server;
using System.Data;//添加引用SqlDbType

public partial class Admin_222 : System.Web.UI.Page
{
    //查询字符串，静态变量，用于在本页面共用
    static string selectStr = "";//select语句的字符串要与其他删除、修改作用的字符串采用不同的变量

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminName"] == null)//如果没有登录，则打开登录页
        {
            Response.Redirect("AdminLogin.aspx");  //去登录页面
        }
        if (!IsPostBack)
        {
            selectStr = "select AdminID, AdminName, AdminPassword, AdminRealName, Admin.AdminGradeID, AdminGradeName from Admin, AdminGrade where Admin.AdminGradeID = AdminGrade.AdminGradeID";//显示全部记录
            ShowAdmin(selectStr);
        }
    }

    /// <summary>
    /// 数据绑定,显示全部记录
    /// </summary>
    private void ShowAdmin(string seleStr)
    {
        DataSet ds = SqlHelper.GetDataSet(seleStr);
        gridShow.DataSource = ds;
        gridShow.DataKeyNames = new string[] { "AdminID" };//GridView控件的主键名
        gridShow.AllowPaging = true;//启用分页
        gridShow.AutoGenerateColumns = false;//不自己绑定字段
        gridShow.PageSize = 15;//每页显示的记录数
        gridShow.DataBind();
        gridShow.Visible = false;

        /*
        for (int i = 0; i < gridShow.Rows.Count; i++)
            if (i % 2 == 0)
                gridShow.Rows[i].BackColor = System.Drawing.Color.LightBlue;
            else gridShow.Rows[i].BackColor = System.Drawing.Color.LightCyan;*/


        showInTable();
    }

    /// <summary>
    /// 分页
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gridShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridShow.PageIndex = e.NewPageIndex;
        ShowAdmin(selectStr);//显示给定条件的记录
    }

    protected void showInTable()
    {/*
        TableRow tRow;//定义数据表行  
        TableCell tCell;//定义数据表格  
        Label lblTitle;//定义标题标签 
        int numRows = gridShow.Columns.Count;
        int numCells = gridShow.Rows.Count;



        for (int iRow = 0; iRow < numRows; iRow++)
        {
            tRow = new TableRow();//new出一个行来
            for (int jCol = 0; jCol < numCells; jCol++)
            {
                tCell = new TableCell();        //new出一个cell  
                lblTitle = new Label();         //这是我自己用的一个lable，你可以参考  
                lblTitle.Width = 80;            //设置宽度
                tCell.Controls.Add(lblTitle);   //添加label到cell中  
                tRow.Cells.Add(tCell);
                if (iRow % 2 == 0)
                    tCell.BackColor = System.Drawing.Color.LightBlue;
                else tCell.BackColor = System.Drawing.Color.LightCyan;

                if (jCol == 0)
                {
                    lblTitle.Text = gridShow.Columns[iRow].HeaderText;
                }
                else
                {
                    lblTitle.Text = gridShow.Rows[jCol].Cells[iRow].Text;
                }
            }
            autoTable.Rows.Add(tRow);//添加TableRow  
        }*/

        string seleStr = "select AdminID, AdminName, AdminPassword, AdminRealName, Admin.AdminGradeID, AdminGradeName from Admin, AdminGrade where Admin.AdminGradeID = AdminGrade.AdminGradeID";//显示全部记录
        DataSet ds = SqlHelper.GetDataSet(seleStr);
        
        TableRow tRow;//定义数据表行  
        TableCell tCell;//定义数据表格  
        Label lblTitle;//定义标题标签

        int rowFlag = 0, columnFlag = 0;
        
        foreach (DataColumn mDc in ds.Tables[0].Columns)
        {
            tRow = new TableRow();//new出一个行来
            rowFlag = 0;
            if (columnFlag == 0)
            {
                TableRow timeRow = new TableRow();
                autoTable.Rows.Add(timeRow);//添加TableRow
                TableCell timeCell;
                Label timeLabel;
                for (int i = 0; i < 13; i++)
                {
                    timeCell = new TableCell();
                    timeLabel = new Label();
                    if(i > 0) timeLabel.Text = i + " 月";
                    timeCell.Controls.Add(timeLabel);   //添加label到cell中  
                    timeRow.Cells.Add(timeCell);
                }
            }
            foreach (DataRow mDr in ds.Tables[0].Rows)
            {
                if (rowFlag > 11) break;
                if (rowFlag == 0)
                {
                    tCell = new TableCell();        //new出一个cell  
                    lblTitle = new Label();         //这是我自己用的一个lable，你可以参考  
                    //lblTitle.Text = ds.Tables[0].Columns[columnFlag++].ColumnName;
                    lblTitle.Text = "指标" + ++columnFlag;
                    tCell.Controls.Add(lblTitle);   //添加label到cell中  
                    tRow.Cells.Add(tCell);
                }
                tCell = new TableCell();        //new出一个cell  
                lblTitle = new Label();         //这是我自己用的一个lable，你可以参考  
                lblTitle.Width = 120;            //设置宽度
                tCell.Controls.Add(lblTitle);   //添加label到cell中  
                tRow.Cells.Add(tCell);
                if (rowFlag++ % 2 == 0)
                    tCell.BackColor = System.Drawing.Color.LightBlue;
                else tCell.BackColor = System.Drawing.Color.LightCyan;

                lblTitle.Text = mDr[mDc].ToString();
            }
            autoTable.Rows.Add(tRow);//添加TableRow  
        }



        for (int iRow = 0; iRow < 3; iRow++)
        {
            tRow = new TableRow();//new出一个行来
            for (int jCol = 0; jCol < 4; jCol++)
            {
                tCell = new TableCell();        //new出一个cell
                //tCell.Width = 120;
                //tCell.Height = 100;
                TextBox tb = new TextBox();
                if (iRow > 0 || jCol > 0) tb.Enabled = false;
                tCell.Controls.Add(tb);
                tRow.Cells.Add(tCell);
                if (iRow % 2 == 0)
                    tCell.BackColor = System.Drawing.Color.LightBlue;
                else tCell.BackColor = System.Drawing.Color.LightCyan;
            }
            autoTable1.Rows.Add(tRow);//添加TableRow  
        }

    }

}