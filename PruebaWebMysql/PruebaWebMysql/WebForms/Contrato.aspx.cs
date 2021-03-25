using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using MySql.Data.MySqlClient;//Se utiliza libreria MySqlClient.


namespace PruebaWebMysql.WebForms
{

    public partial class Contrato : System.Web.UI.Page
    {
        Conexion con = new Conexion();//Se crea objeto de la clase conexion.
        MySqlCommand com = new MySqlCommand();//Se crean objeto de tipo MySqlCommand.
        MySqlCommand cn = new MySqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            llenarTabla();//Se instancia la funcion.
            llenarCombo();//Se instancia la funcion.
        }

        //Funcion que muestra los datos de la tabla en un gridview.
        public void llenarTabla()
        {
            try
            {
                MySqlDataAdapter dt = new MySqlDataAdapter("SELECT c.Codigo_Contratos as Codigo, e.Nombre,d.Nombre as Departamento, c.Puesto,c.Jerarquia,c.Sueldo,"
                                                         +"c.Fecha_Ingreso as FechaI, c.Fecha_Aumento as FechaA, c.Fecha_Baja as FechaB"
                                                         +" FROM contratos c INNER JOIN empleados e ON c.DPI = e.DPI INNER JOIN departamentos d ON c.Codigo_Departamento = d.Codigo_Departamento", con.nuevaConexion());
                DataSet ta = new DataSet();
                dt.Fill(ta);
                TablaContratos.DataSource = ta.Tables[0];
                TablaContratos.DataBind();
                con.Cerrar();

            }
            catch (OdbcException ex)
            {
                Response.Write("<script>window.alert('Error Al Llenar Tabla')</script>");
            }
        }

        //Funcion que muestra los datos en el combobox.
        public void llenarCombo() {
            try {
                MySqlCommand re = new MySqlCommand("Select Nombre FROM empleados",con.nuevaConexion());
                MySqlDataReader almacena = re.ExecuteReader();
                while (almacena.Read()==true) {
                    Empleados.Items.Add((string)almacena.GetValue(0));
                }
                almacena.Close();
                con.Cerrar();
            }
            catch (Exception ex)
            {
                Response.Write("<script>window.alert('Error Al Llenar ComboBox Empleados')</script>");
            }

            try
            {
                MySqlCommand re = new MySqlCommand("Select Nombre FROM departamentos", con.nuevaConexion());
                MySqlDataReader almacena = re.ExecuteReader();
                while (almacena.Read() == true)
                {
                   Departamento.Items.Add((string)almacena.GetValue(0));
                }
                almacena.Close();
                con.Cerrar();
            }
            catch (Exception ex)
            {
                Response.Write("<script>window.alert('Error Al Llenar ComboBox Departamentos')</script>");
            }
        }

        //Ingresa los datos a travez de un procedimiento almacendo.
        protected void Ingresar_Click(object sender, EventArgs e)
        {

            string DPIe="";
            string DepaC = "";
            if (Codigo.Text!=""||Empleados.Text!=""||Departamento.Text!=""||Puesto.Text!=""||Jerarquia.Text!=""||FIngreso.Text!=""||FAumento.Text!=""||FBaja.Text!=""||Sueldo.Text!="") {
                string nEmpleado = Empleados.SelectedItem.ToString();
                string nDepartamento = Departamento.SelectedItem.ToString();
                //Consulta el dpi del empleado obteniendo el texto del combobox con el nombre del empleado.
                try
                {
                    MySqlCommand sql = new MySqlCommand("Select DPI from empleados" +
                        " WHERE Nombre = '" + nEmpleado + "'", con.nuevaConexion());
                    MySqlDataReader almacena = sql.ExecuteReader();
                    while (almacena.Read() == true)
                    {
                        DPIe = almacena.GetString(0);
                    }
                    con.Cerrar();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>window.alert('Error Al Buscar DPI De ComboBox Empleados')</script>");
                }

                //Consulta el codigo del departamento obteniendo el texto del combobox con el nombre del departamento.
                try
                {
                    MySqlCommand sql = new MySqlCommand("Select Codigo_Departamento from departamentos" +
                        " WHERE Nombre = '" + nDepartamento + "'", con.nuevaConexion());
                    MySqlDataReader almacena = sql.ExecuteReader();
                    while (almacena.Read() == true)
                    {
                        DepaC = almacena.GetString(0);
                    }
                    con.Cerrar();
                }
                catch (Exception er)
                {
                    Response.Write("<script>window.alert('Error Al Buscar Codigo De ComboBox Departamentos')</script>");
                }

                try
                {
                    cn = new MySqlCommand("CALL SP_INGRESAR_CONTRATO ('" + Codigo.Text + "','"
                        + DPIe + "','"
                        + DepaC +"','"
                        + Puesto.Text+"','"
                        + Jerarquia.Text + "','"
                        + Sueldo.Text + "','"
                        + FIngreso.Text + "','"
                        + FAumento.Text + "','"
                        + FBaja.Text + "')", con.nuevaConexion());

                    cn.ExecuteNonQuery();
                    con.Cerrar();

                    Response.Write("<script>window.alert('Registro Ingresado Existosamente')</script>");
                }
                catch (OdbcException ex)
                {
                    Response.Write("<script>window.alert('Error Al Ingresar Registro')</script>");
                }

                llenarTabla();
                Codigo.Text = "";
                Puesto.Text = "";
                Jerarquia.Text = "";
                Sueldo.Text = "";
                FIngreso.Text = "";
                FAumento.Text = "";
                FBaja.Text = "";
            }
            else {
                Response.Write("<script>window.alert('Existe Campos Vacio')</script>");
            }
        }

        //Actualiza los datos a travez de un procedimiento almacendo.
        protected void Modificar_Click(object sender, EventArgs e)
        {
            string DPIe = "";
            string DepaC = "";
            if (Codigo.Text != "" || Empleados.Text != "" || Departamento.Text != "" || Puesto.Text != "" || Jerarquia.Text != "" || FIngreso.Text != "" || FAumento.Text != "" || FBaja.Text != "" || Sueldo.Text != "")
            {
                string nEmpleado = Empleados.SelectedItem.ToString();
                string nDepartamento = Departamento.SelectedItem.ToString();
                //consulta el codigo de la carrera obteniendo el texto del combobox con el nombre del proveedor
                try
                {
                    MySqlCommand sql = new MySqlCommand("Select DPI from empleados" +
                        " WHERE Nombre = '" + nEmpleado + "'", con.nuevaConexion());
                    MySqlDataReader almacena = sql.ExecuteReader();
                    while (almacena.Read() == true)
                    {
                        DPIe = almacena.GetString(0);
                    }
                    con.Cerrar();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>window.alert('Error Al Buscar DPI De ComboBox Empleados')</script>");
                }

                try
                {
                    MySqlCommand sql = new MySqlCommand("Select Codigo_Departamento from departamentos" +
                        " WHERE Nombre = '" + nDepartamento + "'", con.nuevaConexion());
                    MySqlDataReader almacena = sql.ExecuteReader();
                    while (almacena.Read() == true)
                    {
                        DepaC = almacena.GetString(0);
                    }
                    con.Cerrar();
                }
                catch (Exception er)
                {
                    Response.Write("<script>window.alert('Error Al Buscar Codigo De ComboBox Departamentos')</script>");
                }

                try
                {
                    cn = new MySqlCommand("CALL SP_MODIFICAR_CONTRATO ('" + Codigo.Text + "','"
                        + DPIe + "','"
                        + DepaC + "','"
                        + Puesto.Text + "','"
                        + Jerarquia.Text + "','"
                        + Sueldo.Text + "','"
                        + FIngreso.Text + "','"
                        + FAumento.Text + "','"
                        + FBaja.Text + "')", con.nuevaConexion());

                    cn.ExecuteNonQuery();
                    con.Cerrar();
                    Response.Write("<script>window.alert('Registro Modificado Existosamente')</script>");
                }
                catch (OdbcException ex)
                {
                    Response.Write("<script>window.alert('Error Al Modificar Registro')</script>");
                }

                llenarTabla();
                Codigo.Text = "";
                Puesto.Text = "";
                Jerarquia.Text = "";
                Sueldo.Text = "";
                FIngreso.Text = "";
                FAumento.Text = "";
                FBaja.Text = "";
            }
            else
            {
                Response.Write("<script>window.alert('Existe Campos Vacio')</script>");
            }
        }

        //Elimina los datos a travez de un procedimiento almacendo.
        protected void Eliminar_Click(object sender, EventArgs e)
        {
            if (Codigo.Text != "")
            {
                try {

                    cn = new MySqlCommand("CALL SP_ELIMINAR_CONTRATO ('" + Codigo.Text + "')", con.nuevaConexion());

                    cn.ExecuteNonQuery();
                    con.Cerrar();
                    Response.Write("<script>window.alert('Registro Eliminado Existosamente')</script>");
                }
                catch (Exception er) {
                    Response.Write("<script>window.alert('Error Al Eliminar Registro')</script>");
                }
            }
            else {
                Response.Write("<script>window.alert('Campo Codigo Vacio')</script>");
            }
            llenarTabla();
            Codigo.Text = "";
            Puesto.Text = "";
            Jerarquia.Text = "";
            Sueldo.Text = "";
            FIngreso.Text = "";
            FAumento.Text = "";
            FBaja.Text = "";
        }
    }
}