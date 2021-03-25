<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contrato.aspx.cs" Inherits="PruebaWebMysql.WebForms.Contrato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Contrato</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container">
                <h1 align="center">Registros</h1>
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
                <div class="col-xs-12 col-md-5">
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Codigo</label>
                        <asp:TextBox ID="Codigo" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Empleado</label>
                        <asp:DropDownList ID="Empleados" class="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Departamento</label>
                        <asp:DropDownList ID="Departamento" class="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Puesto</label>
                        <asp:TextBox ID="Puesto" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Jerarquia</label>
                        <asp:TextBox ID="Jerarquia" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Sueldo</label>
                        <asp:TextBox ID="Sueldo" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Fecha Ingreso</label>
                        <asp:TextBox ID="FIngreso" type="date" class="form-control" runat="server" min="1990-01-01" max="2025-31-12"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Fecha Aumento</label>
                        <asp:TextBox ID="FAumento" type="date" class="form-control" runat="server" min="1990-01-01" max="2025-31-12"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Fecha Baja</label>
                        <asp:TextBox ID="FBaja" type="date" class="form-control" runat="server" min="1990-01-01" max="2025-31-12"></asp:TextBox>
                    </div>
                    <asp:Button class="btn btn-outline-success" ID="Ingresar" runat="server" Text="Ingresar" OnClick="Ingresar_Click"/>
                    <asp:Button class="btn btn-outline-primary" ID="Modificar" runat="server" Text="Modificar" OnClick="Modificar_Click"/>
                    <asp:Button class="btn btn-outline-danger" ID="Eliminar" runat="server" Text="Eliminar" OnClick="Eliminar_Click"/>
                </div>
                <div class="col-xs-12 col-md-7">
                    <div class="container-fluid">
                        <asp:GridView ID="TablaContratos" runat="server"></asp:GridView>
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
