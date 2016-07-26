<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testPasteToTable.aspx.cs" Inherits="Admin_testPasteToTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>testPasteToTable</title>

    <script type="text/javascript">
        /*
        $.each($("input[type='text']"), function (obj, index) {
            this.onpaste = readClipboardData;
        });*/
        /*
        $(document).ready(function(e){
            $("#Div1>input[type=text]").each(function() {
                this.onpaste = readClipboardData;
            });*/

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
            //var tdIndex = $(this).parent().index(); //获取当前text控件的父元素td的索引  
            //var trIndex = $(this).parent().parent().index(); //获取当前text控件的父元素的父元素tr的索引 
            var tdIndex = 0;
            var trIndex = 0;
            var trStr;

            //从excle表格中复制的数据，最后一行为空行，因此无需对len数组中最后的元素进行处理  
            var curTable = document.getElementById("autoTable");
            //alert(len.length);
            var rowLength = len.length;
            if (rowLength == 1) rowLength++;
            for (var i = 0; i < rowLength - 1; i++) {
                //excel表格同一行的多个cell是以空格 分割的，此处以空格为单位对字符串做 拆分操作。。  
                //trStr = len[i].split(/\s+/);//如果使用'\t'可以保留哪些为空的单元格，使用正则表达式则去除为空的单元格/\s+/
                trStr = len[i].split('\t');
                for (var j = 0; j < trStr.length; j++) {
                    //alert((i * trStr.length + j) + "..");
                    var curTextbox = document.getElementById((i * trStr.length + j) + "..");
                    if (curTextbox) {
                        //alert(trStr[j]);
                        curTextbox.innerText = trStr[j];
                    }
                }
                trIndex++;
            }
            return false; //防止onpaste事件起泡  
        }

        function test11() {
            /*
            var _form = document.forms[0].all;
            for (var i = 0; i < _form.length; i++) {
                if (_form[i].type == "text") {
                    alert(_form[i].id);
                    //alert(_form[i].value);
                }
            }*/
            var name = document.getElementById("0..");
            name.onpaste = readClipboardData;
            if (name) {
                //alert(name.id);
                name.onpaste = readClipboardData;
            }
            return false;
        }

        var values = "";

        function testUploadToServer() {
            var curTable = document.getElementById("autoTable");
            var rows = curTable.rows.length;
            var cols = curTable.rows.item(0).cells.length;
            //alert(rows + "    " + cols);
            //var values = "";
            for (var i = 0; i < rows; i++) {
                for (var j = 0; j < cols; j++) {
                    var curTextbox = document.getElementById((i * cols + j) + "..");
                    //alert((i * cols + j) + ".." + "    " + curTextbox.value);
                    values += curTextbox.value + "###";
                }
            }


            document.getElementById("hiddenButtonForUploadTableValues").click();
<%--
            var aaa = '<%=setTableValues("' + values + '") %>';
            alert(aaa);
--%>
        }

        function passTableVales() {
            document.getElementById("hiddenTableValues").value = values;
            return true;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />

        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <br />
        <br />
        <br />

        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

        <br />
        <br />
        <br />

        <div id="Div1">
            <asp:Table ID="autoTable" runat="server" HorizontalAlign="Center"></asp:Table>

            <br />
            <br />
            <br />

            <asp:Button ID="Button1" runat="server" Text="创建表格" OnClick="createTable" />

            <br />
            <br />
            <br />
            <%--
            <asp:ScriptManager ID="ScriptManager1" runat="server">
                <asp:UpdatePanel runat="server">
                    <asp:Button ID="hiddenButtonForUploadTableValues" runat="server" Text="Button" style="display:none" OnClick="hiddenButtonForUploadTableValues_Click"/>
                </asp:UpdatePanel>

                <asp:UpdatePanel runat="server">
                    <input id="hiddenTableValues" type="hidden" runat="server" />
                </asp:UpdatePanel>
            </asp:ScriptManager>
            <input id="buttonForTableValuesUpload" type="button" value="上传" onclick="testUploadToServer()" />
            --%>
            <asp:Button ID="hiddenButtonForUploadTableValues" runat="server" Text="Button" style="display:none" OnClick="hiddenButtonForUploadTableValues_Click"/>
            <input id="hiddenTableValues" type="hidden" runat="server" />
            <input id="buttonForTableValuesUpload" type="button" value="上传" onclick="testUploadToServer()" />
                
            <br />
            <br />
            <br />
        </div>

    </form>
</body>

</html>
