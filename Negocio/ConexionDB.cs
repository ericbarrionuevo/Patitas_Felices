using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ConexionDB
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;

        public ConexionDB()
        {
            string strCon = ConfigurationManager.ConnectionStrings["CS1"].ConnectionString;
            conexion = new SqlConnection(strCon);
            comando = new SqlCommand();
        }

        public void EjecutarConsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
            comando.Connection = conexion;
            conexion.Open();
            lector = comando.ExecuteReader();
        }

        public SqlDataReader Lector
        {
            get { return lector; }
        }

        public void CerrarConexion()
        {
            if (lector != null)
                lector.Close();
            conexion.Close();
        }
    }
}