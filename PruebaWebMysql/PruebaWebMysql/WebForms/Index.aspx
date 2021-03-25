<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PruebaWebMysql.WebForms.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Index</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container">
                <h1 align="center">Empleados</h1>
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
        <div class="container">
            <div class="main row">
                <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">DPI</label>
                            <asp:TextBox ID="DPI" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Nombre</label>
                            <asp:TextBox ID="Nombre" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Apellidos</label>
                            <asp:TextBox ID="Apellidos" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Direccion</label>
                            <asp:TextBox ID="Direccion" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">No. Seguro</label>
                            <asp:TextBox ID="Seguro" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Telefono</label>
                            <asp:TextBox ID="Telefono" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    
                    <asp:Button class="btn btn-outline-success" ID="Ingresar" runat="server" Text="Ingresar" OnClick="Ingresar_Click"/>
                    <asp:Button class="btn btn-outline-primary" ID="Modificar" runat="server" Text="Modificar" OnClick="Modificar_Click"/>
                    <asp:Button class="btn btn-outline-danger" ID="Eliminar" runat="server" Text="Eliminar" OnClick="Eliminar_Click"/>
                </div>
                <div class="col-xs-12 col-md-6">
                    <div class="container-fluid">
                        <asp:GridView ID="TablaEmpleados" runat="server"></asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <footer class="container-fluid" style="background:#CDCDCD">
            <h3><small>Giovanni Roque</small></h3>
        </footer>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
