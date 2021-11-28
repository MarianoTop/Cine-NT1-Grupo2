using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Cine_NT1_Grupo2.Context;
using Cine_NT1_Grupo2.Models;
using Microsoft.AspNetCore.Authorization;

namespace Cine_NT1_Grupo2.Controllers
{
    [Authorize]
    public class EntradaController : Controller
    {
        private readonly CineContext _context;

        public EntradaController(CineContext context)
        {
            _context = context;
        }

        // GET: Entrada
        public async Task<IActionResult> Index()
        {
            return View(await _context.Entrada.Include(entrada => entrada.Funcion.Pelicula)
                .Include(entrada => entrada.Funcion.Asientos).ToListAsync());
        }

        // GET: Entrada/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var entrada = await _context.Entrada
                .FirstOrDefaultAsync(m => m.EntradaId == id);
            if (entrada == null)
            {
                return NotFound();
            }

            return View(entrada);
        }

        // GET: Entrada/Create
        public IActionResult Create()
        {

            var entradasAElegir = from s in _context.Pelicula
                               select s;

            /* var entradasAElegir = _context.Funcion.Include(funcion => funcion.Pelicula).ToList();*/
            /*ViewBag.Funciones = (from item in entradasAElegir 
                                 select new SelectListItem
                                 {
                                     Text= item.Pelicula.Nombre,
                                     Value= item.Pelicula.Id.ToString()
                                 }
                );*/
            ViewBag.FuncionesPelis = new SelectList(entradasAElegir.ToList(), "Id", "Nombre");


            return View();
        }

        // POST: Entrada/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("FuncionId,ClienteId,AsientoId")] Entrada entrada)
        {
            if (ModelState.IsValid)
            {
                _context.Add(entrada);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(entrada);
        }

        // GET: Entrada/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var entrada = await _context.Entrada.FindAsync(id);
            if (entrada == null)
            {
                return NotFound();
            }
            return View(entrada);
        }

        // POST: Entrada/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("EntradaId")] Entrada entrada)
        {
            if (id != entrada.EntradaId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(entrada);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EntradaExists(entrada.EntradaId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(entrada);
        }

        // GET: Entrada/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var entrada = await _context.Entrada
                .FirstOrDefaultAsync(m => m.EntradaId == id);
            if (entrada == null)
            {
                return NotFound();
            }

            return View(entrada);
        }

        // POST: Entrada/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var entrada = await _context.Entrada.FindAsync(id);
            _context.Entrada.Remove(entrada);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool EntradaExists(int id)
        {
            return _context.Entrada.Any(e => e.EntradaId == id);
        }


        /*Este metodo deberia pasar un id de peli y traer todas las fechas posibles 
         Notar que el nombre del parametro debe coincidir con lo que se le envio del viewbag
         */ 
        public async Task<IActionResult> SelectFecha(int? IdPelicula)
        {
            if (IdPelicula == null)
            {
                return NotFound();
            }
      
            var pelicula = await _context.Pelicula.FindAsync(IdPelicula);
            if (pelicula == null)
            {
                return NotFound();
            }

            var fechas = from s in _context.Funcion
                         where s.IdPelicula== IdPelicula
                         select s;

            ViewBag.FechasPelis = new SelectList(fechas.ToList(), "Id", "Fecha");

            return View(pelicula);
        }


        /*El siguiente metodo tiene por objetivo enviar los asientos de la funcion seleccionada */

        public async Task<IActionResult> SelectAsiento(int? IdFuncion)
        {
            if (IdFuncion == null)
            {
                return NotFound();
            }

            var funcion = await _context.Funcion.FindAsync(IdFuncion);
            if (funcion == null)
            {
                return NotFound();
            }
            /*trate de usar first or default pero me devuelve un solo elemento */
            /* var asientosTotales = from s in _context.Funcion
                                   where s.Id == IdFuncion
                                   select s.Asientos;
            */

            /*Al final era mas sencillo hacerlo de la forma tradicional 
             * https://www.tutorialsteacher.com/linq/linq-joining-operator-join
             * */

            /* creo que a futuro tendremos que crear un atributo para saber a quien le pertenece
        * sino siempre va a devolver todos, ademas tendremos que preguntar si es !null o algo similar*/

            var asientosTotales = from s in _context.Funcion
                                  join st in _context.Asiento
                                  on s.Id equals st.FuncionId
                                  where (s.Id == IdFuncion )
                                  orderby st.Fila ascending, st.Numero ascending
                                  select st;


          
       

            /* Al ser una lista creo que se devuelve distinto*/
            /* https://stackoverflow.com/questions/668589/how-can-i-add-an-item-to-a-selectlist-in-asp-net-mvc 
             https://stackoverflow.com/questions/14663971/using-linq-select-list-inside-list
             */


            List<SelectListItem> listaAsientos = new List<SelectListItem>();

            foreach(var  item in asientosTotales)
            {

                listaAsientos.Add(new SelectListItem()
                {
                    Text = item.Fila.ToString() + item.Numero.ToString(),
                    Value = item.Id.ToString()
                });


            }


            ViewBag.AsientoPeli = new SelectList(listaAsientos, "Value", "Text");

            return View(funcion);
        }


    }
}
