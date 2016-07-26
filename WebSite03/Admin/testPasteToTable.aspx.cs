using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;//添加引用SqlDbType
using System.Text;

public partial class Admin_testPasteToTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {/*
        TableRow tRow;//定义数据表行  
        TableCell tCell;//定义数据表格  
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
                tb.ID = (iRow * 4 + jCol) + "..";
                tCell.Controls.Add(tb);
                tRow.Cells.Add(tCell);
                if (iRow % 2 == 0)
                    tCell.BackColor = System.Drawing.Color.LightBlue;
                else tCell.BackColor = System.Drawing.Color.LightCyan;
            }
            autoTable.Rows.Add(tRow);//添加TableRow  
        }*/


        hiddenButtonForUploadTableValues.Attributes.Add("OnClick", "return passTableVales()");
    }

    public void testCallByJS()
    {
        TableRow tRow;//定义数据表行  
        TableCell tCell;//定义数据表格  
        for (int iRow = 0; iRow < 3; iRow++)
        {
            for (int jCol = 0; jCol < 4; jCol++)
            {
                //Response.Write((iRow * 4 + jCol) + "..");
                //Response.Write(((TextBox)(Page.FindControl((iRow * 4 + jCol) + ".."))).Text);
                TextBox txt = autoTable.FindControl((iRow * 4 + jCol) + "..") as TextBox;
            }
        }
    }

    protected void createTable(object sender, EventArgs e)
    {
        TableRow tRow;//定义数据表行  
        TableCell tCell;//定义数据表格  
        int rowCount = Convert.ToInt32(TextBox1.Text);
        int colCount = Convert.ToInt32(TextBox2.Text);
        for (int iRow = 0; iRow < rowCount; iRow++)
        {
            tRow = new TableRow();//new出一个行来
            for (int jCol = 0; jCol < colCount; jCol++)
            {
                tCell = new TableCell();        //new出一个cell
                //tCell.Width = 120;
                //tCell.Height = 100;
                TextBox tb = new TextBox();
                if (iRow > 0 || jCol > 0) tb.Enabled = false;
                tb.ID = (iRow * colCount + jCol) + "..";
                tCell.Controls.Add(tb);
                tRow.Cells.Add(tCell);
                if (iRow % 2 == 0)
                    tCell.BackColor = System.Drawing.Color.LightBlue;
                else tCell.BackColor = System.Drawing.Color.LightCyan;
            }
            autoTable.Rows.Add(tRow);//添加TableRow  
        }

        //Response.Write(TextBox1.Text + "        " + TextBox2.Text);

        StringBuilder sb = new StringBuilder();
        sb.Append("<script language='javascript'>");
        sb.Append("test11()");
        sb.Append("</script>");
        ClientScript.RegisterStartupScript(this.GetType(), "test11", sb.ToString());
    }
/*    
    protected string setTableValues(string values)
    {
        //SqlHelper.GetExecuteNonQuery("create table 测试表(字段1 varchar(64) primary key, 字段2 varchar(64) not null, 字段3 varchar(64)) ");
        return values;
    }
*/
    protected void hiddenButtonForUploadTableValues_Click(object sender, EventArgs e)
    {
        Response.Write("sdsdsfsdfjsdfjsdgfjsdgfjgj     *******   ");
        Response.Write(hiddenTableValues.Value);
    }
}