<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebService.aspx.cs" Inherits="PruebaWebMysql.WebForms.WebService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>WebService</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container-fluid">
                <h1 align="center">WebService</h1>
            </div>
        </header>
        <div align="center" class="container-fluid">
            <nav class="navbar navbar-dark bg-primary">
                 <a class="navbar-brand" href="Index.aspx">Empleados</a>

                <a class="navbar-brand" href="Departamentos.aspx">Departamentos</a>

                <a class="navbar-brand" href="Contrato.aspx">Registros</a>

                <a class="navbar-brand" href="WebService.aspx">WebService</a>
            </nav>
        </div>
        <div class="row">
            <div class="col-md-4">

            </div>
            <div class="col-md-4">
                <asp:Button class="btn btn-outline-warning" ID="Consul" runat="server" Text="Consultar" OnClick="Consultar_Click"/>
                <asp:GridView ID="TablaWebService" runat="server"></asp:GridView>
            </div>
            <div class="col-md-4">
                
            </div>
        </div>

        <footer class="container-fluid" style="background:#CDCDCD">
            <h3><small>Giovanni Roque</small></h3>
        </footer>
    </form>
</body>
</html>
