<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testUploadAndDownload.aspx.cs" Inherits="Admin_testUploadAndDownload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>测试文件上传和下载</title>





    <!--
    <script type="text/网页特效" src="swfobject.js"></script>
    <script type="text/javascript" >
        var swfVersionStr = "10.0.0";
        var xiSwfUrlStr = "playerProductInstall.swf";
        var flashvars = {};
        flashvars.url = "testUploadAndDownload.aspx?Param=ID|100,NAME|测试用户";
        var params = {};
        params.quality = "high";
        params.bgcolor = "#ffffff";
        params.allowscriptaccess = "sameDomain";
        params.allowfullscreen = "true";
        var attributes = {};
        attributes.id = "upload";
        attributes.name = "upload";
        attributes.align = "middle";
        swfobject.embedSWF(
             "upload.swf", "flashContent",
              "587", "370",
              swfVersionStr, xiSwfUrlStr,
              flashvars, params, attributes);
        function uploadCompelete(){
             //完成后的操作，如页面跳转或关闭当前页
             document.getElementById('btnUpload').disabled = false;
        }
        function submitForm(){
             thisMovie("upload").uploadfile();
        }
        function thisMovie(movieName){
             if (navigator.appName.indexOf("Microsoft") != -1) {
                 return window[movieName];
             }else {
                 return document[movieName];
             }
        }
        function disabledButton()
        {
             document.getElementById('btnUpload').disabled = true;
        }
    </script> 

    -->





</head>
<body>
    <form id="form1" runat="server">
    <asp:FileUpload ID="homeworkFile" runat="server" />
    <asp:Button ID="btnAdd" runat="server" Text="上传"  OnClick="btnAdd_Click"/></br></br></br>
    <asp:Button ID="btndownfile" runat="server" Text="下载方法一：TransmitFile" 
        onclick="btndownfile_Click" /></br></br></br>
       <asp:Button ID="btndownfilebyWriteFile" runat="server" 
        Text="下载方法二：WriteFile" onclick="btndownfilebyWriteFile_Click" /></br></br></br>
        <asp:Button ID="btndownfilebyWriteFile2" runat="server" 
        Text="下载方法三：WriteFile分块" onclick="btndownfilebyWriteFile2_Click" /><br /></br></br>
        <asp:Button ID="btndownfilebystream" runat="server" Text="下载方法四：流方式下载" 
        onclick="btndownfilebystream_Click" />


    <asp:Label ID="LblMessage" runat="server" Width="300px" ForeColor="#FF0033" Font-Bold="True" Font-Size="Small" />
    <table border="1" bordercolor="gray" style="border-collapse: collapse;">
        <tr>
          <td style="text-align: center; font-size:10pt; font-weight:bold; color:DimGray;">
             批量上传文件
          </td>
        </tr>
        <tr>
          <td>
             <asp:Panel ID="Pan_UpFile" runat="server" Height="200px" ScrollBars="Auto" Width="250px">
               <table id="Tab_UpDownFile" runat="server" cellpadding="0" cellspacing="0" enableviewstate="true">
                  <tr>
                     <td style="width: 100px; height: 30px">
                        <asp:FileUpload ID="FileUpload1" runat="server"/>
                     </td>
                  </tr>
              </table>
            </asp:Panel>
          </td>
        </tr>
        <tr>
          <td>        
            <asp:Button ID="Button1" runat="server" Text="添加文件" OnClick="BtnAdd_Click" BorderColor="Gray" BorderWidth="1px" />
            <asp:Button ID="BtnUpFile" runat="server" OnClick="BtnUpFile_Click" Text="上传文件" BorderColor="Gray" BorderWidth="1px" />
          </td>
        </tr>
    </table>

    <!--
    <br /></br></br>
    <input id="btnUpload" style="width: 71px" type="button" value="上 传" onclick="submitForm()" /> 

    -->
    </form>
</body>
</html>
