<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true"
    CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="right-frame-content">
        <div class="center-title">
            输入账号,真实姓名,或级别进行查询：
            <asp:TextBox ID="txtKey" runat="server" Width="77px"></asp:TextBox>&nbsp;
            <asp:Button ID="btnFind" runat="server" OnClick="btnFind_Click" Text="查找" Width="43px" />&nbsp;
            <asp:Button ID="btnShowAll" runat="server" OnClick="btnShowAll_Click" Text="显示全部"
                Width="74px" />
            <asp:Button ID="btnAdd" runat="server" Text="添加" Width="89px" OnClick="btnAdd_Click" /><br />
        </div>
        <div style="text-align: center">
            <asp:GridView ID="gridAdmin" runat="server" AutoGenerateColumns="False" Width="565px"
                OnPageIndexChanging="gridAdmin_PageIndexChanging" BorderColor="Black" 
                HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="AdminID" HeaderText="序号" />
                    <asp:BoundField DataField="AdminName" HeaderText="账号" />
                    <asp:TemplateField HeaderText="密码">
                        <ItemTemplate>
                            ******
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="AdminRealName" HeaderText="真实姓名" />
                    <asp:BoundField DataField="AdminGradeID" HeaderText="级别" />
                    <asp:BoundField DataField="AdminGradeName" HeaderText="级别名称" />
                    <asp:HyperLinkField DataNavigateUrlFields="AdminID" DataNavigateUrlFormatString="AdminModify.aspx?id={0}"
                        HeaderText="修改" Text="修改" />
                    <asp:HyperLinkField DataNavigateUrlFields="AdminID" DataNavigateUrlFormatString="AdminDelete.aspx?id={0}"
                        HeaderText="删除" Text="删除" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
