using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.Odbc;
using MySql.Data.MySqlClient;//Se utiliza libreria MySqlClient.

namespace PruebaWebMysql.WebService
{
    /// <summary>
    /// Descripción breve de WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {
        //Se crea un webMethod que devuelve un DataSet
        [WebMethod]
        public DataSet Consulta()
        {
            Conexion con = new Conexion();//Objeto de la clase conexion
            try
            {
                //A traves del objeto de tipo MySqlDataAdapter se hace la consulta
                MySqlDataAdapter da = new MySqlDataAdapter("SELECT e.Nombre, e.Direccion, c.Fecha_Ingreso, e.No_Seguro,e.DPI,c.Sueldo"
                    + " FROM contratos c INNER JOIN empleados e ON c.DPI = e.DPI INNER JOIN departamentos d ON c.Codigo_Departamento = d.Codigo_Departamento", con.nuevaConexion());
                DataSet set = new DataSet();
                da.Fill(set);
                con.Cerrar();
                return set;
            }
            catch (Exception er) {
                return null;
            }
        }
    }
}
