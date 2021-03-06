﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateTable.aspx.cs" Inherits="Admin_CreateTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据录入</title>
    <link href="CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function getClipboard() {
            if (window.clipboardData) {
                return (window.clipboardData.getData('Text'));
            }
            else if (window.netscape) {
                netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
                var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
                if (!clip) return;
                var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
                if (!trans) return;
                trans.addDataFlavor('text/unicode');
                clip.getData(trans, clip.kGlobalClipboard);
                var str = new Object();
                var len = new Object();
                try {
                    trans.getTransferData('text/unicode', str, len);
                }
                catch (error) {
                    return null;
                }
                if (str) {
                    if (Components.interfaces.nsISupportsWString) strstr = str.value.QueryInterface(Components.interfaces.nsISupportsWString);
                    else if (Components.interfaces.nsISupportsString) strstr = str.value.QueryInterface(Components.interfaces.nsISupportsString);
                    else str = null;
                }
                if (str) {
                    return (str.data.substring(0, len.value / 2));
                }
            }
            return null;
        }

        //读取剪切板数据，并将剪切板数据存放于各table cell中  
        function readClipboardData() {
            var str = getClipboard(); //获取剪切板数据  
            var len = str.split("\n");//获取行数  
            var tdIndex = 0;
            var trIndex = 0;
            var trStr;

            //alert("   $$$$   row = " + len.length);
            var rowLength = len.length;
            if (rowLength == 1) rowLength++;
            for (var i = 0; i < rowLength - 1; i++) {
                //excel表格同一行的多个cell是以空格 分割的，此处以空格为单位对字符串做 拆分操作。。  
                //trStr = len[i].split(/\s+/);//如果使用'\t'可以保留哪些为空的单元格，使用正则表达式则去除为空的单元格/\s+/
                trStr = len[i].split('\t');
                for (var j = 0; j < trStr.length; j++) {
                    //alert((i * trStr.length + j) + "..");
                    var curTextbox = document.getElementById((i * trStr.length + j) + "...");
                    if (curTextbox) {
                        //alert(trStr[j]);
                        curTextbox.innerText = trStr[j];
                    }
                }
                trIndex++;
            }
            return false; //防止onpaste事件起泡  
        }


        function modifyOnpasteEventHadler() {
            var name = document.getElementById("0...");
            name.onpaste = readClipboardData;
            if (name) {
                name.onpaste = readClipboardData;
            }
            return false;
        }

        var values = "";
        function passIndexesToServer()
        {
            var curTable = document.getElementById("TableOfIndexes");
            var rows = curTable.rows.length;
            var cols = curTable.rows.item(0).cells.length;
            for (var i = 0; i < rows; i++) {
                for (var j = 0; j < cols; j++) {
                    var curTextbox = document.getElementById((i * cols + j) + "...");
                    values += curTextbox.value + "###";
                }
            }

            document.getElementById("hiddenButtonForUploadTableValues").click();
        }

        function passTableVales() {
            document.getElementById("hiddenTableValues").value = values;
            //alert("aaaaa   " + document.getElementById("hiddenTableValues").value);
            return true;
        }

    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <!--页面层容器-->
            <div id="header">
                <!--页面头部-->
            </div>
            <div id="content">
                <div id="left-sidebar">
                    <div class="treeview">
                        <asp:TreeView ID="TreeView2" runat="server" DataSourceID="SiteMapDataSource2" Height="353px"
                            Width="166px">
                        </asp:TreeView>
                    </div>

                    <div class="logined">
                        用户：<asp:Label ID="lblAdminName" runat="server"></asp:Label><br />
                        <asp:LinkButton ID="lbtnExit" runat="server" OnClick="lbtnExit_Click">退出数据管理</asp:LinkButton>
                    </div>

                </div>
                <div id="right-main">
                    <!--主体内容-->

                    <div style="text-align: center; width: 100%;">
                        请输入表格名称
        <br />
                        <br />
                        再选择表格的时间维度（年、月、周、日），再输入表格的指标数量，点击确定。
        <br />
                        <br />
                        在出现的框中输入指标名称（可以直接复制excel，粘贴），点击创建，即可成功创建表格。
        <br />
                        <br />
                        表格创建成功之后，会自动返回上一个界面。
        <br />

                        <br />
                        <br />
                        <br />
                        <br />

                        <asp:Table ID="Table1" runat="server" align="center">
                        </asp:Table>

                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="LabelOfTipTableName" runat="server" Text="请输入表名："></asp:Label>
                        <asp:TextBox ID="NameOfTable" runat="server"></asp:TextBox>
                        <br />
                        <br />

                        <asp:Label ID="LabelOfTipSelectTimeStep" runat="server" Text="请选择时间维度："></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" Height="20">
                            <asp:ListItem>年</asp:ListItem>
                            <asp:ListItem>月</asp:ListItem>
                            <asp:ListItem>周</asp:ListItem>
                            <asp:ListItem>日</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />


                        <asp:Label ID="Label1" runat="server" Text="请输入指标数量："></asp:Label>
                        <asp:TextBox ID="NumberOfIndexes" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="MakeSureIndexesNumber" runat="server" Text="确定" OnClick="MakeSureIndexesNumber_Click" />
                        <br />
                        <br />

                        <asp:Table ID="TableOfIndexes" runat="server" align="center"></asp:Table>

                        <br />
                        <br />


                        <asp:Button ID="hiddenButtonForUploadTableValues" runat="server" Text="Button" Style="display: none" OnClick="hiddenButtonForUploadTableValues_Click" />
                        <input id="hiddenTableValues" type="hidden" runat="server" />
                        <input id="buttonForTableValuesUpload" type="button" value="创建" onclick="passIndexesToServer()" />

                        <br />
                        <br />
                        <br />
                        <br />

                        <br />
                        <br />
                        <br />
                        <br />

                    </div>


                </div>
            </div>
            <div id="footer">
                <span style="color: #fff;">2010-2020 版权所有<br />
                    地址：中国•广州 热线：020-xxxxxxxx</span>
            </div>
            <asp:SiteMapDataSource ID="SiteMapDataSource2" runat="server" SiteMapProvider="AspNetXmlSiteMapProvider_Data" />
    </form>
</body>
</html>
