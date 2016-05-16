using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TeamManager.DAL;
using TeamManager.Models;

namespace TeamManager.Controllers
{
    public class PlayerRolesController : Controller
    {
        private TeamManagerContext db = new TeamManagerContext();

        // GET: PlayerRoles
        public ActionResult Index()
        {
            return View(db.PlayerRole.ToList());
        }

        // GET: PlayerRoles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlayerRole playerRole = db.PlayerRole.Find(id);
            if (playerRole == null)
            {
                return HttpNotFound();
            }
            return View(playerRole);
        }

        // GET: PlayerRoles/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PlayerRoles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PlayerRoleID,PlayerRoleDesc")] PlayerRole playerRole)
        {
            if (ModelState.IsValid)
            {
                db.PlayerRole.Add(playerRole);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(playerRole);
        }

        // GET: PlayerRoles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlayerRole playerRole = db.PlayerRole.Find(id);
            if (playerRole == null)
            {
                return HttpNotFound();
            }
            return View(playerRole);
        }

        // POST: PlayerRoles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PlayerRoleID,PlayerRoleDesc")] PlayerRole playerRole)
        {
            if (ModelState.IsValid)
            {
                db.Entry(playerRole).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(playerRole);
        }

        // GET: PlayerRoles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlayerRole playerRole = db.PlayerRole.Find(id);
            if (playerRole == null)
            {
                return HttpNotFound();
            }
            return View(playerRole);
        }

        // POST: PlayerRoles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PlayerRole playerRole = db.PlayerRole.Find(id);
            db.PlayerRole.Remove(playerRole);
            db.SaveChanges();
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
