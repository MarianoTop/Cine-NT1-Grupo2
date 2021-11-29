using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cine_NT1_Grupo2.Controllers
{
    interface Seguridad
    {
        public byte [] EncriptarPass (string pass);
        public bool validarPass(string pass);
    }
}
