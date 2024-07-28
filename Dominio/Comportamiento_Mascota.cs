using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Comportamiento_Mascota
    {
        public long ID { get; set; }
        public string Descripcion { get; set; }
        public bool Estado { get; set; }

        public Comportamiento_Mascota() { }
    }
}
