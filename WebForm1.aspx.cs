using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Xsl;
//inyeccion de dependecias

namespace Cafeteria
{
    public partial class WebForm1 : System.Web.UI.Page //herencia
    {
        public string tipoMenu = string.Empty;
        protected void Page_Load(object sender, EventArgs e)//evento
        {
            Label1.Text = "Hola desde el codeBehide";
            //recupero una variable que viene desde la URL, para ello valido si existe una variable llamada "Id", si no existe, pasamos un 0 como argumento ed lo contrario tomo su valor
            
            if (Request.QueryString["Id"] == null) {
                tipoMenu = "0";
            } else {
                tipoMenu = Request.QueryString["Id"];
            }
            TransformarXML();
        }
        //Metodo para cargar y transformar un XML usando XSLT
        private void TransformarXML()
        {

            //------------ Prepara los ingredientes ------------

            //recuperamos las rutas de nuestros XML y XSLT
            string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString()+"xml/menu.xml";
            string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString()+"xslt/template.xslt";

            //leer el archivo XML (importamos "using System.Xml;")
            XmlTextReader xmTextReader = new XmlTextReader(xmlPath);//se puede usar try cath

            //Configuramos las credenciales para resolver recursos externos coo el XSLT
            XmlUrlResolver xmlUrlResolver = new XmlUrlResolver();
            xmlUrlResolver.Credentials = CredentialCache.DefaultCredentials;

            //crear las configuraciones para poder acceder al XSLT
            //los parametros "true" sirven para:
            /*1. tratar el XSLT como documento que puede ser transformado
              2. Permitiri la ejecucion de bloques de codigo JS como resultado de la transformacion*/
            XsltSettings settings = new XsltSettings(true, true);

            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load(xsltPath, settings, xmlUrlResolver);

            //------------ se empieza a crear ------------
            //creamos un StringBuilder para almacenar el resultado de la transformacion
                //primer canasta
            StringBuilder stringBuilder = new StringBuilder();
            TextWriter textWriter = new StringWriter(stringBuilder);//TextWriter constantemente genera unas cadenas
                
            //configuramos los argumentos para la transformaion
                //segunda canasta
            XsltArgumentList xsltArgumentList = new XsltArgumentList();
            xsltArgumentList.AddParam("TipoMenu", "", tipoMenu); // es local

                //tercera canasta
            //transformamos el XML => HTML usando XSLT
            xslt.Transform(xmTextReader, xsltArgumentList, textWriter);
            
                //aqui llena la primera canasta
            //obtenemos el resultado de la transformacion como 1 sola cadena
            string resultado = stringBuilder.ToString();

            //escribmos el resultado como una respuesta HTTP
            Response.Write(resultado);
        }
    }
}