using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PruebaWebMysql.WebService;
using System.Data.Odbc;
using System.Data;
using MySql.Data.MySqlClient;//Se utiliza libreria MySqlClient.

namespace PruebaWebMysql.WebForms
{
    public partial class WebService : System.Web.UI.Page
    {
        //Se crea objeto del WebService WsService para utilizar la funcion Consulta
        PruebaWebMysql.WebService.WebService Webf = new PruebaWebMysql.WebService.WebService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Consultar_Click(object sender, EventArgs e)
        {
            //Al momento de hacer clic al boton el gridview se llena de los datos de la funcion consulta
           TablaWebService.DataSource= Webf.Consulta();
           TablaWebService.DataBind();
        }
    }
}