using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Data;
using MySql.Data.MySqlClient;//Se utiliza libreria MySqlClient.

namespace PruebaWebMysql.WebForms
{
    public partial class Index : System.Web.UI.Page
    {
        Conexion con = new Conexion();//Se crea objeto de la clase conexion.
        MySqlCommand com = new MySqlCommand();//Se crean objeto de tipo MySqlCommand.
        MySqlCommand cn = new MySqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            llenarTabla();//Se instancia la funcion
        }


        //Funcion que muestra los datos de la tabla en un gridview
        public void llenarTabla() {
            try {
                MySqlDataAdapter dt = new MySqlDataAdapter("SELECT *FROM empleados",con.nuevaConexion());
                DataSet ta = new DataSet();
                dt.Fill(ta);
                TablaEmpleados.DataSource=ta.Tables[0];
                TablaEmpleados.DataBind();
                con.Cerrar();
            }
            catch (OdbcException ex) {
                Response.Write("<script>window.alert('Error Al Llenar Tabla')</script>");
            }
        }


        //Ingresa los datos a travez de un procedimiento almacendo.
        protected void Ingresar_Click(object sender, EventArgs e)
        {
            if (DPI.Text!=""||Nombre.Text!=""||Apellidos.Text!=""||Direccion.Text!=""||Seguro.Text!=""||Telefono.Text!="") {

                try
                {
                    cn = new MySqlCommand("CALL SP_INGRESAR_EMPLEADO ('" + DPI.Text + "','"
                        + Nombre.Text + "','"
                        + Apellidos.Text + "','"
                        + Direccion.Text + "','"
                        + Seguro.Text + "','"
                        + Telefono.Text + "')", con.nuevaConexion());

                    cn.ExecuteNonQuery();
                    con.Cerrar();

                    Response.Write("<script>window.alert('Empleado Ingresado Existosamente')</script>");
                }
                catch (OdbcException ex)
                {
                    Response.Write("<script>window.alert('Error Al Ingresar Empleado')</script>");
                }
            }
            else {
                Response.Write("<script>window.alert('Existe Campos Vacio')</script>");
            }

            llenarTabla();
            DPI.Text = "";
            Nombre.Text = "";
            Apellidos.Text = "";
            Direccion.Text="";
            Seguro.Text = "";
            Telefono.Text = "";
        }

        //Actualiza los datos a travez de un procedimiento almacendo.
        protected void Modificar_Click(object sender, EventArgs e)
        {
            if (DPI.Text != "" || Nombre.Text != "" || Apellidos.Text != "" || Direccion.Text != "" || Seguro.Text != "" || Telefono.Text != "")
            {

                try
                {
                    cn = new MySqlCommand("CALL SP_MODIFICAR_EMPLEADO ('" + DPI.Text + "','"
                        + Nombre.Text + "','"
                        + Apellidos.Text + "','"
                        + Direccion.Text + "','"
                        + Seguro.Text + "','"
                        + Telefono.Text + "')", con.nuevaConexion());

                    cn.ExecuteNonQuery();

                    con.Cerrar();
                    Response.Write("<script>window.alert('Empleado Modificado Existosamente')</script>");
                }
                catch (OdbcException er)
                {
                    Response.Write("<script>window.alert('Error Al Modificar Empleado')</script>");
                }
            }
            else
            {
                Response.Write("<script>window.alert('Existe Campos Vacio')</script>");
            }

            llenarTabla();
            DPI.Text = "";
            Nombre.Text = "";
            Apellidos.Text = "";
            Direccion.Text = "";
            Seguro.Text = "";
            Telefono.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        //Elimina los datos a travez de un procedimiento almacendo.
        protected void Eliminar_Click(object sender, EventArgs e)
        {
            if (DPI.Text != "")
            {
                try
                {
                    cn = new MySqlCommand("CALL SP_ELIMINAR_EMPLEADO ('" + DPI.Text + "')", con.nuevaConexion());

                    cn.ExecuteNonQuery();

                    Response.Write("<script>window.alert('Empleado Eliminado Existosamente')</script>");
                    con.Cerrar();
                }
                catch (OdbcException er)
                {
                    Response.Write("<script>window.alert('Error Al Eliminar Empleado')</script>");
                }
            }
            else
            {
                Response.Write("<script>window.alert('Campo De DPI Vacio')</script>");
            }

            llenarTabla();
            DPI.Text = "";
            Nombre.Text = "";
            Apellidos.Text = "";
            Direccion.Text = "";
            Seguro.Text = "";
            Telefono.Text = "";
        }
    }
}