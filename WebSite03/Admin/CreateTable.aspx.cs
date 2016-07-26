using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Data;//添加引用SqlDbType

public partial class Admin_CreateTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminName"] == null) //如果没有登录，则打开登录页
        {
            Response.Redirect("AdminLogin.aspx");//重定向到登录页面
        }
        if (!IsPostBack)
        {
            lblAdminName.Text = Session["adminname"].ToString();//获取管理员名
            //lblAdminGradeName.Text = Session["admingradename"].ToString().Trim();//获取权限
            lbtnExit.CausesValidation = false;//不验证“退出后台管理”按钮
        }

        hiddenButtonForUploadTableValues.Attributes.Add("OnClick", "return passTableVales()");
    }

    protected void lbtnExit_Click(object sender, EventArgs e)
    {
        //清空登陆信息，退出登陆
        Session["adminid"] = null;//管理员ID
        Session["adminname"] = null;//管理员名
        Session["admingradeid"] = null;//权限ID
        Session["admingradename"] = null;//权限名
        Response.Redirect("AdminLogin.aspx"); //重定向到登录页面
    }

    protected void MakeSureIndexesNumber_Click(object sender, EventArgs e)
    {
        //Response.Write(NumberOfIndexes.Text);
        int indexesNumber = Convert.ToInt32(NumberOfIndexes.Text);


        TableRow tRow;//定义数据表行  
        TableCell tCell;//定义数据表格  
        int rowCount = 1;
        int colCount = indexesNumber;
        for (int iRow = 0; iRow < rowCount; iRow++)
        {
            tRow = new TableRow();//new出一个行来
            for (int jCol = 0; jCol < colCount; jCol++)
            {
                tCell = new TableCell();        //new出一个cell

                TextBox tb = new TextBox();
                tb.ID = (iRow * colCount + jCol) + "...";
                tCell.Controls.Add(tb);

                tRow.Cells.Add(tCell);
                if (iRow % 2 == 0)
                    tCell.BackColor = System.Drawing.Color.LightBlue;
                else tCell.BackColor = System.Drawing.Color.LightCyan;
            }
            TableOfIndexes.Rows.Add(tRow);//添加TableRow  
        }


        StringBuilder sb = new StringBuilder();
        sb.Append("<script language='javascript'>");
        sb.Append("modifyOnpasteEventHadler()");
        sb.Append("</script>");
        ClientScript.RegisterStartupScript(this.GetType(), "modifyOnpasteEventHadler", sb.ToString());

    }
    /*
    protected string makesureCreateTable(string values)
    {
        return values;
    }*/

    private string getCreateTableSql()
    {
        List<string> indexes = AppHelper.splitString(hiddenTableValues.Value, "###");
        string tableName = NameOfTable.Text;
        tableName = AppHelper.GetSafeSQLString(tableName);
        string createTableSql = "create table " + tableName;
        int timeStep = DropDownList1.SelectedIndex; ; // 0 year, 1 month, 2 week, 3 day

        switch (timeStep)
        {
            case 0:
                createTableSql += "(年份 varchar(64) not null, ";
                break;
            case 1:
                createTableSql += "(年份 varchar(64) not null, 月份 varchar(64) not null, ";
                break;
        }

        foreach (string s in indexes)
        {
            createTableSql += s + " varchar(64), ";
        }
        switch (timeStep)
        {
            case 0:
                createTableSql += "constraint PK_Y primary key(年份)";
                break;
            case 1:
                createTableSql += "constraint PK_YM primary key(年份, 月份)";
                break;
        }
        createTableSql += ")";
        return createTableSql;
    }

    protected void hiddenButtonForUploadTableValues_Click(object sender, EventArgs e)
    {
        if (SqlHelper.isTableExist(AppHelper.GetSafeSQLString(NameOfTable.Text)))
        {
            Response.Write(hiddenTableValues.Value);
        }
        else
        {
            string createTableSql = this.getCreateTableSql();
            SqlHelper.GetExecuteNonQuery(createTableSql);
        }
    }



}