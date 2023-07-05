using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AppBomberos.Models
{
   public class GestorUsuarios
   {
      public List<Usuario> getUsuario()
      {
         List<Usuario> lista = new List<Usuario>();
         string strConn = ConfigurationManager.ConnectionStrings["BomberosDB"].ToString();

         using (SqlConnection conn = new SqlConnection(strConn))
         {
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Usuarios_All";
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
               int dni = dr.GetInt32(0);
               string apellido = dr.GetString(1).Trim();
               string nombre = dr.GetString(2).Trim();
               int id_Jerarquia = dr.GetInt32(3);
               bool estado = dr.GetBoolean(4);

               Usuario usuario = new Usuario(dni, apellido, nombre, id_Jerarquia, estado);

               lista.Add(usuario);
            }

            dr.Close();
            conn.Close();
         }

         return lista;
      }

      public bool addUsuario(Usuario usuario)
      {
         bool res = false;

         string strConn = ConfigurationManager.ConnectionStrings["BomberosDB"].ToString();

         using (SqlConnection conn = new SqlConnection(strConn))
         {
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.CommandText = "Usuarios_Add";
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@DNI", usuario.DNI);
            cmd.Parameters.AddWithValue("@Apellido", usuario.Apellido);
            cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
            cmd.Parameters.AddWithValue("@id_Jerarquia", usuario.ID_Jerarquia);
            cmd.Parameters.AddWithValue("@estado", usuario.Estado);

            try
            {
               conn.Open();
               cmd.ExecuteNonQuery();
               res = true;
            }
            catch (Exception ex)
            {
               Console.WriteLine(ex.Message);
               res = false;
               throw;
            }
            finally
            {
               cmd.Parameters.Clear();
               conn.Close();
            }

            return res;
         }
      }

      public bool updateUsuario(int dni, Usuario usuario)
      {
         bool res = false;

         string strConn = ConfigurationManager.ConnectionStrings["BomberosDB"].ToString();

         using (SqlConnection conn = new SqlConnection(strConn))
         {
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.CommandText = "Usuarios_Update";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DNI", dni);
            cmd.Parameters.AddWithValue("@Apellido", usuario.Apellido);
            cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
            cmd.Parameters.AddWithValue("@id_Jerarquia", usuario.ID_Jerarquia);
            cmd.Parameters.AddWithValue("@estado", usuario.Estado);

            try
            {
               conn.Open();
               cmd.ExecuteNonQuery();
               res = true;
            }
            catch (Exception ex)
            {
               Console.WriteLine(ex.Message);
               res = false;
               throw;
            }
            finally
            {
               cmd.Parameters.Clear();
               conn.Close();
            }

            return res;
         }
      }

      public bool deleteUsuario(int dni)
      {
         bool res = false;

         string strConn = ConfigurationManager.ConnectionStrings["BomberosDB"].ToString();

         using (SqlConnection conn = new SqlConnection(strConn))
         {
            SqlCommand cmd = conn.CreateCommand();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.CommandText = "Usuarios_Delete";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DNI", dni);

            try
            {
               conn.Open();
               cmd.ExecuteNonQuery();
               res = true;
            }
            catch (Exception ex)
            {
               Console.WriteLine(ex.Message);
               res = false;
               throw;
            }
            finally
            {
               cmd.Parameters.Clear();
               conn.Close();
            }

            return res;
         }
      }
   }
}