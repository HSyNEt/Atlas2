using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Atlas;

namespace Atlas.Controllers
{
    public class AdminController : Controller
    {
        private EntityDtsEntities db = new EntityDtsEntities();

        // GET: Admin
        public async Task<ActionResult> Index()
        {
            return View(await db.iOrders.ToListAsync());
        }

        // GET: Admin/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            iOrders iOrders = await db.iOrders.FindAsync(id);
            if (iOrders == null)
            {
                return HttpNotFound();
            }
            return View(iOrders);
        }

        // GET: Admin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "id,product_id,account_id,order_delivery,order_price,product_name")] iOrders iOrders)
        {
            if (ModelState.IsValid)
            {
                db.iOrders.Add(iOrders);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(iOrders);
        }

        // GET: Admin/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            iOrders iOrders = await db.iOrders.FindAsync(id);
            if (iOrders == null)
            {
                return HttpNotFound();
            }
            return View(iOrders);
        }

        // POST: Admin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "id,product_id,account_id,order_delivery,order_price,product_name")] iOrders iOrders)
        {
            if (ModelState.IsValid)
            {
                db.Entry(iOrders).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(iOrders);
        }

        // GET: Admin/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            iOrders iOrders = await db.iOrders.FindAsync(id);
            if (iOrders == null)
            {
                return HttpNotFound();
            }
            return View(iOrders);
        }

        // POST: Admin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            iOrders iOrders = await db.iOrders.FindAsync(id);
            db.iOrders.Remove(iOrders);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
