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
    public partial class Departamentos : System.Web.UI.Page
    {
        Conexion con = new Conexion();//Se crea objeto de la clase conexion.
        MySqlCommand com = new MySqlCommand();//Se crean objeto de tipo MySqlCommand.
        MySqlCommand cn = new MySqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            llenarTabla();//Se instancia la funcion
        }

        //Funcion que muestra los datos de la tabla en un gridview
        public void llenarTabla()
        {
            try
            {
                MySqlDataAdapter dt = new MySqlDataAdapter("SELECT *FROM departamentos", con.nuevaConexion());
                DataSet ta = new DataSet();
                dt.Fill(ta);
                TablaDepartamentos.DataSource = ta.Tables[0];
                TablaDepartamentos.DataBind();
                con.Cerrar();

            }
            catch (OdbcException ex)
            {
                Response.Write("<script>window.alert('Error Al Llenar Tabla')</script>");
            }
        }

        //Ingresa los datos a travez de un procedimiento almacendo.
        protected void Ingresar_Click(object sender, EventArgs e)
        {
            if (Codigo.Text != "" || Nombre.Text != "")
            {
                try
                {
                    cn = new MySqlCommand("CALL SP_INGRESAR_DEPARTAMENTO ('" + Codigo.Text + "','"
                        + Nombre.Text + "')", con.nuevaConexion());

                    cn.ExecuteNonQuery();
                    con.Cerrar();

                    Response.Write("<script>window.alert('Departamento Ingresado Existosamente')</script>");
                }
                catch (OdbcException ex)
                {
                    Response.Write("<script>window.alert('Error Al Ingresar Departamento')</script>");
                }
            }
            else
            {
                Response.Write("<script>window.alert('Existe Campos Vacio')</script>");
            }

            llenarTabla();
            Codigo.Text = "";
            Nombre.Text = "";
        }

        //Actualiza los datos a travez de un procedimiento almacendo.
        protected void Modificar_Click(object sender, EventArgs e)
        {
            if (Codigo.Text != "" || Nombre.Text != "")
            {
                try
                {
                    cn = new MySqlCommand("CALL SP_MODIFICAR_DEPARTAMENTO ('" + Codigo.Text + "','"
                        + Nombre.Text + "')", con.nuevaConexion());

                    cn.ExecuteNonQuery();
                    con.Cerrar();
                    Response.Write("<script>window.alert('Departamento Modificado Existosamente')</script>");
                }
                catch (OdbcException ex)
                {
                    Response.Write("<script>window.alert('Error Al Modificar Departamento')</script>");
                }
            }
            else
            {
                Response.Write("<script>window.alert('Existe Campos Vacio')</script>");
            }

            llenarTabla();
            Codigo.Text = "";
            Nombre.Text = "";
        }

        //Elimina los datos a travez de un procedimiento almacendo.
        protected void Eliminar_Click(object sender, EventArgs e)
        {
            if (Codigo.Text != "")
            {
                try
                {
                    cn = new MySqlCommand("CALL SP_ELIMINAR_DEPARTAMENTO ('" + Codigo.Text + "')", con.nuevaConexion());

                    cn.ExecuteNonQuery();
                    con.Cerrar();
                    Response.Write("<script>window.alert('Departamento Eliminado Existosamente')</script>");
                }
                catch (OdbcException er)
                {
                    Response.Write("<script>window.alert('Error Al Eliminar Departamento')</script>");
                }
            }
            else
            {
                Response.Write("<script>window.alert('Campo De Codigo Vacio')</script>");
            }

            llenarTabla();
            Codigo.Text = "";
            Nombre.Text = "";
        }
    }
}