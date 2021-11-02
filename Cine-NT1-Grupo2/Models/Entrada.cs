using System;
using System.Collections.Generic;
using System.Text;

namespace Cine_NT1_Grupo2.Models
{
   public class Entrada
    {
        public int EntradaId { get; set; }
        public Funcion Funcion { get; set; }
        public Asiento Asiento { get; set; }
        /*
        public Entrada(Funcion f, Asiento a)
        {
            this.funcion = f;
            this.asiento = a;
        }

        public Funcion Funcion
        {
            get { return funcion; }
            set { SetAtt(this.funcion, value); }
        }

        public Asiento Asiento
        {
            get { return asiento; }
            set { SetAtt(this.asiento, value); }
        }

        /// <summary>
        /// si x es null, se asigna y a x.
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        private void SetAtt(Object x, Object y)
        {
            if(x == null)
            {
                x = y;
            }
        }

        */
    }
}
