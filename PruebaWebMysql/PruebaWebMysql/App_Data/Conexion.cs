using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Odbc;
using MySql.Data.MySqlClient;//Se utiliza libreria MySqlClient.

namespace PruebaWebMysql
{
    public class Conexion
    {
        //Se crea una funcion de tipo MySqlConnection para realizar la conexion.
        public MySqlConnection nuevaConexion() {
            try
            {
                //En objero con de tipo MySqlConnection se ingresa las credenciales para la conexion.
                MySqlConnection con = new MySqlConnection("server=localhost;uid=root;pwd=Giovanni.98*;database=pruebaempleados");
                //Se abre la conexion.
                con.Open();
                //Retorna la conexion.
                return con;
            }
            catch (MySqlException ex) {
                return null;
            }
        }

        //Funcion utilizada para cerrar conexion.
        public void Cerrar() {
            try {
                //En objero con de tipo MySqlConnection se ingresa las credenciales para la conexion.
                MySqlConnection con = new MySqlConnection("server=localhost;uid=root;pwd=Giovanni.98*;database=pruebaempleados");
                //Se cierra la conexion.
                con.Close();
            }
            catch (OdbcException ex) {
                
            }
        }
    }
    
}