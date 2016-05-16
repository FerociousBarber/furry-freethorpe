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
    public class MatchEventsController : Controller
    {
        private TeamManagerContext db = new TeamManagerContext();

        // GET: MatchEvents
        public ActionResult Index()
        {
            return View(db.MatchEvent.ToList());
        }

        // GET: MatchEvents/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MatchEvent matchEvent = db.MatchEvent.Find(id);
            if (matchEvent == null)
            {
                return HttpNotFound();
            }
            return View(matchEvent);
        }

        // GET: MatchEvents/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MatchEvents/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MatchEventID,PlayerID,MatchID")] MatchEvent matchEvent)
        {
            if (ModelState.IsValid)
            {
                db.MatchEvent.Add(matchEvent);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(matchEvent);
        }

        // GET: MatchEvents/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MatchEvent matchEvent = db.MatchEvent.Find(id);
            if (matchEvent == null)
            {
                return HttpNotFound();
            }
            return View(matchEvent);
        }

        // POST: MatchEvents/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MatchEventID,PlayerID,MatchID")] MatchEvent matchEvent)
        {
            if (ModelState.IsValid)
            {
                db.Entry(matchEvent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(matchEvent);
        }

        // GET: MatchEvents/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MatchEvent matchEvent = db.MatchEvent.Find(id);
            if (matchEvent == null)
            {
                return HttpNotFound();
            }
            return View(matchEvent);
        }

        // POST: MatchEvents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MatchEvent matchEvent = db.MatchEvent.Find(id);
            db.MatchEvent.Remove(matchEvent);
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
