<%@ Page Language="C#" AutoEventWireup="true" CodeFile="222.aspx.cs" Inherits="Admin_222" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>数据展示页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <br/><br/><br/>
    <div style="text-align: center">
            <asp:GridView ID="gridShow" runat="server" AutoGenerateColumns="False" Width="100%"
                OnPageIndexChanging="gridShow_PageIndexChanging" BorderColor="Black" 
                HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            x月
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="AdminID" HeaderText="指标1" />
                    <asp:BoundField DataField="AdminName" HeaderText="指标2" />
                    <asp:TemplateField HeaderText="指标3">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标4">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标5">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标6">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标7">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标8">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标9">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标10">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标11">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标12">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标13">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标14">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标15">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标16">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标17">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标18">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标19">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标20">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标21">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标22">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标23">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标24">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标25">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标26">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标27">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标28">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标29">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指标30">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <br/><br/><br/>

            <asp:Table ID="autoTable" runat="server" HorizontalAlign="Center"></asp:Table>


            <br/><br/><br/>

            <asp:Table ID="autoTable1" runat="server" HorizontalAlign="Center"></asp:Table>


            <br/><br/><br/>

        </div>
    </form>
</body>
</html>