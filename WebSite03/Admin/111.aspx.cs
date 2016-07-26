using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Data;//添加引用SqlDbType

public partial class Admin_111 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        hiddenButtonForUploadTableValues.Attributes.Add("OnClick", "return passTableVales()");
    }

    protected void createExcelFile(object sender, EventArgs e)
    {
        Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
        Microsoft.Office.Interop.Excel.Workbook workbook = excel.Application.Workbooks.Add(true);
        object missing = System.Reflection.Missing.Value;
        workbook.Worksheets.Add(missing, missing, missing, missing); // add sheet, return a worksheet
        workbook.Worksheets.Add(missing, missing, missing, missing); // add sheet


        ((Microsoft.Office.Interop.Excel.Worksheet)workbook.Sheets["Sheet1"]).Delete(); // delete sheet

        Microsoft.Office.Interop.Excel.Worksheet Sheet2 = ((Microsoft.Office.Interop.Excel.Worksheet)workbook.Sheets["Sheet2"]);

        String seleStr = "select AdminID, AdminName, AdminPassword, AdminRealName, AdminGradeID from Admin"; ;
        DataSet ds = SqlHelper.GetDataSet(seleStr);
        for (int i = 0; i < ds.Tables.Count; i++)
            for (int j = 0; j < ds.Tables[i].Rows.Count; j++) 
                for (int k = 0; k < ds.Tables[i].Columns.Count; k++)
                    Sheet2.Cells[j + 1, k + 1] = (ds.Tables[i].Rows[j][k]).ToString();

        workbook.SaveCopyAs("F:\\" + DateTime.Now.ToString("yyyyMMddhhmmss") + ".xlsx");


        System.Data.SqlClient.SqlDataReader sdr = SqlHelper.GetExecuteReader("SELECT name FROM sysobjects WHERE (xtype = 'u')");
        bool hasTable = false;
        while(sdr.Read())
        {
            String tableName = sdr["name"].ToString();
            if (tableName == "myTable")
            {
                hasTable = true;
                break;
            }
        }
        SqlHelper.CloseConnection();

        if(!hasTable)
            SqlHelper.GetExecuteNonQuery("CREATE TABLE myTable" + "(myId INTEGER CONSTRAINT PKeyMyId PRIMARY KEY," + "myName CHAR(50), myAddress CHAR(255), myBalance FLOAT)");
    }

    protected void openExcelFile(object sender, EventArgs e)
    {
        Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
        object missing = System.Reflection.Missing.Value;
        Microsoft.Office.Interop.Excel.Workbook workbook = excel.Application.Workbooks.Open("F:\\1.xlsx", missing, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing);
        excel.Application.DisplayAlerts = false;

        //Microsoft.Office.Interop.Excel.Worksheet worksheet = ((Microsoft.Office.Interop.Excel.Worksheet)workbook.Sheets["Sheet1"]);
        Microsoft.Office.Interop.Excel.Worksheet worksheet = ((Microsoft.Office.Interop.Excel.Worksheet)workbook.Sheets["Sheet2"]);

        StreamReader sr = new StreamReader("F:\\aa.txt", Encoding.Default);
        String line;
        int i = 1;
        while ((line = sr.ReadLine()) != null)
        {
            worksheet.Cells[i] = line;
            worksheet.Cells[10, i++] = line;
        }

        workbook.Save();
        workbook.Close();


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
        if (SqlHelper.isTableExist(NameOfTable.Text))
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