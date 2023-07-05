using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppBomberos.Models
{
   public class Usuario
   {
      public int DNI { get; set; }
      public string Apellido { get; set; }
      public string Nombre { get; set; }
      public int ID_Jerarquia { get; set; }
      public bool Estado { get; set; }

      public Usuario() { }

      public Usuario(int dni, string apellido, string nombre, int id_Jerarquia, bool estado)
      {
         DNI = dni;
         Apellido = apellido;
         Nombre = nombre;
         ID_Jerarquia = id_Jerarquia;
         Estado = estado;

      }

      public Usuario(string apellido, string nombre, int id_Jerarquia, bool estado)
      {
         Apellido = apellido;
         Nombre = nombre;
         ID_Jerarquia = id_Jerarquia;
         Estado = estado;
      }

   }
}