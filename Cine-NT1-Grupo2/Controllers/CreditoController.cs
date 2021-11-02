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
    public class CreditoController : Controller
    {
        private readonly CineContext _context;

        public CreditoController(CineContext context)
        {
            _context = context;
        }

        // GET: Credito
        public async Task<IActionResult> Index()
        {
            return View(await _context.Credito.ToListAsync());
        }

        // GET: Credito/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var credito = await _context.Credito
                .FirstOrDefaultAsync(m => m.Id == id);
            if (credito == null)
            {
                return NotFound();
            }

            return View(credito);
        }

        // GET: Credito/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Credito/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("cantidadCuotas,Id,FechaDeVencimiento,CodigoSeguridad,Nombre")] Credito credito)
        {
            if (ModelState.IsValid)
            {
                _context.Add(credito);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(credito);
        }

        // GET: Credito/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var credito = await _context.Credito.FindAsync(id);
            if (credito == null)
            {
                return NotFound();
            }
            return View(credito);
        }

        // POST: Credito/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("cantidadCuotas,Id,FechaDeVencimiento,CodigoSeguridad,Nombre")] Credito credito)
        {
            if (id != credito.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(credito);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CreditoExists(credito.Id))
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
            return View(credito);
        }

        // GET: Credito/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var credito = await _context.Credito
                .FirstOrDefaultAsync(m => m.Id == id);
            if (credito == null)
            {
                return NotFound();
            }

            return View(credito);
        }

        // POST: Credito/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var credito = await _context.Credito.FindAsync(id);
            _context.Credito.Remove(credito);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CreditoExists(int id)
        {
            return _context.Credito.Any(e => e.Id == id);
        }
    }
}
