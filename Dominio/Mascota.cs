using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Mascota
    {
        public long ID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Edad { get; set; }
        public string Raza { get; set; }
        public string Color { get; set; }
        public Sexo_Mascota Sexo { get; set; }
        public Tipo_Mascota Tipo { get; set; }
        public Tamaño_Mascota Tamaño { get; set; }
        public Comportamiento_Mascota Comportamiento { get; set; }
        public string Ubicacion { get; set; }
        public List<Imagen_Mascota> Imagenes { get; set; }
        public string Link { get; set; }
        public DateTime Fecha_Alta { get; set; }
        public bool Estado { get; set; }

        public Mascota()
        {
            Imagenes = new List<Imagen_Mascota>();
            Tipo = new Tipo_Mascota();
            Sexo = new Sexo_Mascota();
            Tamaño = new Tamaño_Mascota();
            Comportamiento = new Comportamiento_Mascota();
        }
    }
}
