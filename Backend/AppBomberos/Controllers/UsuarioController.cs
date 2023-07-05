using AppBomberos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace AppBomberos.Controllers
{
   [EnableCors(origins: "*", headers: "*", methods: "GET, POST, PUT, DELETE, OPTIONS")]
   public class UsuarioController : ApiController
   {
      // GET: api/Usuario
      public IEnumerable<Usuario> Get()
      {
         GestorUsuarios gUsuario = new GestorUsuarios();
         return gUsuario.getUsuario();
      }

      // GET: api/Usuario/5
      public string Get(int id)
      {
         return "value";
      }

      // POST: api/Usuario
      public bool Post([FromBody] Usuario usuario)
      {
         GestorUsuarios gUsuario = new GestorUsuarios();
         bool res = gUsuario.addUsuario(usuario);

         return res;
      }

      // PUT: api/Usuario/5
      public bool Put(int id, [FromBody] Usuario usuario)
      {
         GestorUsuarios gUsuario = new GestorUsuarios();
         bool res = gUsuario.updateUsuario(id, usuario);

         return res;
      }

      // DELETE: api/Usuario/5
      public bool Delete(int id)
      {
         GestorUsuarios gUsuario = new GestorUsuarios();
         bool res = gUsuario.deleteUsuario(id);

         return res;
      }
   }
}
