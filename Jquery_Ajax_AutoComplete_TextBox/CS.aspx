<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CS.aspx.cs" Inherits="Jquery_Ajax_AutoComplete_TextBox.CS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css"
        rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("[id=txtUserName]").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        url: '<%=ResolveUrl("~/CS.aspx/GetRolesName") %>',
                        data: '{ "prefixText": "' + request.term + '"}',
                        dataType: "json",                        
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.split('-')[0],
                                    val: item.split('-')[1]
                                }
                            }))
                        },
                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                    });
                },               
                minLength: 1
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <b>Enter UserName To Search:</b>
        <asp:TextBox ID="txtUserName" runat="server" CssClass="autosuggest"></asp:TextBox>
    </form>
</body>
</html>
