using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Cine_NT1_Grupo2.Context;
using Cine_NT1_Grupo2.Models;

namespace Cine_NT1_Grupo2.Controllers
{
    public class TarjetaController : Controller
    {
        private readonly CineContext _context;

        public TarjetaController(CineContext context)
        {
            _context = context;
        }

        // GET: Tarjeta
        public async Task<IActionResult> Index()
        {
            return View(await _context.Tarjeta.ToListAsync());
        }

        // GET: Tarjeta/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tarjeta = await _context.Tarjeta
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tarjeta == null)
            {
                return NotFound();
            }

            return View(tarjeta);
        }

        // GET: Tarjeta/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Tarjeta/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,FechaDeVencimiento,CodigoSeguridad,Nombre")] Tarjeta tarjeta)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tarjeta);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tarjeta);
        }

        // GET: Tarjeta/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tarjeta = await _context.Tarjeta.FindAsync(id);
            if (tarjeta == null)
            {
                return NotFound();
            }
            return View(tarjeta);
        }

        // POST: Tarjeta/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,FechaDeVencimiento,CodigoSeguridad,Nombre")] Tarjeta tarjeta)
        {
            if (id != tarjeta.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tarjeta);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TarjetaExists(tarjeta.Id))
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
            return View(tarjeta);
        }

        // GET: Tarjeta/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tarjeta = await _context.Tarjeta
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tarjeta == null)
            {
                return NotFound();
            }

            return View(tarjeta);
        }

        // POST: Tarjeta/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tarjeta = await _context.Tarjeta.FindAsync(id);
            _context.Tarjeta.Remove(tarjeta);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TarjetaExists(int id)
        {
            return _context.Tarjeta.Any(e => e.Id == id);
        }
    }
}
