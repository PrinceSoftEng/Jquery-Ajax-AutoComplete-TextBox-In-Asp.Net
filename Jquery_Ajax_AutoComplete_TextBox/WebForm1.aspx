<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Jquery_Ajax_AutoComplete_TextBox.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css"
        rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtSearch").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: 'POST',
                        url: 'WebForm1.aspx/GetRoleNameBySearch',                        
                        dataType: 'json',
                        data: '{ "searchTerm": "' + request.term + '"}',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (err) {
                            alert("show error");
                        }
                    });
                },
                minLength: 1 // Minimum characters required to trigger autocomplete
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <b>Enter some data:</b>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
