using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Imagen_Mascota
    {
        public long ID { get; set; }
        public long ID_Mascota { get; set; }
        public string Link { get; set; }
        public string Alternate_Text { get; set; }
        public int Order { get; set; }
        public bool Estado { get; set; }

        public Imagen_Mascota() { }
    }
}
