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
    public class DebitoController : Controller
    {
        private readonly CineContext _context;

        public DebitoController(CineContext context)
        {
            _context = context;
        }

        // GET: Debito
        public async Task<IActionResult> Index()
        {
            return View(await _context.Debito.ToListAsync());
        }

        // GET: Debito/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var debito = await _context.Debito
                .FirstOrDefaultAsync(m => m.Id == id);
            if (debito == null)
            {
                return NotFound();
            }

            return View(debito);
        }

        // GET: Debito/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Debito/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,FechaDeVencimiento,CodigoSeguridad,Nombre")] Debito debito)
        {
            if (ModelState.IsValid)
            {
                _context.Add(debito);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(debito);
        }

        // GET: Debito/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var debito = await _context.Debito.FindAsync(id);
            if (debito == null)
            {
                return NotFound();
            }
            return View(debito);
        }

        // POST: Debito/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,FechaDeVencimiento,CodigoSeguridad,Nombre")] Debito debito)
        {
            if (id != debito.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(debito);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DebitoExists(debito.Id))
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
            return View(debito);
        }

        // GET: Debito/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var debito = await _context.Debito
                .FirstOrDefaultAsync(m => m.Id == id);
            if (debito == null)
            {
                return NotFound();
            }

            return View(debito);
        }

        // POST: Debito/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var debito = await _context.Debito.FindAsync(id);
            _context.Debito.Remove(debito);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool DebitoExists(int id)
        {
            return _context.Debito.Any(e => e.Id == id);
        }
    }
}
